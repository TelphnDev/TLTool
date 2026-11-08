import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tl_tool/pages/bdd/personne.dart';
import 'package:tl_tool/pages/page_bdd.dart';

import '../../pages/a_propos.dart';
import '../../pages/home.dart';
import '../../pages/internships/entreprise_a_page.dart';
import '../../pages/internships/entreprise_b_page.dart';
import '../../pages/internships.dart';
import '../../pages/not_found.dart';
import '../../pages/projects.dart';
import '../../pages/settings.dart';
import '../widgets/app_shell.dart';
import 'app_route.dart';

/// Associe chaque AppRoute à la page à afficher.
///
/// Le switch est EXHAUSTIF : si tu ajoutes une AppRoute sans écrire son
/// `case` ici, le code ne compile pas. Impossible d'avoir une route sans page.
///
/// `state.pathParameters` contient les valeurs des `:id` de l'adresse.
/// Ex: pour /projets/alpha -> {'id': 'alpha'}.
Widget _pageFor(AppRoute route, GoRouterState state) => switch (route) {
  AppRoute.home => const HomePage(),

  // Les DEUX routes Projets vont vers la même page : c'est elle qui
  // décide d'afficher la liste (id == null) ou une sous-page (id != null).
  AppRoute.projects => const ProjectsPage(),
  AppRoute.projectDetail => ProjectsPage(id: state.pathParameters['id']),

  // Stages : une route = une page (manuel).
  AppRoute.internships => const InternshipsPage(),
  AppRoute.internshipA => const EntrepriseAPage(),
  AppRoute.internshipB => const EntrepriseBPage(),

  AppRoute.about => const AboutPage(),
  AppRoute.settings => const SettingsPage(),

  AppRoute.bdd => const BddPage(),
  AppRoute.bddDetail => BddPage(id: state.pathParameters['id']),
};

/// Le routeur de l'app. Fonctionnement :
///
///   adresse (ex: /projets/alpha)
///     -> GoRoute correspondant (un par AppRoute, créés par la boucle `for`)
///     -> _pageFor(...)  : choisit la page
///     -> ShellRoute     : l'enveloppe dans AppShell, qui ajoute header/footer
///                         selon `route.header` et `route.footer`
final appRouter = GoRouter(
  initialLocation: AppRoute.home.path,

  // Adresse inconnue : cette page est HORS du shell => ni header ni footer.
  errorBuilder: (context, state) => const NotFoundPage(),

  routes: [
    ShellRoute(
      // Appelé à chaque changement de page. On retrouve l'AppRoute actuelle
      // grâce au nom de la route (`name: r.name` plus bas) pour que AppShell
      // sache quel header et quel footer afficher.
      builder: (context, state, child) => AppShell(
        route:
            AppRoute.values.asNameMap()[state.topRoute?.name] ?? AppRoute.home,
        child: child,
      ),
      routes: [
        // Une GoRoute par AppRoute : on ne les écrit jamais à la main.
        for (final r in AppRoute.values)
          GoRoute(
            path: r.path,
            name: r.name,
            // sert à AppRoute.go() (goNamed)
            // NoTransitionPage = changement de page instantané (sans animation).
            pageBuilder: (context, state) => NoTransitionPage<void>(
              key: state.pageKey,
              child: _pageFor(r, state),
            ),
          ),
      ],
    ),
  ],
);
