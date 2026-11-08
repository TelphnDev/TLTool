import 'dart:io';

/// Pour chaque dossier lib/pages/nom/ qui a un parent lib/pages/nom_page.dart
/// contenant les balises <gen:imports> et <gen:entries>, remplit ces balises
/// avec les pages du dossier (celles qui exposent `static ... entry`).
///
/// Usage :
///   dart run tool/gen_pages.dart          -> tous les dossiers
///   dart run tool/gen_pages.dart bdd      -> uniquement bdd
void main(List<String> args) {
  final root = Directory('lib/pages');
  final folders = root
      .listSync()
      .whereType<Directory>()
      .where((d) => args.isEmpty || args.contains(_name(d)))
      .toList()
    ..sort((a, b) => a.path.compareTo(b.path));

  for (final dir in folders) {
    _generate(dir);
  }
}

String _name(Directory d) => d.path.replaceAll('\\', '/').split('/').last;

void _generate(Directory dir) {
  final name = _name(dir);
  final base = dir.path.replaceAll('\\', '/');
  final parent = File('lib/pages/${name}_page.dart');

  if (!parent.existsSync()) return;
  var parentSrc = parent.readAsStringSync();
  if (!parentSrc.contains('<gen:imports>') ||
      !parentSrc.contains('<gen:entries>')) {
    stdout.writeln('$name : balises <gen:...> absentes, ignoré.');
    return;
  }

  final files = dir
      .listSync(recursive: true)
      .whereType<File>()
      .where((f) => f.path.endsWith('.dart'))
      .toList()
    ..sort((a, b) => a.path.compareTo(b.path));

  final imports = <String>[];
  final entries = <String>[];

  for (final f in files) {
    final src = f.readAsStringSync();
    final rel = f.path.replaceAll('\\', '/').replaceFirst('$base/', '');

    final entry = RegExp(r'static\s+(const|final)\s+(SubPageEntry\s+)?entry\b')
        .firstMatch(src);
    if (entry == null) {
      stdout.writeln('  - ignoré (pas de entry) : $name/$rel');
      continue;
    }

    // La classe qui contient `entry` = la dernière déclarée avant lui.
    final cls = RegExp(r'class\s+(\w+)')
        .allMatches(src)
        .where((m) => m.start < entry.start)
        .map((m) => m.group(1)!)
        .lastOrNull;
    if (cls == null) continue;

    imports.add("import '$name/$rel';");
    entries.add('$cls.entry,');
  }

  // Remplace le contenu entre les balises en gardant l'indentation.
  parentSrc = parentSrc.replaceAllMapped(
    RegExp(r'([ \t]*)// <gen:imports>\n[\s\S]*?[ \t]*// </gen:imports>'),
        (m) => '${m[1]}// <gen:imports>\n'
        '${imports.map((l) => '${m[1]}$l\n').join()}'
        '${m[1]}// </gen:imports>',
  );
  parentSrc = parentSrc.replaceAllMapped(
    RegExp(r'([ \t]*)// <gen:entries>\n[\s\S]*?[ \t]*// </gen:entries>'),
        (m) => '${m[1]}// <gen:entries>\n'
        '${entries.map((l) => '${m[1]}$l\n').join()}'
        '${m[1]}// </gen:entries>',
  );

  parent.writeAsStringSync(parentSrc);
  stdout.writeln('$name : ${entries.length} page(s) -> ${parent.path}');
}