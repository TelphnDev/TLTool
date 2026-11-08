import 'package:flutter/material.dart';

import '../core/router/app_route.dart';
import '../core/theme/tokens.dart';
import '../core/widgets/page_container.dart';

/// EXEMPLE 1 — page simple, plein écran.
/// Dans app_route.dart : header: false, footer: false => ni header ni footer,
/// donc la page gère elle-même son bouton retour.
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return PageContainer(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => AppRoute.home.go(context),
          ),
        ),
        Text('À propos', style: text.headlineLarge),
        const SizedBox(height: AppSizes.s3),
        Text('Quelques lignes sur moi et sur l\'application.', style: text.bodyLarge),
      ],
    );
  }
}
