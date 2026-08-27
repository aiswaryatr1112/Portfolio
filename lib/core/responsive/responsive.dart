import 'package:flutter/widgets.dart';
import '../design_tokens.dart';

/// Breakpoints. Deliberate layouts per class — not clamped downscaling.
enum Breakpoint {
  mobile, // < 600
  tablet, // 600 – 1024
  desktop, // > 1024
}

extension BreakpointX on Breakpoint {
  bool get isMobile => this == Breakpoint.mobile;
  bool get isTablet => this == Breakpoint.tablet;
  bool get isDesktop => this == Breakpoint.desktop;
  bool get isNarrow => this == Breakpoint.mobile || this == Breakpoint.tablet;

  /// Maximum content width to apply for this breakpoint.
  double get maxContentWidth {
    switch (this) {
      case Breakpoint.mobile:
        return AppWidths.mobile;
      case Breakpoint.tablet:
        return AppWidths.tablet;
      case Breakpoint.desktop:
        return AppWidths.wideDesktop;
    }
  }
}

/// Resolves the current [Breakpoint] from a width.
Breakpoint breakpointFromWidth(double width) {
  if (width < 600) return Breakpoint.mobile;
  if (width <= 1024) return Breakpoint.tablet;
  return Breakpoint.desktop;
}

/// Responsive helpers attached to BuildContext.
extension ResponsiveContext on BuildContext {
  Breakpoint get breakpoint =>
      breakpointFromWidth(MediaQuery.sizeOf(this).width);

  bool get isMobile => breakpoint == Breakpoint.mobile;
  bool get isTablet => breakpoint == Breakpoint.tablet;
  bool get isDesktop => breakpoint == Breakpoint.desktop;
  bool get isNarrow => isMobile || isTablet;

  double get screenHeight => MediaQuery.sizeOf(this).height;
  double get screenWidth => MediaQuery.sizeOf(this).width;
}

/// Supplies the page-level [ScrollController] down to scroll-aware widgets
/// (reveals, timeline progress, sticky navbar). Each routed page installs one
/// of these around its scrollable.
class PageScroll extends InheritedWidget {
  const PageScroll({
    super.key,
    required this.controller,
    required super.child,
  }) : super();

  final ScrollController controller;

  static PageScroll? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<PageScroll>();

  static ScrollController? controllerOf(BuildContext context) =>
      maybeOf(context)?.controller;

  @override
  bool updateShouldNotify(covariant PageScroll oldWidget) =>
      oldWidget.controller != controller;
}

/// Reveals its child with a subtle fade + upward slide the first time the
/// child enters the viewport. Reduced-motion users see it instantly.
class RevealOnScroll extends StatefulWidget {
  const RevealOnScroll({
    super.key,
    required this.child,
    this.offset = 26,
    this.duration = const Duration(milliseconds: 750),
  });

  final Widget child;
  final double offset;
  final Duration duration;

  @override
  State<RevealOnScroll> createState() => _RevealOnScrollState();
}

class _RevealOnScrollState extends State<RevealOnScroll>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;
  late final Animation<Offset> _slide;
  ScrollController? _scroll;
  bool _revealed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..addStatusListener((s) {
        if (s == AnimationStatus.completed) _revealed = true;
      });
    final curve =
        CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);
    _opacity = curve;
    _slide = Tween<Offset>(
      begin: Offset(0, 0.02),
      end: Offset.zero,
    ).animate(curve);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final scroll = PageScroll.controllerOf(context);
    if (scroll != _scroll) {
      _scroll?.removeListener(_onScroll);
      _scroll = scroll;
      _scroll?.addListener(_onScroll);
    }
    if (MediaQuery.disableAnimationsOf(context)) {
      _controller.value = 1;
    } else {
      _onScroll();
    }
  }

  void _onScroll() {
    if (_revealed || _controller.isAnimating) return;
    final box = context.findRenderObject();
    if (box is! RenderBox) return;
    final top = box.localToGlobal(Offset.zero).dy;
    final vh = MediaQuery.sizeOf(context).height;
    if (top < vh * 0.9) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _scroll?.removeListener(_onScroll);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: SlideTransition(
        position: _slide,
        child: widget.child,
      ),
    );
  }
}