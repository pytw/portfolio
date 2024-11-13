import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

enum AnimationType {
  slide,
  fade,
  scale,
  rotate,
  bounce,
  fadeAndSlide,
}

class CustomAnimation extends StatefulWidget {
  final Widget child;
  final AnimationType animationType;
  final Offset begin;
  final Duration duration;
  final Duration delay;
  final Curve curve;
  final bool initiallyVisible;

  const CustomAnimation({
    super.key,
    required this.child,
    this.animationType = AnimationType.slide,
    this.begin = const Offset(0.0, -1.0),
    this.duration = const Duration(milliseconds: 500),
    this.delay = const Duration(milliseconds: 0),
    this.curve = Curves.easeInOut,
    this.initiallyVisible = false,
  });

  @override
  State<CustomAnimation> createState() => _CustomAnimationState();
}

class _CustomAnimationState extends State<CustomAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotateAnimation;
  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _fadeAnimation =
        Tween<double>(begin: widget.initiallyVisible ? 1.0 : 0.0, end: 1.0)
            .animate(CurvedAnimation(parent: _controller, curve: widget.curve));

    _slideAnimation = Tween<Offset>(begin: widget.begin, end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: widget.curve));

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: widget.curve));

    _rotateAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: widget.curve));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    if (!_hasAnimated && mounted) {
      Future.delayed(widget.delay, () {
        if (mounted) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              _controller.forward(from: 0.0);
            }
          });
        }
      });
      _hasAnimated = true;
    }
  }

  void _resetAnimation() {
    if (mounted) {
      _hasAnimated = false;
      _controller.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('custom-animation-${widget.hashCode}'),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0 && mounted) {
          _startAnimation();
        } else {
          _resetAnimation();
        }
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          if (_controller.status == AnimationStatus.dismissed &&
              !widget.initiallyVisible) {
            return Opacity(
              opacity: 0.0,
              child: widget.child,
            );
          }

          switch (widget.animationType) {
            case AnimationType.fade:
              return Opacity(
                opacity: _fadeAnimation.value,
                child: widget.child,
              );
            case AnimationType.scale:
              return Transform.scale(
                scale: _scaleAnimation.value,
                child: widget.child,
              );
            case AnimationType.rotate:
              return Transform.rotate(
                angle: _rotateAnimation.value * 2 * math.pi,
                child: widget.child,
              );
            case AnimationType.bounce:
              return Transform.scale(
                scale: 1 + (_scaleAnimation.value - 1) * 0.15,
                child: widget.child,
              );
            case AnimationType.fadeAndSlide:
              return SlideTransition(
                position: _slideAnimation,
                child: Opacity(
                  opacity: _fadeAnimation.value,
                  child: widget.child,
                ),
              );
            case AnimationType.slide:
            default:
              return SlideTransition(
                position: _slideAnimation,
                child: widget.child,
              );
          }
        },
      ),
    );
  }
}
