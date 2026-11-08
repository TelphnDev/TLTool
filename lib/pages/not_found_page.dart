import 'package:flutter/material.dart';

import '../core/router/app_route.dart';
import '../core/theme/tokens.dart';

/// Hors du shell : volontairement sans header ni footer.
class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('404', style: text.headlineLarge),
              const SizedBox(height: AppSizes.s2),
              Text('Page introuvable', style: text.bodyLarge),
              const SizedBox(height: AppSizes.s6),
              FilledButton(
                onPressed: () => AppRoute.home.go(context),
                child: const Text('Retour à l\'accueil'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
