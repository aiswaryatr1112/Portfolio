import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/design_tokens.dart';
import '../../data/blog_data.dart';
import '../../models/blog_post.dart';
import '../../widgets/app_button.dart';
import '../../widgets/editorial_content.dart';
import '../../widgets/section_shell.dart';

/// Full article view, keyed by stable slug. Renders the guided editorial
/// content (paragraphs, subheads, pull quotes, bullets, images) in order.
class BlogArticlePage extends StatelessWidget {
  const BlogArticlePage({super.key, required this.slug});

  final String slug;

  @override
  Widget build(BuildContext context) {
    final matches = blogPosts.where((p) => p.slug == slug).toList();
    final post = matches.isEmpty ? null : matches.first;

    if (post == null) return _missingArticle(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ArticleHeader(post: post),
        Section(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final block in post.content) _ArticleBlockView(block: block),
              const SizedBox(height: AppSpacing.lg),
              EditorialRule(label: 'End'),
              const SizedBox(height: AppSpacing.lg),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final tag in post.tags) _TagChip(tag),
                ],
              ),
              const SizedBox(height: AppSpacing.xl),
              AppButton.outline(
                'Back to the journal',
                onTap: () => context.go('/blog'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _missingArticle(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSpacing.xl),
          Icon(Icons.article_outlined, size: 48, color: AppColors.textMuted),
          const SizedBox(height: 16),
          Text(
            'This article could not be found.',
            style: theme.textTheme.headlineSmall,
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: AppButton.outline(
              'Back to the journal',
              onTap: () => context.go('/blog'),
            ),
          ),
        ],
      ),
    );
  }
}

class _ArticleHeader extends StatelessWidget {
  const _ArticleHeader({required this.post});
  final BlogPost post;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Section(
      padding: const EdgeInsets.only(top: AppSpacing.xl, bottom: AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Eyebrow('Journal'),
          const SizedBox(height: 22),
          Text(
            '${post.category.toUpperCase()} · ${post.dateLabel} · '
            '${post.readingMinutes} min read',
            style: theme.textTheme.bodySmall?.copyWith(
              color: AppColors.accent,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 10),
          SelectableText(
            post.title,
            style: theme.textTheme.displaySmall?.copyWith(
              color: AppColors.textPrimary,
              height: 1.06,
            ),
          ),
          const SizedBox(height: 14),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Text(
              post.excerpt,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: EditorialImageSlot(
                path: post.heroImage,
                label: '${post.title} cover',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Article body rendering
// ---------------------------------------------------------------------------
class _ArticleBlockView extends StatelessWidget {
  const _ArticleBlockView({required this.block});
  final ArticleBlock block;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    switch (block.type) {
      case ArticleBlockType.paragraph:
        return Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.md),
          child: Text(
            block.text,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        );
      case ArticleBlockType.subheading:
        return Padding(
          padding:
              const EdgeInsets.only(top: AppSpacing.xl, bottom: AppSpacing.md),
          child: Text(
            block.text,
            style: theme.textTheme.headlineMedium?.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
        );
      case ArticleBlockType.pullQuote:
      case ArticleBlockType.quote:
        return _pullQuote(context, block.text);
      case ArticleBlockType.image:
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: EditorialImageSlot(
                path: block.imagePath ?? '',
                label: block.caption ?? 'Article image',
              ),
            ),
          ),
        );
      case ArticleBlockType.bullet:
        return Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, right: 10),
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
                  block.text,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ],
          ),
        );
    }
  }

  Widget _pullQuote(BuildContext context, String text) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(width: 3, height: 120, color: AppColors.accent),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: SelectableText(
              text,
              style: theme.textTheme.headlineMedium?.copyWith(
                color: AppColors.textPrimary,
                fontStyle: FontStyle.italic,
                height: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  const _TagChip(this.label);
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