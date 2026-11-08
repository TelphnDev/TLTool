import 'package:flutter/material.dart';

import 'tokens.dart';

/// Construit les ThemeData clair/sombre à partir des tokens.
/// Mapping : muted -> onSurfaceVariant, border -> outline.
abstract final class AppTheme {
  static ThemeData get light => _build(Brightness.light, AppPalette.light);
  static ThemeData get dark => _build(Brightness.dark, AppPalette.dark);

  static ThemeData _build(Brightness brightness, AppPalette p) {
    final scheme = ColorScheme(
      brightness: brightness,
      primary: p.primary,
      onPrimary: p.onPrimary,
      secondary: p.primary,
      onSecondary: p.onPrimary,
      error: p.error,
      onError: Colors.white,
      surface: p.surface,
      onSurface: p.text,
      onSurfaceVariant: p.muted,
      outline: p.border,
    );

    final textTheme = const TextTheme(
      headlineLarge: TextStyle(fontSize: AppTypography.xxl, fontWeight: AppTypography.bold, height: 1.2),
      headlineMedium: TextStyle(fontSize: AppTypography.xl, fontWeight: AppTypography.bold, height: 1.2),
      titleLarge: TextStyle(fontSize: AppTypography.lg, fontWeight: AppTypography.medium),
      titleMedium: TextStyle(fontSize: AppTypography.md, fontWeight: AppTypography.medium),
      bodyLarge: TextStyle(fontSize: AppTypography.md, fontWeight: AppTypography.regular, height: 1.5),
      bodyMedium: TextStyle(fontSize: AppTypography.sm, fontWeight: AppTypography.regular, height: 1.5),
      labelLarge: TextStyle(fontSize: AppTypography.sm, fontWeight: AppTypography.medium),
      labelSmall: TextStyle(fontSize: AppTypography.xs, fontWeight: AppTypography.medium),
    ).apply(
      fontFamily: AppTypography.fontFamily,
      bodyColor: p.text,
      displayColor: p.text,
    );

    final borderSide = BorderSide(color: p.border, width: AppShapes.borderWidth);

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      fontFamily: AppTypography.fontFamily,
      textTheme: textTheme,
      scaffoldBackgroundColor: p.background,
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      dividerTheme: DividerThemeData(color: p.border, space: 1, thickness: AppShapes.borderWidth),
      appBarTheme: AppBarTheme(
        backgroundColor: p.surface,
        foregroundColor: p.text,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        toolbarHeight: AppSizes.headerHeight,
        titleTextStyle: textTheme.titleLarge,
        shape: Border(bottom: borderSide),
      ),
      cardTheme: CardThemeData(
        color: p.surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppShapes.radiusLg),
          side: borderSide,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppShapes.radiusMd)),
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.s6, vertical: AppSizes.s3),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: p.surface,
        surfaceTintColor: Colors.transparent,
        indicatorColor: p.primary.withValues(alpha: 0.16),
        indicatorShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppShapes.radiusMd)),
        labelTextStyle: WidgetStatePropertyAll(textTheme.labelSmall),
      ),
    );
  }
}
