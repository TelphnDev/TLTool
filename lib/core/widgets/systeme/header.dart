import 'package:flutter/material.dart';

import '../../router/app_route.dart';
import '../../theme/tokens.dart';
import '../theme_toggle_button.dart';

/// Header STANDARD (HeaderStyle.standard) :
/// bouton retour (sous-pages) + titre + réglages + changement de thème.
class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  const AppHeader({super.key, required this.route});

  final AppRoute route;

  @override
  Size get preferredSize => const Size.fromHeight(AppSizes.headerHeight);

  /// Texte affiché dans le header : on part de `route.title`,
  /// mais le header est libre de le remplacer ou de le modifier.
  String get _title => switch (route) {
    AppRoute.home => 'Mon portfolio',
    AppRoute.projectDetail => 'Détail du projet',
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
      actions: [
        IconButton(
          icon: const Icon(Icons.settings_outlined),
          tooltip: 'Réglages',
          onPressed: () => AppRoute.settings.go(context),
        ),
        const ThemeToggleButton(),
        const SizedBox(width: AppSizes.s2),
      ],
    );
  }
}