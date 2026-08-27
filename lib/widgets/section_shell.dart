import 'package:flutter/material.dart';
import '../../core/design_tokens.dart';
import '../../core/responsive/responsive.dart';
import 'editorial_content.dart';

/// Constrains content to the current breakpoint's max width and always centers
/// it. Standard envelope for every section.
class ContentEnvelope extends StatelessWidget {
  const ContentEnvelope({
    super.key,
    required this.child,
    this.horizontal = AppSpacing.lg,
    this.vertical = EdgeInsets.zero,
  });

  final Widget child;
  final double horizontal;
  final EdgeInsets vertical;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: context.breakpoint.maxContentWidth),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontal) + vertical,
          child: child,
        ),
      ),
    );
  }
}

/// Wraps a full-bleed section with consistent vertical rhythm and background.
/// Unless `fullBleed` is set, content is constrained to the max content width.
class Section extends StatelessWidget {
  const Section({
    super.key,
    required this.child,
    this.background = AppColors.background,
    this.padding = const EdgeInsets.symmetric(vertical: AppSpacing.section),
    this.fullBleed = false,
  });

  final Widget child;
  final Color background;
  final EdgeInsets padding;
  final bool fullBleed;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: background,
      padding: fullBleed ? EdgeInsets.zero : padding,
      child: fullBleed
          ? child
          : ContentEnvelope(
              horizontal: AppSpacing.lg,
              child: child,
            ),
    );
  }
}

/// A heading cluster: eyebrow + title (+ optional subtitle).
class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    required this.title,
    this.eyebrow,
    this.subtitle,
    this.light = false,
    this.align,
    this.maxTitleWidth,
  });

  final String title;
  final String? eyebrow;
  final String? subtitle;
  final bool light;
  final TextAlign? align;
  final double? maxTitleWidth;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleColor = light ? AppColors.textOnDark : AppColors.textPrimary;
    final subtitleColor = light
        ? AppColors.textOnDark.withValues(alpha: 0.72)
        : AppColors.textSecondary;
    return Column(
      crossAxisAlignment: align == TextAlign.center
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        if (eyebrow != null) ...[
          Eyebrow(eyebrow!, light: light),
          const SizedBox(height: 16),
        ],
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxTitleWidth ?? 900),
          child: SelectableText(
            title,
            textAlign: align,
            style: theme.textTheme.displaySmall?.copyWith(color: titleColor),
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 20),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: SelectableText(
              subtitle!,
              textAlign: align,
              style: theme.textTheme.bodyLarge?.copyWith(color: subtitleColor),
            ),
          ),
        ],
      ],
    );
  }
}