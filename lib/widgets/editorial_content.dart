import 'package:flutter/material.dart';
import '../../core/constants/app_config.dart';
import '../../core/design_tokens.dart';

/// Renders a real image when an asset path is supplied; otherwise an elegant,
/// clearly-labelled editorial placeholder so the layout always holds together.
///
/// - If [path] is non-empty, shows `Image.asset` (cinematic crop via fit).
/// - Any missing/erroring asset gracefully falls back to the placeholder.
/// - `AppConfig.imagesArePlaceholders` adds a small "placeholder" badge.
class EditorialImageSlot extends StatelessWidget {
  const EditorialImageSlot({
    super.key,
    required this.path,
    this.fit = BoxFit.cover,
    this.label = 'Photograph',
    this.showBadge = AppConfig.imagesArePlaceholders,
    this.minHeight,
  });

  final String path;
  final BoxFit fit;
  final String label;
  final bool showBadge;
  final double? minHeight;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      image: true,
      label: '${_labelDescription()} — $label',
      child: ClipRRect(
        borderRadius: BorderRadius.circular(2),
        child: SizedBox.fromSize(
          size: Size.infinite,
          child: path.isNotEmpty ? _asset(context) : _placeholder(context),
        ),
      ),
    );
  }

  Widget _asset(BuildContext context) {
    return Image.asset(
      path,
      fit: fit,
      semanticLabel: label,
      errorBuilder: (_, __, ___) => _placeholder(context, useMediaAsFallback: true),
    );
  }

  Widget _placeholder(BuildContext context, {bool useMediaAsFallback = false}) {
    final paper = AppColors.background;
    final ink = AppColors.ink;
    return Container(
      color: paper,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.photo_outlined, size: 40, color: AppColors.textMuted),
          const SizedBox(height: 12),
          Text(
            useMediaAsFallback
                ? 'Image unavailable'
                : 'Your $label goes here',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ink.withValues(alpha: 0.7),
              fontSize: 14,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            useMediaAsFallback
                ? 'Replace the file at ${_fileName(path)}'
                : 'Add the asset path in AssetPaths to place it',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.textMuted, fontSize: 11.5),
          ),
          if (showBadge) ...[
            const SizedBox(height: 8),
            _placeholderBadge(context),
          ],
        ],
      ),
    );
  }

  String _labelDescription() =>
      label.replaceAll('/', ' and ').replaceAll('.', ' ').trim();

  String _fileName(String p) {
    final idx = p.lastIndexOf('/');
    return idx == -1 ? p : p.substring(idx + 1);
  }

  Widget _placeholderBadge(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Text(
        'PLACEHOLDER',
        style: TextStyle(
          fontSize: 9.5,
          letterSpacing: 1.2,
          color: AppColors.textMuted,
        ),
      ),
    );
  }
}

/// Thin vertical/horizontal hairline splitter with optional label — the
/// editorial "eyebrow" rule.
class EditorialRule extends StatelessWidget {
  const EditorialRule({super.key, this.label, this.padding});

  final String? label;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    if (label != null && label!.isNotEmpty) {
      children
        ..add(Text(
          label!.toUpperCase(),
          style: TextStyle(
            fontSize: 12,
            letterSpacing: 2.4,
            color: AppColors.textMuted,
            fontWeight: FontWeight.w600,
          ),
        ))
        ..add(const SizedBox(width: 12))
        ..add(const Expanded(child: Divider(color: AppColors.border, height: 1)));
    } else {
      children.add(const Divider(color: AppColors.border, height: 1));
    }
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Row(children: children),
    );
  }
}

/// A small eyebrow label used above section headlines.
class Eyebrow extends StatelessWidget {
  const Eyebrow(this.text, {super.key, this.light = false});
  final String text;
  final bool light;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: TextStyle(
        fontSize: 12,
        letterSpacing: 2.6,
        fontWeight: FontWeight.w600,
        color: light ? AppColors.textOnDark.withValues(alpha: 0.8) : AppColors.accent,
      ),
    );
  }
}