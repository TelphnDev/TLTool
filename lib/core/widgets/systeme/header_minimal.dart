import 'package:flutter/material.dart';

import '../../router/app_route.dart';
import '../../theme/tokens.dart';

/// Header MINIMAL (HeaderStyle.minimal) :
/// bouton retour (sous-pages) + titre, sans aucune action à droite.
class AppHeaderMinimal extends StatelessWidget implements PreferredSizeWidget {
  const AppHeaderMinimal({super.key, required this.route});

  final AppRoute route;

  @override
  Size get preferredSize => const Size.fromHeight(AppSizes.headerHeight);

  /// Texte affiché dans le header minimal : on part de `route.title`,
  /// mais ce header est libre de le remplacer ou de le modifier.
  String get _title => switch (route) {
    _ => route.title,
  };

  @override
  Widget build(BuildContext context) {
    final parent = route.parent;
    return AppBar(
      leading: parent == null
          ? null
          : IconButton(
        icon: const Icon(Icons.arrow_back),
        tooltip: 'Retour',
        onPressed: () => parent.go(context),
      ),
      title: Text(_title),
    );
  }
}