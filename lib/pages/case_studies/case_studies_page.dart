import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/design_tokens.dart';
import '../../core/responsive/responsive.dart';
import '../../data/case_study_data.dart';
import '../../models/case_study.dart';
import '../../widgets/editorial_content.dart';
import '../../widgets/section_shell.dart';

/// Index of every case study as an editorial card grid.
class CaseStudiesPage extends StatelessWidget {
  const CaseStudiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _CaseStudiesIntro(),
        Section(
          child: _CaseGrid(
            items: [
              for (final cs in caseStudies)
                _CaseStudyCard(
                  study: cs,
                  onTap: () => context.push('/case-studies/${cs.slug}'),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CaseStudiesIntro extends StatelessWidget {
  const _CaseStudiesIntro();

  @override
  Widget build(BuildContext context) {
    return Section(
      padding: const EdgeInsets.only(top: AppSpacing.xxl, bottom: AppSpacing.xl),
      child: const SectionHeading(
        eyebrow: 'Case studies',
        title: 'The work worth the retelling',
        subtitle:
            'Selected campaigns and projects that shaped how I think about '
            'marketing — told honestly, with the outcome where it belongs: '
            'qualitatively, until real numbers are approved.',
      ),
    );
  }
}

class _CaseGrid extends StatelessWidget {
  const _CaseGrid({required this.items});
  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    final count = context.isMobile ? 1 : (context.isTablet ? 2 : 3);
    return LayoutBuilder(
      builder: (context, constraints) {
        final w = (constraints.maxWidth - (count - 1) * AppSpacing.lg) / count;
        return Wrap(
          spacing: AppSpacing.lg,
          runSpacing: AppSpacing.xl,
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
                '${study.year} · ${study.industry}',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            study.title,
            style: theme.textTheme.headlineSmall?.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            study.summary,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}