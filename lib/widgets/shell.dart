import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/design_tokens.dart';
import '../core/responsive/responsive.dart';
import '../core/utils/seo_service.dart';
import 'navbar.dart';
import 'footer.dart';

/// Persistent application shell: owns the scroll position so the [Navbar] can
/// react to it, mounts the [`]/, Footer] framing and provides [PageScroll] to
/// every scroll-aware descendant. Also sets per-route SEO metadata.
class PortfolioShell extends StatefulWidget {
  const PortfolioShell({super.key, required this.child});
  final Widget child;

  @override
  State<PortfolioShell> createState() => _PortfolioShellState();
}

class _PortfolioShellState extends State<PortfolioShell> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _applyMeta();
  }

  /// Title + description per route (web only).
  void _applyMeta() {
    final path = GoRouter.of(context).routerDelegate.currentConfiguration.uri.path;
    final (title, description) = _metaFor(path);
    setPageMeta(title: title, description: description);
  }

  (String, String?) _metaFor(String path) {
    switch (path) {
      case '/story':
        return (
          'My Story — Nikhil Thekkumkoottathil',
          'A career built through experiments, opportunities, mistakes, people and lessons — from business school to automotive marketing.'
        );
      case '/case-studies':
        return (
          'Case Studies — Nikhil Thekkumkoottathil',
          'Selected campaigns and projects that shaped how I think about marketing.'
        );
      case '/blog':
        return (
          'Ideas, Lessons & Stories — Nikhil Thekkumkoottathil',
          'Things I\u2019ve learned from marketing, sales, travel, automotive and being curious.'
        );
      case '/guest-talks':
        return (
          'Guest Talks — Nikhil Thekkumkoottathil',
          'Conversations and perspectives on marketing, automotive and business.'
        );
      default:
        return (
          'Nikhil Thekkumkoottathil — Marketing, Automotive, Storytelling',
          'Marketing professional, storyteller and automotive enthusiast with experience across brands, markets and industries.'
        );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Navbar(scrollController: _controller),
          Expanded(
            child: PageScroll(
              controller: _controller,
              // One scrollable owns both the routed page content and the
              // footer, so short viewports never overflow. The navbar stays
              // fixed and reacts to the shared scroll position.
              child: ListView(
                controller: _controller,
                padding: EdgeInsets.zero,
                children: [widget.child, const Footer()],
              ),
            ),
          ),
        ],
      ),
    );
  }
}