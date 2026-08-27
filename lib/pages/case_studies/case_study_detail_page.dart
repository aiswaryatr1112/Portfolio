import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/design_tokens.dart';
import '../../data/blog_data.dart';
import '../../data/case_study_data.dart';
import '../../models/blog_post.dart';
import '../../models/case_study.dart';
import '../../widgets/app_button.dart';
import '../../widgets/editorial_content.dart';
import '../../widgets/section_shell.dart';

/// Full editorial view of a single case study, keyed by stable slug so the
/// route can be deep-linked and refreshed.
class CaseStudyDetailPage extends StatelessWidget {
  const CaseStudyDetailPage({super.key, required this.slug});

  final String slug;

  @override
  Widget build(BuildContext context) {
    final matches = caseStudies.where((s) => s.slug == slug).toList();
    final study = matches.isEmpty ? null : matches.first;

    if (study == null) {
      return _missingStudy(context);
    }

    final relatedPosts = blogPosts
        .where((p) => study.related.contains(p.slug))
        .toList();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _StudyHeader(study: study),
        Section(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (study.hasFullContent) ...[
                _StudyBlock(
                  label: 'The challenge',
                  body: study.challenge,
                ),
                _StudyBlock(
                  label: 'The objective',
                  body: study.objective,
                ),
              ],
              _StudyBlock(label: 'The strategy', body: study.strategy),
              _StudyBlock(label: 'The execution', body: study.execution),
              _StudyBlock(label: 'The outcome', body: study.outcome),
            ],
          ),
        ),
        if (relatedPosts.isNotEmpty) _RelatedStories(posts: relatedPosts),
        _CaseNextCta(),
      ],
    );
  }

  /// Graceful empty state when a route points at a slug without content.
  Widget _missingStudy(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSpacing.xl),
          Icon(Icons.search_off, size: 48, color: AppColors.textMuted),
          const SizedBox(height: 16),
          Text(
            'This case study could not be found.',
            style: theme.textTheme.headlineSmall,
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: AppButton.outline(
              'All case studies',
              onTap: () => context.go('/case-studies'),
            ),
          ),
        ],
      ),
    );
  }
}

class _StudyHeader extends StatelessWidget {
  const _StudyHeader({required this.study});
  final CaseStudy study;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Section(
      padding: const EdgeInsets.only(top: AppSpacing.xl, bottom: AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Eyebrow('Case study'),
          const SizedBox(height: 24),
          Text(
            '${study.category.toUpperCase()} · ${study.year}',
            style: theme.textTheme.bodySmall?.copyWith(
              color: AppColors.accent,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 10),
          SelectableText(
            study.title,
            style: theme.textTheme.displaySmall?.copyWith(
              color: AppColors.textPrimary,
              height: 1.08,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            study.summary,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: EditorialImageSlot(
                path: study.heroImage,
                label: '${study.title} cover',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// ---------------------------------------------------------------------------
// Content sections
// ---------------------------------------------------------------------------
class _StudyBlock extends StatelessWidget {
  const _StudyBlock({
    required this.label,
    required this.body,
  });

  final String label;
  final String body;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (body.trim().isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EditorialRule(label: label),
          const SizedBox(height: AppSpacing.md),
          SelectableText(
            body,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _RelatedStories extends StatelessWidget {
  const _RelatedStories({required this.posts});
  final List<BlogPost> posts;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Section(
      background: AppColors.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(
            eyebrow: 'Read on',
            title: 'Related stories from the journal',
          ),
          const SizedBox(height: AppSpacing.lg),
          for (final post in posts) ...[
            InkWell(
              onTap: () => context.push('/blog/${post.slug}'),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_outward, size: 18, color: AppColors.accent),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        post.title,
                        style: theme.textTheme.titleLarge?.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      post.dateLabel,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: AppColors.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(color: AppColors.border, height: 1),
          ],
        ],
      ),
    );
  }
}

class _CaseNextCta extends StatelessWidget {
  const _CaseNextCta();

  @override
  Widget build(BuildContext context) {
    return Section(
      child: AppButton.outline(
        'All case studies',
        onTap: () => context.go('/case-studies'),
      ),
    );
  }
}