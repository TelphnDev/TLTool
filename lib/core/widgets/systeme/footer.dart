import 'package:flutter/material.dart';

import '../../router/app_route.dart';

/// Un onglet du footer : le footer décide de tout (route, icônes, texte).
class _Tab {
  const _Tab({
    required this.route,
    required this.icon,
    required this.activeIcon,
    required this.label,
  });

  final AppRoute route;
  final IconData icon;
  final IconData activeIcon;
  final String label;
}

/// Footer NAVIGATION (FooterStyle.navigation).
class AppFooterNavigation extends StatelessWidget {
  const AppFooterNavigation({super.key, required this.route});

  final AppRoute route;

  /// Liste des onglets, dans l'ordre d'affichage.
  static const _tabs = [
    _Tab(
      route: AppRoute.home,
      icon: Icons.home_outlined,
      activeIcon: Icons.home,
      label: 'Accueil',
    ),
    _Tab(route: AppRoute.bdd, icon: Icons.folder, activeIcon: Icons.folder_copy, label: 'Données'),
    _Tab(
      route: AppRoute.projects,
      icon: Icons.folder_outlined,
      activeIcon: Icons.folder,
      label: 'Projets',
    ),
    _Tab(
      route: AppRoute.internships,
      icon: Icons.work_outline,
      activeIcon: Icons.work,
      label: 'Stages', // libellé court, indépendant du titre du header
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // `route.root` : sur une sous-page (ex: projectDetail), on garde
    // l'onglet de la page parente (projects) sélectionné.
    final index = _tabs.indexWhere((t) => t.route == route.root);

    return NavigationBar(
      animationDuration: Duration.zero,
      selectedIndex: index < 0 ? 0 : index,
      onDestinationSelected: (i) => _tabs[i].route.go(context),
      destinations: [
        for (final t in _tabs)
          NavigationDestination(
            icon: Icon(t.icon),
            selectedIcon: Icon(t.activeIcon),
            label: t.label,
          ),
      ],
    );
  }
}