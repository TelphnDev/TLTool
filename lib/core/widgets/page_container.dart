import 'package:flutter/material.dart';

import '../theme/tokens.dart';

/// Contenu défilant, centré et limité en largeur (téléphone, tablette).
class PageContainer extends StatelessWidget {
  const PageContainer({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: AppSizes.maxContentWidth),
        child: ListView(
          padding: const EdgeInsets.all(AppSizes.s4),
          children: children,
        ),
      ),
    );
  }
}
