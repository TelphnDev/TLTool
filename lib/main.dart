import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await themeController.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Se reconstruit quand le thème change ; le routeur gère les pages.
    return ListenableBuilder(
      listenable: themeController,
      builder: (context, _) => MaterialApp.router(
        title: 'TLTool',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: themeController.mode,
        themeAnimationDuration: Duration.zero,
        routerConfig: appRouter,
      ),
    );
  }
}

// ---- Previews ----

@Preview(name: 'Accueil', size: Size(400, 700))
Widget previewAccueil() {
  return const MyApp();
}
