import 'package:flutter/material.dart';

/// Source de vérité du design. Modifier une valeur ici change toute l'app.
/// Les widgets n'utilisent que ces tokens (AppSizes.s4, AppShapes.radiusMd…).

abstract final class AppTypography {
  /// null = police système. Mettre le nom d'une police déclarée dans pubspec.yaml.
  static const String? fontFamily = null;

  static const double xs = 12;
  static const double sm = 14;
  static const double md = 16;
  static const double lg = 20;
  static const double xl = 24;
  static const double xxl = 32;

  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight bold = FontWeight.w700;
}

abstract final class AppSizes {
  static const double s1 = 4;
  static const double s2 = 8;
  static const double s3 = 12;
  static const double s4 = 16;
  static const double s6 = 24;
  static const double s8 = 32;
  static const double s12 = 48;

  static const double headerHeight = 56;
  static const double maxContentWidth = 720;
}

abstract final class AppShapes {
  static const double radiusSm = 6;
  static const double radiusMd = 12;
  static const double radiusLg = 20;
  static const double borderWidth = 1;
}

/// Palette d'un thème. Ajouter une couleur = l'ajouter ici (clair + sombre).
class AppPalette {
  const AppPalette({
    required this.background,
    required this.surface,
    required this.text,
    required this.muted,
    required this.border,
    required this.primary,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.success,
    required this.warning,
    required this.info,
    required this.error,
  });

  final Color background;
  final Color surface;
  final Color text;
  final Color muted;
  final Color border;
  final Color primary;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color success;
  final Color warning;
  final Color info;
  final Color error;

  static const light = AppPalette(
    background: Color(0xFFF6F8FC),
    surface: Color(0xFFFFFFFF),
    text: Color(0xFF14181F),
    muted: Color(0xFF5A6577),
    border: Color(0xFFDFE5F0),
    primary: Color(0xFF3F64A5), // bleu du site (bannière, titres)
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFDCE6F6),
    onPrimaryContainer: Color(0xFF1B2F57),
    secondary: Color(0xFFEE7D22), // orange du site (boutons, accroches)
    onSecondary: Color(0xFFFFFFFF),
    success: Color(0xFF2E8B57),
    warning: Color(0xFFD99A00),
    info: Color(0xFF2F80C9),
    error: Color(0xFFB3261E),
  );

  static const dark = AppPalette(
    background: Color(0xFF0E1420),
    surface: Color(0xFF161F30),
    text: Color(0xFFEEF2F9),
    muted: Color(0xFF9AA7BD),
    border: Color(0xFF26324A),
    primary: Color(0xFF8FAEE8),
    onPrimary: Color(0xFF0E1A33),
    primaryContainer: Color(0xFF223860),
    onPrimaryContainer: Color(0xFFDCE6F6),
    secondary: Color(0xFFFF9A4D),
    onSecondary: Color(0xFF2A1405),
    success: Color(0xFF6FCF97),
    warning: Color(0xFFF2C46D),
    info: Color(0xFF7DB8F0),
    error: Color(0xFFF2B8B5),
  );
}