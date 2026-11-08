import 'package:flutter/material.dart';

import '../../core/theme/tokens.dart';
import '../../core/widgets/page_container.dart';

class EntrepriseAPage extends StatelessWidget {
  const EntrepriseAPage({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return PageContainer(
      children: [
        Text('Entreprise A', style: text.headlineLarge),
        const SizedBox(height: AppSizes.s1),
        Text('4 semaines', style: text.titleMedium),
        const SizedBox(height: AppSizes.s3),
        Text('Développement mobile, tests, documentation.', style: text.bodyLarge),
      ],
    );
  }
}
