import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/design_tokens.dart';
import '../../core/responsive/responsive.dart';
import '../../data/experience_data.dart';
import '../../models/experience.dart';
import '../../widgets/app_button.dart';
import '../../widgets/editorial_content.dart';
import '../../widgets/section_shell.dart';

/// Approachable career narrative built from the experiences timeline.
class StoryPage extends StatelessWidget {
  const StoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Newest first reads best on a narrative page.
    final ordered = experiences.reversed.toList();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _StoryIntro(),
        Section(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const EditorialRule(label: 'The journey'),
              const SizedBox(height: AppSpacing.xl),
              for (final exp in ordered) _TimelineEntry(experience: exp),
              const SizedBox(height: AppSpacing.lg),
              const EditorialRule(label: 'So far'),
              const SizedBox(height: AppSpacing.xl),
              AppButton.outline(
                'See the work it shaped',
                onTap: () => context.go('/case-studies'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StoryIntro extends StatelessWidget {
  const _StoryIntro();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Section(
      padding: const EdgeInsets.only(top: AppSpacing.xxl, bottom: AppSpacing.xl),
      child: RevealOnScroll(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Eyebrow('My story'),
            const SizedBox(height: 24),
            SelectableText(
              'From business school to automotive marketing — built on '
              'experiments, opportunities, mistakes and people.',
              style: theme.textTheme.displaySmall?.copyWith(
                color: AppColors.textPrimary,
                height: 1.1,
              ),
            ),
            const SizedBox(height: 20),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: SelectableText(
                'This is the thread that runs through every campaign, every '
                'partnership and every lesson worth keeping: marketing is '
                'storytelling you can defend.',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Timeline
// ---------------------------------------------------------------------------
class _TimelineEntry extends StatelessWidget {
  const _TimelineEntry({required this.experience});
  final Experience experience;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xl),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Period rail
          SizedBox(
            width: 108,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  experience.periodDisplay,
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: AppColors.accent,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Container(width: 1.4, height: 40, color: AppColors.border),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.lg),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (experience.imagePath.isNotEmpty) ...[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(2),
                    child: SizedBox(
                      height: 160,
                      width: double.infinity,
                      child: EditorialImageSlot(
                        path: experience.imagePath,
                        label: experience.organization,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                ],
                Text(
                  experience.organization,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  experience.role,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: AppColors.accent,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (experience.headline.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(
                    experience.headline,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
                const SizedBox(height: 10),
                Text(
                  experience.summary,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                if (experience.achievements.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  _Bullets(experience.achievements),
                ],
                if (experience.lessons.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  _Lessons(experience.lessons),
                ],
                if (experience.focus.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      for (final f in experience.focus) _FocusChip(f),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Bullets extends StatelessWidget {
  const _Bullets(this.items);
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final item in items)
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 7, right: 8),
                  child: Container(
                    width: 5,
                    height: 5,
                    decoration: const BoxDecoration(
                      color: AppColors.accent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    item,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _Lessons extends StatelessWidget {
  const _Lessons(this.items);
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 720),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: const BoxDecoration(
            color: AppColors.surface,
            border: Border(left: BorderSide(color: AppColors.accent, width: 3)),
          ),
          child: Text(
            items.first,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: AppColors.textPrimary,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ),
    );
  }
}

class _FocusChip extends StatelessWidget {
  const _FocusChip(this.label);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.textMuted,
            ),
      ),
    );
  }
}