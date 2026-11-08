import 'package:flutter/material.dart';

import '../router/sub_page_entry.dart';
import '../theme/tokens.dart';
import 'info_card.dart';
import 'page_container.dart';

/// Affiche la liste de cartes (id == null) ou la sous-page correspondante.
class SubPagesView extends StatelessWidget {
  const SubPagesView({
    super.key,
    required this.id,
    required this.entries,
    required this.onOpen,
    required this.onBack,
    this.notFoundText = 'Page introuvable',
  });

  final String? id;
  final List<SubPageEntry> entries;
  final void Function(BuildContext context, String id) onOpen;
  final void Function(BuildContext context) onBack;
  final String notFoundText;

  @override
  Widget build(BuildContext context) {
    if (id == null) {
      return PageContainer(
        children: [
          for (final e in entries) ...[
            InfoCard(
              title: e.title,
              subtitle: e.subtitle,
              onTap: () => onOpen(context, e.id),
            ),
            const SizedBox(height: AppSizes.s3),
          ],
        ],
      );
    }

    for (final e in entries) {
      if (e.id == id) return e.builder();
    }

    return PageContainer(
      children: [
        Text(notFoundText, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: AppSizes.s4),
        FilledButton(
          onPressed: () => onBack(context),
          child: const Text('Retour'),
        ),
      ],
    );
  }
}