import 'package:flutter/material.dart';

import '../router/app_route.dart';
import 'systeme/footer.dart';
import 'systeme/footer_simple.dart';
import 'systeme/header.dart';
import 'systeme/header_minimal.dart';

/// Cadre commun de toutes les pages (sauf la 404).
/// Il lit `route.header` et `route.footer` (définis dans app_route.dart)
/// et choisit le bon header / footer.
class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.route, required this.child});

  final AppRoute route; // page actuelle (donne le style de header/footer)
  final Widget child; //   contenu de la page, fourni par le routeur

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Switch exhaustif : un nouveau HeaderStyle doit être géré ici.
      appBar: switch (route.header) {
        HeaderStyle.none => null,
        HeaderStyle.standard => AppHeader(route: route),
        HeaderStyle.minimal => AppHeaderMinimal(route: route),
      },
      // SafeArea protège le contenu de l'encoche / de la barre système,
      // uniquement du côté où il n'y a pas de header / footer.
      body: SafeArea(
        top: route.header == HeaderStyle.none,
        bottom: route.footer == FooterStyle.none,
        child: child,
      ),
      bottomNavigationBar: switch (route.footer) {
        FooterStyle.none => null,
        FooterStyle.navigation => AppFooterNavigation(route: route),
        FooterStyle.simple => const AppFooterSimple(),
      },
    );
  }
}
