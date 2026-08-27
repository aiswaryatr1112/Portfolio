import 'package:flutter/material.dart';
import '../design_tokens.dart';

/// Convenience shortcuts that keep widget code readable and consistent.
extension AppContext on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colors => Theme.of(this).colorScheme;

  /// Design-system colours are not part of ThemeData, so expose tokens directly
  /// for ergonomic access inside widgets.
  Color get paper => AppColors.background;
  Color get ink => AppColors.ink;
  Color get accentColor => AppColors.accent;
}

/// A small menu-driven alternative navigation target.
class NavTarget {
  const NavTarget(this.label, this.path);
  final String label;
  final String path;

  @override
  String toString() => 'NavTarget($label, $path)';
}