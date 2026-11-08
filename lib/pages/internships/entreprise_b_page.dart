import 'package:flutter/material.dart';

import '../../core/theme/tokens.dart';
import '../../core/widgets/page_container.dart';

class EntrepriseBPage extends StatelessWidget {
  const EntrepriseBPage({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return PageContainer(
      children: [
        Text('Entreprise B', style: text.headlineLarge),
        const SizedBox(height: AppSizes.s1),
        Text('6 semaines', style: text.titleMedium),
        const SizedBox(height: AppSizes.s3),
        Text('Support, maintenance, petites évolutions.', style: text.bodyLarge),
      ],
    );
  }
}
