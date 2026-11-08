import 'package:flutter/material.dart';

import '../theme/tokens.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.title,
    this.subtitle, // facultatif : rien n'est affiché si null
    this.onTap,
  });

  final String title;
  final String? subtitle;
  final VoidCallback? onTap; // non null = carte cliquable

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final muted = Theme.of(context).colorScheme.onSurfaceVariant;
    final sub = subtitle;
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.s4),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: text.titleLarge),
                    if (sub != null) ...[
                      const SizedBox(height: AppSizes.s1),
                      Text(sub, style: text.bodyMedium?.copyWith(color: muted)),
                    ],
                  ],
                ),
              ),
              if (onTap != null) Icon(Icons.chevron_right, color: muted),
            ],
          ),
        ),
      ),
    );
  }
}