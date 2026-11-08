import 'package:flutter/material.dart';

import '../../theme/tokens.dart';

/// Footer SIMPLE (FooterStyle.simple) : une bande de texte, sans navigation.
class AppFooterSimple extends StatelessWidget {
  const AppFooterSimple({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return SafeArea(
      top: false, // pas de marge en haut, seulement sous la barre système
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppSizes.s4),
        decoration: BoxDecoration(
          color: scheme.surface,
          border: Border(
            top: BorderSide(color: scheme.outline, width: AppShapes.borderWidth),
          ),
        ),
        child: Text(
          '© ${DateTime.now().year} — Mon application',
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .labelSmall
              ?.copyWith(color: scheme.onSurfaceVariant),
        ),
      ),
    );
  }
}
