import 'package:flutter/material.dart';

import '../core/router/app_route.dart';
import '../core/theme/tokens.dart';
import '../core/widgets/info_card.dart';
import '../core/widgets/page_container.dart';

/// PAGE PARENTE MANUELLE.
///
/// Ici rien n'est automatique : chaque carte est écrite à la main et pointe
/// vers sa propre route (AppRoute.internshipA, internshipB…).
///
/// AJOUTER UN STAGE :
///   1. Crée pages/internships/entreprise_x_page.dart.
///   2. Ajoute une entrée `internshipX` dans AppRoute (app_route.dart),
///      avec parent: internships et nav: false.
///   3. Ajoute son `case` dans app_router.dart.
///   4. Ajoute une InfoCard ci-dessous qui appelle AppRoute.internshipX.go.
class InternshipsPage extends StatelessWidget {
  const InternshipsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      children: [
        InfoCard(
          title: 'Entreprise A',
          subtitle: '4 semaines — développement mobile.',
          onTap: () => AppRoute.internshipA.go(context),
        ),
        const SizedBox(height: AppSizes.s3),
        InfoCard(
          title: 'Entreprise B',
          subtitle: '6 semaines — support et maintenance.',
          onTap: () => AppRoute.internshipB.go(context),
        ),
      ],
    );
  }
}
