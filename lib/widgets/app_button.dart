import 'package:flutter/material.dart';
import '../../core/design_tokens.dart';

/// Consistent call-to-action button with editorial styling and an animated
/// trailing arrow. Variants: primary (filled), outline, and ghost (text).
class AppButton extends StatefulWidget {
  const AppButton.primary(
    this.label, {
    super.key,
    required this.onTap,
    this.icon = Icons.arrow_forward,
    this.iconEnd = true,
    this.size = ButtonSize.regular,
  })  : variant = _ButtonVariant.primary,
        light = false;

  const AppButton.outline(
    this.label, {
    super.key,
    required this.onTap,
    this.icon = Icons.arrow_forward,
    this.iconEnd = true,
    this.size = ButtonSize.regular,
  })  : variant = _ButtonVariant.outline,
        light = false;

  const AppButton.text(
    this.label, {
    super.key,
    required this.onTap,
    this.icon = Icons.arrow_forward,
    this.iconEnd = true,
    this.light = false,
    this.size = ButtonSize.regular,
  }) : variant = _ButtonVariant.text;

  final String label;
  final VoidCallback onTap;
  final IconData icon;
  final bool iconEnd;
  final _ButtonVariant variant;
  final bool light;
  final ButtonSize size;

  @override
  State<AppButton> createState() => _AppButtonState();
}

enum ButtonSize { small, regular, large }

enum _ButtonVariant { primary, outline, text }

class _AppButtonState extends State<AppButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final fg = _foreground;
    final double fontSize = switch (widget.size) {
      ButtonSize.small => 13.5,
      ButtonSize.regular => 15.5,
      ButtonSize.large => 17.0,
    };
    final padding = switch (widget.size) {
      ButtonSize.small => const EdgeInsets.symmetric(horizontal: 18, vertical: 11),
      ButtonSize.regular => const EdgeInsets.symmetric(horizontal: 26, vertical: 15),
      ButtonSize.large => const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
    };

    final child = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2,
            color: fg,
          ),
        ),
        const SizedBox(width: 10),
        AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          transform: Matrix4.translationValues(_hovered ? 4 : 0, 0, 0),
          child: Icon(widget.icon, size: (fontSize + 3).toDouble(), color: fg),
        ),
      ],
    );

    final content = MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: FocusableActionDetector(
        onShowFocusHighlight: (_) {},
        child: Material(
          color: switch (widget.variant) {
            _ButtonVariant.primary => widget.light
                ? AppColors.textOnDark
                : AppColors.accent,
            _ButtonVariant.outline => Colors.transparent,
            _ButtonVariant.text => Colors.transparent,
          },
          shape: switch (widget.variant) {
            _ButtonVariant.primary => null,
            _ButtonVariant.outline => RoundedRectangleBorder(
                side: BorderSide(color: _outlineColor, width: 1.4),
                borderRadius: BorderRadius.circular(2),
              ),
            _ButtonVariant.text => RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
          },
          elevation: 0,
          child: InkWell(
            onTap: widget.onTap,
            borderRadius: BorderRadius.circular(2),
            hoverColor: switch (widget.variant) {
              _ButtonVariant.primary =>
                widget.light ? Colors.white24 : AppColors.accentHover,
              _ => Colors.transparent,
            },
            child: Padding(padding: padding, child: child),
          ),
        ),
      ),
    );

    return content;
  }

  Color get _outlineColor =>
      widget.light ? AppColors.textOnDark.withValues(alpha: 0.7) : AppColors.textPrimary;

  Color get _foreground => switch (widget.variant) {
        _ButtonVariant.primary => widget.light ? AppColors.accent : Colors.white,
        _ButtonVariant.outline => _outlineColor,
        _ButtonVariant.text =>
          widget.light ? AppColors.textOnDark : AppColors.textPrimary,
      };
}