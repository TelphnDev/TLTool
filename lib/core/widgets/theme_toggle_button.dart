import 'package:flutter/material.dart';

import '../theme/theme_controller.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return IconButton(
      tooltip: 'Changer de thème',
      icon: Icon(brightness == Brightness.dark ? Icons.light_mode : Icons.dark_mode),
      onPressed: () => themeController.toggle(brightness),
    );
  }
}
