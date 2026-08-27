import 'package:flutter/material.dart';

import '../../core/constants/app_config.dart';
import '../../core/design_tokens.dart';
import '../../core/responsive/responsive.dart';
import '../../core/utils/url_launcher_util.dart';
import '../../data/guest_talk_data.dart';
import '../../models/guest_talk.dart';
import '../../widgets/section_shell.dart';

/// Guest talks index plus the placeholder testimonials band.
class GuestTalksPage extends StatelessWidget {
  const GuestTalksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _TalksIntro(),
        Section(
          child: _TalksGrid(
            items: [
              for (final talk in guestTalks) _TalkCard(talk: talk),
            ],
          ),
        ),
        const _TestimonialSection(),
      ],
    );
  }
}

class _TalksIntro extends StatelessWidget {
  const _TalksIntro();

  @override
  Widget build(BuildContext context) {
    return Section(
      padding: const EdgeInsets.only(top: AppSpacing.xxl, bottom: AppSpacing.xl),
      child: const SectionHeading(
        eyebrow: 'Guest talks',
        title: 'Conversations worth having',
        subtitle:
            'Speakings, panels and conversations on marketing, automotive and '
            'business. Placeholder entries are clearly marked until real events '
            'are added.',
      ),
    );
  }
}

class _TalksGrid extends StatelessWidget {
  const _TalksGrid({required this.items});
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
          children: [for (final item in items) SizedBox(width: w, child: item)],
        );
      },
    );
  }
}

class _TalkCard extends StatelessWidget {
  const _TalkCard({required this.talk});
  final GuestTalk talk;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: AppColors.accent.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(2),
            ),
            child: Text(
              talk.event.toUpperCase(),
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.accent,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.1,
              ),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            talk.topic,
            style: theme.textTheme.headlineSmall?.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${talk.location} · ${talk.date}',
            style: theme.textTheme.bodySmall?.copyWith(
              color: AppColors.textMuted,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            talk.description,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 16),
          TextButton.icon(
            onPressed: () {
              if (talk.link.isNotEmpty) {
                UrlLauncherUtil.launchWeb(context, talk.link);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Details to be added'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              }
            },
            icon: const Icon(Icons.arrow_outward,
                size: 16, color: AppColors.accent),
            label: const Text(
              'Details to be added',
              style: TextStyle(color: AppColors.accent),
            ),
          ),
        ],
      ),
    );
  }
}

class _TestimonialSection extends StatelessWidget {
  const _TestimonialSection();

  @override
  Widget build(BuildContext context) {
    return Section(
      background: AppColors.surfaceMuted,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(
            eyebrow: 'In their words',
            title: 'What people say',
          ),
          const SizedBox(height: AppSpacing.xl),
          _TalksGrid(
            items: [
              for (final t in testimonialPlaceholders)
                _TestimonialCard(testimonial: t),
            ],
          ),
          if (AppConfig.testimonialsArePlaceholders) ...[
            const SizedBox(height: AppSpacing.md),
            Text(
              'Placeholder testimonials — to be replaced with real, approved quotes.',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textMuted,
                    fontStyle: FontStyle.italic,
                  ),
            ),
          ],
        ],
      ),
    );
  }
}

class _TestimonialCard extends StatelessWidget {
  const _TestimonialCard({required this.testimonial});
  final Testimonial testimonial;

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
          const Icon(Icons.format_quote, color: AppColors.accent, size: 26),
          const SizedBox(height: 12),
          Text(
            testimonial.quote,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: AppColors.textPrimary,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            testimonial.person,
            style: theme.textTheme.titleLarge?.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            '${testimonial.designation} · ${testimonial.company}',
            style: theme.textTheme.bodySmall?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}