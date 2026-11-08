import 'package:drift/drift.dart' hide Column, Table;
import 'package:flutter/material.dart';

import '../../../../data/bdd/database.dart' as bdd;
import '../logement_edit_page.dart';

/// Ouvre un sélecteur de logement avec recherche.
/// Retourne le logement choisi (ou créé), ou null si annulé.
Future<bdd.Logement?> choisirLogement(
    BuildContext context, {
      int? selectionId,
      bool permettreCreation = true,
    }) {
  return showModalBottomSheet<bdd.Logement>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    showDragHandle: true,
    builder: (ctx) => Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
      child: SizedBox(
        height: MediaQuery.of(ctx).size.height * 0.7,
        child: _Selecteur(
          selectionId: selectionId,
          permettreCreation: permettreCreation,
        ),
      ),
    ),
  );
}

class _Selecteur extends StatefulWidget {
  const _Selecteur({this.selectionId, required this.permettreCreation});

  final int? selectionId;
  final bool permettreCreation;

  @override
  State<_Selecteur> createState() => _SelecteurState();
}

class _SelecteurState extends State<_Selecteur> {
  String _q = '';
  late Stream<List<bdd.Logement>> _stream = _buildStream();

  Stream<List<bdd.Logement>> _buildStream() {
    final s = bdd.db.select(bdd.db.logements);
    final q = _q.trim();
    if (q.isNotEmpty) {
      s.where((t) {
        Expression<bool>? e;
        for (final mot in q.split(RegExp(r'\s+'))) {
          final m = '%$mot%';
          final c = t.adresse.like(m) | t.porte.like(m) | t.code.like(m);
          e = e == null ? c : e & c;
        }
        return e!;
      });
    }
    s.orderBy([
          (t) => OrderingTerm.asc(t.adresse),
          (t) => OrderingTerm.asc(t.porte),
    ]);
    return s.watch();
  }

  Future<void> _creer() async {
    final navigator = Navigator.of(context);
    final cree = await navigator.push<bdd.Logement>(
      MaterialPageRoute(
        builder: (_) => LogementEditPage(adresseInitiale: _q.trim()),
      ),
    );
    if (cree != null && mounted) navigator.pop(cree);
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final q = _q.trim();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text('Choisir un logement', style: tt.titleLarge),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SearchBar(
            autoFocus: true,
            hintText: 'Adresse, porte, code…',
            leading: const Icon(Icons.search),
            elevation: const WidgetStatePropertyAll(0),
            onChanged: (v) => setState(() {
              _q = v;
              _stream = _buildStream();
            }),
          ),
        ),
        if (widget.permettreCreation)
          ListTile(
            leading: CircleAvatar(
              backgroundColor: cs.primary,
              foregroundColor: cs.onPrimary,
              child: const Icon(Icons.add),
            ),
            title: Text(q.isEmpty ? 'Nouveau logement' : 'Créer « $q »'),
            subtitle: const Text('Ajouter un logement qui n\'existe pas encore'),
            onTap: _creer,
          ),
        const Divider(height: 1),
        Expanded(
          child: StreamBuilder<List<bdd.Logement>>(
            stream: _stream,
            builder: (context, snapshot) {
              final logements = snapshot.data ?? const <bdd.Logement>[];
              if (logements.isEmpty) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      q.isEmpty
                          ? 'Aucun logement pour le moment'
                          : 'Aucun logement trouvé',
                      style: tt.bodyMedium
                          ?.copyWith(color: cs.onSurfaceVariant),
                    ),
                  ),
                );
              }
              return ListView.builder(
                itemCount: logements.length,
                itemBuilder: (context, i) {
                  final l = logements[i];
                  final choisi = l.idLogement == widget.selectionId;
                  return ListTile(
                    selected: choisi,
                    leading: const Icon(Icons.home_outlined),
                    title: Text(l.adresse),
                    subtitle: Text('Porte ${l.porte}'),
                    trailing: choisi ? const Icon(Icons.check) : null,
                    onTap: () => Navigator.pop(context, l),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}