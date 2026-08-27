import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../pages/home/home_page.dart';
import '../pages/story/story_page.dart';
import '../pages/case_studies/case_studies_page.dart';
import '../pages/case_studies/case_study_detail_page.dart';
import '../pages/blog/blog_page.dart';
import '../pages/blog/blog_article_page.dart';
import '../pages/guest_talks/guest_talks_page.dart';
import '../widgets/shell.dart';
import '../pages/not_found_page.dart';

/// Root GoRouter config. A shell route keeps the Navbar and Footer persistent
/// while child routes swap page content. Public routes have stable URLs for
/// deep linking, browser history, and refresh.
final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (_, __) => const _Shell(child: HomePage())),
    GoRoute(path: '/story', builder: (_, __) => const _Shell(child: StoryPage())),
    GoRoute(
        path: '/case-studies',
        builder: (_, __) => const _Shell(child: CaseStudiesPage())),
    GoRoute(
      path: '/case-studies/:slug',
      builder: (_, state) => _Shell(
        child: CaseStudyDetailPage(slug: state.pathParameters['slug']!),
      ),
    ),
    GoRoute(path: '/blog', builder: (_, __) => const _Shell(child: BlogPage())),
    GoRoute(
      path: '/blog/:slug',
      builder: (_, state) =>
          _Shell(child: BlogArticlePage(slug: state.pathParameters['slug']!)),
    ),
    GoRoute(
        path: '/guest-talks',
        builder: (_, __) => const _Shell(child: GuestTalksPage())),
    GoRoute(path: '/404', builder: (_, __) => const NotFoundPage()),
  ],
  errorBuilder: (_, __) => const NotFoundPage(),
);

class _Shell extends StatelessWidget {
  const _Shell({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) => PortfolioShell(child: child);
}