import 'package:flutter/material.dart';

import '../core/router/app_route.dart';
import '../core/theme/tokens.dart';
import '../core/widgets/page_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return PageContainer(
      children: [
        Text('Bienvenue', style: text.headlineLarge),
        const SizedBox(height: AppSizes.s3),
        Text('Ma page d\'accueil de l\'application.', style: text.bodyLarge),
        const SizedBox(height: AppSizes.s6),
        Align(
          alignment: Alignment.centerLeft,
          child: FilledButton(
            onPressed: () => AppRoute.projects.go(context),
            child: const Text('Voir les projets'),
          ),
        ),
        const SizedBox(height: AppSizes.s3),
        Align(
          alignment: Alignment.centerLeft,
          child: OutlinedButton(
            onPressed: () => AppRoute.about.go(context),
            child: const Text('À propos'),
          ),
        ),
      ],
    );
  }
}
