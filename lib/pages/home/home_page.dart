import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_config.dart';
import '../../core/design_tokens.dart';
import '../../core/responsive/responsive.dart';
import '../../data/blog_data.dart';
import '../../data/case_study_data.dart';
import '../../data/guest_talk_data.dart';
import '../../data/stats_data.dart';
import '../../models/blog_post.dart';
import '../../models/case_study.dart';
import '../../models/shared_stat.dart';
import '../../widgets/animated_counter.dart';
import '../../widgets/app_button.dart';
import '../../widgets/editorial_content.dart';
import '../../widgets/section_shell.dart';
import '../../widgets/whatsapp_dialog.dart';

/// Landing page: introduces who Nikhil is, fronts his strongest signal, and
/// points toward the deeper stories (case studies, journal, talks, contact).
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Hero(),
        _StatsBand(),
        _SelectedWork(),
        _RecentWriting(),
        _TestimonialBand(),
        _ClosingCta(),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Hero
// ---------------------------------------------------------------------------
class _Hero extends StatelessWidget {
  const _Hero();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Section(
      padding: const EdgeInsets.only(top: AppSpacing.xxl, bottom: AppSpacing.xl),
      child: RevealOnScroll(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Eyebrow('Marketing • Automotive • Storytelling'),
            const SizedBox(height: 26),
            SelectableText(
              AppConfig.name,
              style: theme.textTheme.displayLarge?.copyWith(
                color: AppColors.textPrimary,
                height: 1.02,
              ),
            ),
            const SizedBox(height: 20),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: SelectableText(
                'An editorial portfolio built around the campaigns, cars and '
                'stories that shaped how I think about marketing.',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ),
            const SizedBox(height: 36),
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.md,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                AppButton.primary(
                  'Let’s talk',
                  icon: Icons.chat_bubble_outline,
                  onTap: () => showWhatsAppDialog(context),
                ),
                AppButton.text(
                  'View case studies',
                  onTap: () => context.go('/case-studies'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Stats band
// ---------------------------------------------------------------------------
class _StatsBand extends StatelessWidget {
  const _StatsBand();

  @override
  Widget build(BuildContext context) {
    return Section(
      background: AppColors.surface,
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const EditorialRule(label: 'By the numbers'),
          const SizedBox(height: AppSpacing.lg),
          LayoutBuilder(
            builder: (context, constraints) {
              final count = context.isMobile ? 1 : (context.isTablet ? 2 : 4);
              final w = (constraints.maxWidth - (count - 1) * AppSpacing.lg) / count;
              return Wrap(
                spacing: AppSpacing.lg,
                runSpacing: AppSpacing.lg,
                children: [
                  for (final stat in keyStats) _StatCell(stat: stat, width: w),
                ],
              );
            },
          ),
          const SizedBox(height: AppSpacing.md),
          if (AppConfig.keyFactsArePlaceholders)
            Text(
              'Indicative figures — to be confirmed.',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textMuted,
                    fontStyle: FontStyle.italic,
                  ),
            ),
        ],
      ),
    );
  }
}

class _StatCell extends StatelessWidget {
  const _StatCell({required this.stat, required this.width});
  final SharedStat stat;
  final double width;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedCounter(
            value: stat.value,
            suffix: stat.valueLabel,
            style: theme.textTheme.displayMedium?.copyWith(
              color: AppColors.accent,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            stat.label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Selected work (case studies)
// ---------------------------------------------------------------------------
class _SelectedWork extends StatelessWidget {
  const _SelectedWork();

  @override
  Widget build(BuildContext context) {
    final items = caseStudies.take(3).toList();
    return Section(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(
            eyebrow: 'Selected work',
            title: 'Campaigns that shaped how I think',
            subtitle:
                'A few chapters from the case studies — each one a real story '
                'about a brand, a market and a bet.',
          ),
          const SizedBox(height: AppSpacing.xl),
          _ResponsiveGrid(
            items: [
              for (final cs in items)
                _CaseStudyCard(
                  study: cs,
                  onTap: () => context.push('/case-studies/${cs.slug}'),
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.xl),
          AppButton.outline(
            'All case studies',
            onTap: () => context.go('/case-studies'),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Journal (blog)
// ---------------------------------------------------------------------------
class _RecentWriting extends StatelessWidget {
  const _RecentWriting();

  @override
  Widget build(BuildContext context) {
    final featured = blogPosts.where((p) => p.featured).toList();
    final posts =
        (featured.isNotEmpty ? featured : blogPosts).take(3).toList();
    return Section(
      background: AppColors.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(
            eyebrow: 'Ideas & lessons',
            title: 'The journal',
            subtitle: 'Field notes on marketing, cars, travel and curiosity.',
          ),
          const SizedBox(height: AppSpacing.xl),
          _ResponsiveGrid(
            items: [
              for (final post in posts)
                _BlogCard(
                  post: post,
                  onTap: () => context.push('/blog/${post.slug}'),
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.xl),
          AppButton.text(
            'Read the journal',
            onTap: () => context.go('/blog'),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Testimonials
// ---------------------------------------------------------------------------
class _TestimonialBand extends StatelessWidget {
  const _TestimonialBand();

  @override
  Widget build(BuildContext context) {
    return Section(
      background: AppColors.surfaceMuted,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(
            eyebrow: 'In their words',
            title: 'What people say about working with me',
          ),
          const SizedBox(height: AppSpacing.xl),
          _ResponsiveGrid(
            items: [
              for (final t in testimonialPlaceholders.take(3))
                _TestimonialCard(t.quote, t.person, t.designation),
            ],
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Closing CTA
// ---------------------------------------------------------------------------
class _ClosingCta extends StatelessWidget {
  const _ClosingCta();

  @override
  Widget build(BuildContext context) {
    return Section(
      background: AppColors.charcoal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(
            eyebrow: 'What’s next?',
            title: 'Every brand has a story worth telling well.',
            subtitle:
                'If you’ve got a product, a category or a tricky market — let’s '
                'talk about where the story starts.',
            light: true,
          ),
          const SizedBox(height: AppSpacing.xl),
          AppButton.primary(
            'Start the conversation',
            icon: Icons.chat_bubble_outline,
            onTap: () => showWhatsAppDialog(context),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Shared responsive helpers
// ---------------------------------------------------------------------------
class _ResponsiveGrid extends StatelessWidget {
  const _ResponsiveGrid({required this.items});
  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    final count = context.isMobile ? 1 : (context.isTablet ? 2 : 3);
    return LayoutBuilder(
      builder: (context, constraints) {
        final w = (constraints.maxWidth - (count - 1) * AppSpacing.lg) / count;
        return Wrap(
          spacing: AppSpacing.lg,
          runSpacing: AppSpacing.lg,
          children: [
            for (final item in items) SizedBox(width: w, child: item),
          ],
        );
      },
    );
  }
}

class _CaseStudyCard extends StatelessWidget {
  const _CaseStudyCard({required this.study, required this.onTap});
  final CaseStudy study;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 4 / 3,
            child: EditorialImageSlot(path: study.heroImage, label: study.title),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Text(
                '${study.year}',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: AppColors.textMuted,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  study.category.toUpperCase(),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: AppColors.accent,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            study.title,
            style: theme.textTheme.titleLarge?.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            study.summary,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _BlogCard extends StatelessWidget {
  const _BlogCard({required this.post, required this.onTap});
  final BlogPost post;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 4 / 3,
            child: EditorialImageSlot(path: post.heroImage, label: post.title),
          ),
          const SizedBox(height: 14),
          Text(
            '${post.category.toUpperCase()} · ${post.dateLabel}',
            style: theme.textTheme.bodySmall?.copyWith(
              color: AppColors.accent,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            post.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.headlineSmall?.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            post.excerpt,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _TestimonialCard extends StatelessWidget {
  const _TestimonialCard(this.quote, this.person, this.designation);
  final String quote;
  final String person;
  final String designation;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.format_quote, color: AppColors.accent, size: 28),
          const SizedBox(height: 12),
          Text(
            quote,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: AppColors.textPrimary,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            person,
            style: theme.textTheme.titleLarge?.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            designation,
            style: theme.textTheme.bodySmall?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}