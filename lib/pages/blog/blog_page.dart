import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/design_tokens.dart';
import '../../core/responsive/responsive.dart';
import '../../data/blog_data.dart';
import '../../models/blog_post.dart';
import '../../widgets/editorial_content.dart';
import '../../widgets/section_shell.dart';

/// Journal index. A featured story opens the page; the rest flow beneath it.
class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final featuredPosts = blogPosts.where((p) => p.featured).toList();
    final featured = featuredPosts.isEmpty ? null : featuredPosts.first;
    final rest = blogPosts.where((p) => p.slug != featured?.slug).toList();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _BlogIntro(),
        Section(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (featured != null) ...[
                _FeaturedBlogPost(post: featured),
                const SizedBox(height: AppSpacing.xl),
                const EditorialRule(label: 'More stories'),
                const SizedBox(height: AppSpacing.xl),
              ],
              _PostGrid(posts: rest),
            ],
          ),
        ),
      ],
    );
  }
}

class _BlogIntro extends StatelessWidget {
  const _BlogIntro();

  @override
  Widget build(BuildContext context) {
    return Section(
      padding: const EdgeInsets.only(top: AppSpacing.xxl, bottom: AppSpacing.xl),
      child: const SectionHeading(
        eyebrow: 'The journal',
        title: 'Ideas, lessons & stories',
        subtitle:
            'Field notes on marketing, sales, automotive, travel and the kind '
            'of questions that keep a career interesting.',
      ),
    );
  }
}

class _FeaturedBlogPost extends StatelessWidget {
  const _FeaturedBlogPost({required this.post});
  final BlogPost post;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () => context.push('/blog/${post.slug}'),
      borderRadius: BorderRadius.circular(2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: AspectRatio(
              aspectRatio: 16 / 7,
              child: EditorialImageSlot(
                path: post.heroImage,
                label: '${post.title} cover',
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            'FEATURED · ${post.category.toUpperCase()} · ${post.dateLabel} · '
            '${post.readingMinutes} min',
            style: theme.textTheme.bodySmall?.copyWith(
              color: AppColors.accent,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.1,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            post.title,
            style: theme.textTheme.displaySmall?.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Text(
              post.excerpt,
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

class _PostGrid extends StatelessWidget {
  const _PostGrid({required this.posts});
  final List<BlogPost> posts;

  @override
  Widget build(BuildContext context) {
    final count = context.isMobile ? 1 : (context.isTablet ? 2 : 2);
    return LayoutBuilder(
      builder: (context, constraints) {
        final w = (constraints.maxWidth - (count - 1) * AppSpacing.lg) / count;
        return Wrap(
          spacing: AppSpacing.lg,
          runSpacing: AppSpacing.xl,
          children: [
            for (final post in posts) SizedBox(width: w, child: _PostCard(post: post)),
          ],
        );
      },
    );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({required this.post});
  final BlogPost post;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () => context.push('/blog/${post.slug}'),
      borderRadius: BorderRadius.circular(2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: EditorialImageSlot(path: post.heroImage, label: post.title),
          ),
          const SizedBox(height: 14),
          Text(
            '${post.category.toUpperCase()} · ${post.dateLabel} · '
            '${post.readingMinutes} min',
            style: theme.textTheme.bodySmall?.copyWith(
              color: AppColors.accent,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.1,
            ),
          ),
          const SizedBox(height: 8),
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
            style: theme.textTheme.bodyLarge?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}