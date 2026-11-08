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
    required this.error,
  });

  final Color background;
  final Color surface;
  final Color text;
  final Color muted;
  final Color border;
  final Color primary;
  final Color onPrimary;
  final Color error;

  static const light = AppPalette(
    background: Color(0xFFF7F7FB),
    surface: Color(0xFFFFFFFF),
    text: Color(0xFF14141C),
    muted: Color(0xFF5B5B6B),
    border: Color(0xFFE2E2EC),
    primary: Color(0xFF4F46E5),
    onPrimary: Color(0xFFFFFFFF),
    error: Color(0xFFB3261E),
  );

  static const dark = AppPalette(
    background: Color(0xFF0E0E14),
    surface: Color(0xFF171722),
    text: Color(0xFFF1F1F7),
    muted: Color(0xFFA3A3B5),
    border: Color(0xFF2A2A3A),
    primary: Color(0xFF8B86FF),
    onPrimary: Color(0xFF0E0E14),
    error: Color(0xFFF2B8B5),
  );
}
