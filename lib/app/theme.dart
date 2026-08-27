import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/design_tokens.dart';

/// Centralizes the editorial look: fonts, color scheme, and a semantically
/// named text scale. Sizes map to the design-token `AppType` values and are
/// responsive helpers used per context; the base theme holds the hierarchy.
ThemeData buildAppTheme() {
  final base = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: const ColorScheme.light(
      primary: AppColors.accent,
      onPrimary: Colors.white,
      surface: AppColors.surface,
      onSurface: AppColors.textPrimary,
      outline: AppColors.border,
    ),
    splashFactory: InkSparkle.splashFactory,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    dividerColor: AppColors.border,
    focusColor: AppColors.accentSoft,
  );

  // Editorial serif for display/headlines, Inter for body and UI.
  final display = GoogleFonts.instrumentSerif();
  final body = GoogleFonts.inter();

  final textTheme = base.textTheme
      .apply(
        bodyColor: AppColors.textPrimary,
        displayColor: AppColors.textPrimary,
        fontFamily: body.fontFamily,
      )
      .copyWith(
        // Display XL
        displayLarge: textStyle(display, AppType.displayXl, AppType.lineTight),
        // Display Large
        displayMedium: textStyle(display, AppType.displayLg, AppType.lineTight),
        // Display Medium
        displaySmall: textStyle(display, AppType.displayMd, AppType.lineTight),
        // H1
        headlineLarge: textStyle(display, AppType.h1, AppType.lineTight),
        // H2
        headlineMedium: textStyle(display, AppType.h2, AppType.lineTight),
        // H3
        headlineSmall: textStyle(display, AppType.h3, AppType.lineNormal),
        // Body Large
        titleLarge: textStyle(body, AppType.bodyLg, AppType.lineNormal),
        // Body
        bodyLarge: textStyle(body, AppType.body, AppType.lineLoose),
        bodyMedium: textStyle(body, AppType.body, AppType.lineNormal),
        // Caption / small
        bodySmall: textStyle(body, AppType.caption, AppType.lineNormal),
        labelLarge: textStyle(body, AppType.body, AppType.lineNormal),
        labelMedium: textStyle(body, AppType.caption, AppType.lineNormal),
        labelSmall: textStyle(body, AppType.eyebrow, AppType.lineNormal),
      );

  return base.copyWith(textTheme: textTheme);
}

TextStyle textStyle(TextStyle font, double size, double height) {
  final style = TextStyle(
    fontSize: size,
    height: height,
    letterSpacing: size >= AppType.h2 ? -0.5 : 0,
  );
  return font.merge(style).copyWith(fontSize: size, height: height);
}

/// Builds a text theme given a serif + sans family — used when fonts must be
/// bundled rather than fetched. Kept for future migration; base uses google_fonts.
TextTheme buildTextThemeFromFamilies({
  required String serifFamily,
  required String sansFamily,
}) {
  final display = TextStyle(fontFamily: serifFamily);
  final body = TextStyle(fontFamily: sansFamily);
  return TextTheme(
    displayLarge: textStyle(display, AppType.displayXl, AppType.lineTight),
    displayMedium: textStyle(display, AppType.displayLg, AppType.lineTight),
    displaySmall: textStyle(display, AppType.displayMd, AppType.lineTight),
    headlineLarge: textStyle(display, AppType.h1, AppType.lineTight),
    headlineMedium: textStyle(display, AppType.h2, AppType.lineTight),
    headlineSmall: textStyle(display, AppType.h3, AppType.lineNormal),
    titleLarge: textStyle(body, AppType.bodyLg, AppType.lineNormal),
    bodyLarge: textStyle(body, AppType.body, AppType.lineLoose),
    bodyMedium: textStyle(body, AppType.body, AppType.lineNormal),
    bodySmall: textStyle(body, AppType.caption, AppType.lineNormal),
    labelLarge: textStyle(body, AppType.body, AppType.lineNormal),
    labelMedium: textStyle(body, AppType.caption, AppType.lineNormal),
    labelSmall: textStyle(body, AppType.eyebrow, AppType.lineNormal),
  );
}