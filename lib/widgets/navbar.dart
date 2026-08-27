import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/constants/app_config.dart';
import '../core/design_tokens.dart';
import '../core/responsive/responsive.dart';
import '../core/utils/url_launcher_util.dart';
import 'whatsapp_dialog.dart';

/// Navigation definitions used by both the desktop bar and the mobile menu.
const List<({String label, String path})> _navLinks = [
  (label: 'Intro', path: '/'),
  (label: 'Story', path: '/story'),
  (label: 'Case Studies', path: '/case-studies'),
  (label: 'Blog', path: '/blog'),
  (label: 'Guest Talks', path: '/guest-talks'),
];

/// Minimal sticky navigation. Shrinks with a subtle background + border while
/// scrolling. Desktop shows inline links; mobile uses an expandable menu.
class Navbar extends StatefulWidget {
  const Navbar({super.key, this.scrollController});

  final ScrollController? scrollController;

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  double _offset = 0;
  bool _menuOpen = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController?.addListener(_onScroll);
  }

  void _onScroll() {
    final o = widget.scrollController?.position.pixels ?? 0;
    if ((o - _offset).abs() > 2) setState(() => _offset = o);
  }

  @override
  void didUpdateWidget(covariant Navbar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.scrollController != widget.scrollController) {
      oldWidget.scrollController?.removeListener(_onScroll);
      widget.scrollController?.addListener(_onScroll);
    }
  }

  @override
  void dispose() {
    widget.scrollController?.removeListener(_onScroll);
    super.dispose();
  }

  bool get _scrolled => _offset > 40;

  @override
  Widget build(BuildContext context) {
    final bar = context.breakpoint == Breakpoint.mobile
        ? _mobileBar(context)
        : _desktopBar(context);

    return Container(
      width: double.infinity,
      color: _scrolled ? AppColors.background : Colors.transparent,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: _scrolled ? AppColors.border : Colors.transparent,
            ),
          ),
        ),
        child: Column(
          children: [
            bar,
            if (context.breakpoint == Breakpoint.mobile)
              AnimatedSize(
                duration: const Duration(milliseconds: 260),
                curve: Curves.easeOut,
                alignment: Alignment.topCenter,
                child: _menuOpen ? _menu(context) : const SizedBox(width: double.infinity),
              ),
          ],
        ),
      ),
    );
  }

  Widget _desktopBar(BuildContext context) {
    final compact = _scrolled;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.xl,
        vertical: compact ? 14 : 20,
      ),
      child: Row(
        children: [
          _Logo(compact: compact, onTap: () => context.go('/')),
          const SizedBox(width: AppSpacing.xl),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Wrap(
                spacing: 22,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  for (final l in _navLinks) _NavItem(l.label, l.path),
                  _LinkedInItem(),
                  _ContactItem(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _mobileBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: _Logo(
              compact: true,
              onTap: () {
                setState(() => _menuOpen = false);
                context.go('/');
              },
            ),
          ),
          IconButton(
            tooltip: _menuOpen ? 'Close menu' : 'Open menu',
            onPressed: () => setState(() => _menuOpen = !_menuOpen),
            icon: Icon(
              _menuOpen ? Icons.close : Icons.menu,
              color: AppColors.textPrimary,
              size: 26,
            ),
          ),
        ],
      ),
    );
  }

  Widget _menu(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      margin: const EdgeInsets.only(top: 6),
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 20),
      child: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final l in _navLinks)
              _MenuLink(l.label, l.path, () => setState(() => _menuOpen = false)),
            const SizedBox(height: 4),
            InkWell(
              onTap: () {
                setState(() => _menuOpen = false);
                UrlLauncherUtil.launchWeb(context, AppConfig.linkedinUrl);
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  'LinkedIn',
                  style: TextStyle(fontSize: 17, color: AppColors.textPrimary),
                ),
              ),
            ),
            const SizedBox(height: 8),
            FilledButton.icon(
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.accent,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                setState(() => _menuOpen = false);
                showWhatsAppDialog(context);
              },
              icon: const Icon(Icons.chat_bubble_outline, size: 18),
              label: const Text('Contact'),
            ),
          ],
        ),
      ),
    );
  }
}
class _Logo extends StatelessWidget {
  const _Logo({required this.onTap, required this.compact});
  final VoidCallback onTap;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      hoverColor: Colors.transparent,
      child: Text(
        AppConfig.name,
        style: TextStyle(
          fontSize: compact ? 14 : 15.5,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.2,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem(this.label, this.path);
  final String label;
  final String path;

  @override
  Widget build(BuildContext context) {
    final active = _isActive(context, path);
    return TextButton(
      onPressed: () => context.go(path),
      style: TextButton.styleFrom(
        foregroundColor: active ? AppColors.accent : AppColors.textSecondary,
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
        textStyle: TextStyle(
          fontSize: 13.5,
          fontWeight: active ? FontWeight.w700 : FontWeight.w500,
        ),
      ),
      child: Text(label),
    );
  }
}

class _LinkedInItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => UrlLauncherUtil.launchWeb(context, AppConfig.linkedinUrl),
      style: TextButton.styleFrom(
        foregroundColor: AppColors.textSecondary,
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
        textStyle: const TextStyle(
          fontSize: 13.5,
          fontWeight: FontWeight.w500,
        ),
      ),
      child: const Text('LinkedIn'),
    );
  }
}

class _ContactItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.accent,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        visualDensity: VisualDensity.compact,
      ),
      onPressed: () => showWhatsAppDialog(context),
      child: const Text('Contact'),
    );
  }
}

class _MenuLink extends StatelessWidget {
  const _MenuLink(this.label, this.path, this.onClose);
  final String label;
  final String path;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    final active = _isActive(context, path);
    return InkWell(
      onTap: () {
        onClose();
        context.go(path);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 17,
            color: active ? AppColors.accent : AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

/// True when the route path equals the current location.
bool _isActive(BuildContext context, String path) =>
    GoRouter.of(context).routerDelegate.currentConfiguration.uri.path == path;