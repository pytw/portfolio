import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

/// Enum to define the type of animation.
enum AnimationType {
  slide,
  fade,
  scale,
  rotate,
  bounce,
  fadeAndSlide,
}

/// A customizable animation widget that triggers animations
/// when it comes into view.
///
/// ## Usage:
/// ```dart
/// CustomAnimation(
///   animationType: AnimationType.slide, // Specify the animation type
///   begin: Offset(0.0, -1.0), // Define the starting offset for slide animations
///   duration: Duration(milliseconds: 600), // Set animation duration
///   delay: Duration(milliseconds: 200), // Optional delay before animation starts
///   curve: Curves.easeInOut, // Optional curve for animation easing
///   initiallyVisible: false, // Start hidden (default is false)
///   child: YourChildWidget(), // Provide the widget to animate
/// )
/// ```
///
/// ## Animation Types:
/// - `AnimationType.slide`: Slides the widget in from a specified direction.
/// - `AnimationType.fade`: Fades the widget in.
/// - `AnimationType.scale`: Scales the widget from a smaller size to its original size.
/// - `AnimationType.rotate`: Rotates the widget into view.
/// - `AnimationType.bounce`: Applies a bounce effect while scaling.
/// - `AnimationType.fadeAndSlide`: Combines fading and sliding into view.
///
/// ## Slide Animation Direction:
/// You can specify the direction for the slide animations by adjusting the `begin` parameter:
/// - `Offset(0.0, -1.0)`: Slides in from the top.
/// - `Offset(0.0, 1.0)`: Slides in from the bottom.
/// - `Offset(-1.0, 0.0)`: Slides in from the left.
/// - `Offset(1.0, 0.0)`: Slides in from the right.
///
/// ## Example Usage:
///
/// ### Slide Animation from Top
/// ```dart
/// CustomAnimation(
///   animationType: AnimationType.slide,
///   begin: Offset(0.0, -1.0), // Slides in from the top
///   duration: Duration(milliseconds: 600),
///   delay: Duration(milliseconds: 200),
///   child: YourChildWidget(),
/// )
/// ```
///
/// ### Fade Animation
/// ```dart
/// CustomAnimation(
///   animationType: AnimationType.fade,
///   duration: Duration(milliseconds: 600),
///   child: YourChildWidget(),
/// )
/// ```
///
/// ### Scale Animation
/// ```dart
/// CustomAnimation(
///   animationType: AnimationType.scale,
///   duration: Duration(milliseconds: 600),
///   child: YourChildWidget(),
/// )
/// ```
///
/// ### Rotate Animation
/// ```dart
/// CustomAnimation(
///   animationType: AnimationType.rotate,
///   duration: Duration(milliseconds: 600),
///   child: YourChildWidget(),
/// )
/// ```
///
/// ### Bounce Animation
/// ```dart
/// CustomAnimation(
///   animationType: AnimationType.bounce,
///   duration: Duration(milliseconds: 600),
///   child: YourChildWidget(),
/// )
/// ```
///
/// ### Fade and Slide Animation
/// ```dart
/// CustomAnimation(
///   animationType: AnimationType.fadeAndSlide,
///   begin: Offset(0.0, -1.0), // Define starting offset for slide
///   duration: Duration(milliseconds: 600),
///   delay: Duration(milliseconds: 200),
///   child: YourChildWidget(),
/// )
/// ```
///
/// ## Parameters:
/// - `child`: The widget to animate.
/// - `animationType`: The type of animation to use (default is `AnimationType.slide`).
/// - `begin`: The starting position for slide animations (default is `Offset(0.0, -1.0)`).
/// - `duration`: The duration of the animation (default is 400 milliseconds).
/// - `delay`: Optional delay before the animation starts (default is 0 milliseconds).
/// - `curve`: The easing curve for the animation (default is `Curves.easeInOut`).
/// - `initiallyVisible`: Determines if the widget starts as visible (default is false).
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
    this.duration = const Duration(milliseconds: 400),
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

    // Initialize animations with the specified curve
    _fadeAnimation =
        Tween<double>(begin: widget.initiallyVisible ? 1.0 : 0.0, end: 1.0)
            .animate(CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ));

    _slideAnimation = Tween<Offset>(
      begin: widget.begin,
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ));

    _scaleAnimation =
        Tween<double>(begin: 0.8, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ));

    _rotateAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    if (!_hasAnimated) {
      Future.delayed(widget.delay, () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _controller.forward(from: 0.0);
        });
      });
      _hasAnimated = true;
    }
  }

  void _resetAnimation() {
    _hasAnimated = false;
    _controller.reset();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('custom-animation-${widget.hashCode}'),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0) {
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
                angle: _rotateAnimation.value * 2 * 3.14159,
                child: widget.child,
              );
            case AnimationType.bounce:
              return Transform.scale(
                scale: 1 + (_scaleAnimation.value - 1) * 0.2,
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
