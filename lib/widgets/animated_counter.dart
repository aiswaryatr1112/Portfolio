import 'package:flutter/material.dart';
import '../../core/responsive/responsive.dart';
import '../../core/design_tokens.dart';

/// Counts from 0 to [value] (with a [suffix] like "+") when the widget scrolls
/// into view. Honors reduced-motion by snapping instantly to the final value.
class AnimatedCounter extends StatefulWidget {
  const AnimatedCounter({
    super.key,
    required this.value,
    required this.suffix,
    this.style,
  });

  final num value;
  final String suffix;
  final TextStyle? style;

  @override
  State<AnimatedCounter> createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<AnimatedCounter>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _anim;
  ScrollController? _scroll;
  bool _started = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1400))
      ..addListener(() => setState(() {}));
    final curve = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _anim = Tween(begin: 0.0, end: widget.value.toDouble()).animate(curve);
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
      _started = true;
    } else {
      _onScroll();
    }
  }

  void _onScroll() {
    if (_started || _controller.isAnimating) return;
    final box = context.findRenderObject();
    if (box is! RenderBox) return;
    final top = box.localToGlobal(Offset.zero).dy;
    final vh = MediaQuery.sizeOf(context).height;
    if (top < vh * 0.92) {
      _started = true;
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
    final shown = _anim.value.round();
    return Text(
      '$shown${widget.suffix}',
      style: widget.style ??
          const TextStyle(
            fontSize: 64,
            height: 1,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
            letterSpacing: -1,
          ),
    );
  }
}