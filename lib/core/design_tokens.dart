import 'package:flutter/material.dart';

/// Centralized design tokens for the portfolio.
///
/// Everything visual — color, spacing, radius, content widths — lives here so
/// values are never scattered across widgets. Edit once, apply everywhere.
class AppColors {
  AppColors._();

  // Paper / surfaces
  static const Color background = Color(0xFFFAF7F2); // warm off-white
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceMuted = Color(0xFFF1EDE6); // slightly deeper paper
  static const Color ink = Color(0xFF141210); // near-black
  static const Color charcoal = Color(0xFF23211E);
  static const Color coal = Color(0xFF1B1916); // dark section surface

  // Text
  static const Color textPrimary = ink;
  static const Color textSecondary = Color(0xFF4A463F);
  static const Color textMuted = Color(0xFF8A857C);
  static const Color textOnDark = Color(0xFFF5F1EA);

  // The single restrained accent: deep racing green.
  static const Color accent = Color(0xFF1E4B34);
  static const Color accentSoft = Color(0xFF1E4B34);
  static const Color accentHover = Color(0xFF2A6245);

  // Hairline borders
  static const Color border = Color(0xFFE4DED3);
  static const Color borderDark = Color(0xFF33302B);
}

class AppSpacing {
  AppSpacing._();

  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 40;
  static const double xxl = 72;
  static const double section = 112; // vertical rhythm between sections
}

class AppRadius {
  AppRadius._();

  static const double small = 4;
  static const double medium = 8;
  static const double large = 16;
}

/// Maximum content widths per device class. Wide desktop keeps a generous
/// measure so lines stay readable on 4K screens.
class AppWidths {
  AppWidths._();

  static const double mobile = 1000;
  static const double tablet = 900;
  static const double desktop = 1180;
  static const double wideDesktop = 1320;
}

/// Typographic scale tokens. Sizes are overridden per breakpoint in the
/// responsive helpers / theme extension, but these are the desktop defaults.
class AppType {
  AppType._();

  static const double displayXl = 72;
  static const double displayLg = 52;
  static const double displayMd = 40;
  static const double h1 = 34;
  static const double h2 = 28;
  static const double h3 = 22;
  static const double bodyLg = 19;
  static const double body = 16;
  static const double caption = 12.5;
  static const double eyebrow = 12;

  static const double lineTight = 1.08;
  static const double lineNormal = 1.4;
  static const double lineLoose = 1.7;
}