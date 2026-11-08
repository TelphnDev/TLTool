import 'package:flutter/material.dart';

import '../core/theme/theme_controller.dart';
import '../core/theme/tokens.dart';
import '../core/widgets/page_container.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return PageContainer(
      children: [
        Text('Thème', style: text.headlineMedium),
        const SizedBox(height: AppSizes.s3),
        ListenableBuilder(
          listenable: themeController,
          builder: (context, _) => SegmentedButton<ThemeMode>(
            segments: const [
              ButtonSegment(value: ThemeMode.system, label: Text('Auto'), icon: Icon(Icons.brightness_auto)),
              ButtonSegment(value: ThemeMode.light, label: Text('Clair'), icon: Icon(Icons.light_mode)),
              ButtonSegment(value: ThemeMode.dark, label: Text('Sombre'), icon: Icon(Icons.dark_mode)),
            ],
            selected: {themeController.mode},
            onSelectionChanged: (s) => themeController.setMode(s.first),
          ),
        ),
      ],
    );
  }
}
