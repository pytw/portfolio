import 'package:flutter/material.dart';

class Effect extends StatefulWidget {
  final Widget Function(
      bool isHovered, bool isClicked, double scale, double opacity) builder;

  final double scale;
  final double clickScale;
  final double hoverOpacity;
  final double rotationAngle;
  final Offset slideOffset;
  final bool fadeOnHover;
  final bool rotateOnClick;
  final bool slideOnClick;
  final Duration duration;
  final VoidCallback? onClick;

  const Effect({
    super.key,
    required this.builder,
    this.scale = 1.0,
    this.clickScale = 1.0,
    this.hoverOpacity = 1.0,
    this.rotationAngle = 0.0,
    this.slideOffset = Offset.zero,
    this.fadeOnHover = false,
    this.rotateOnClick = false,
    this.slideOnClick = false,
    this.duration = const Duration(milliseconds: 200),
    this.onClick,
  });

  @override
  State<Effect> createState() => _EffectState();
}

class _EffectState extends State<Effect> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<Offset> _slideAnimation;

  bool _isHovered = false;
  bool _isClicked = false;

  @override
  void initState() {
    super.initState();

    // Initialize AnimationController
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    // Define animations based on hover and click states
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: widget.scale,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _opacityAnimation = Tween<double>(
      begin: 1.0,
      end: widget.hoverOpacity,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: widget.rotationAngle,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: widget.slideOffset,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onHover(bool isHovering) {
    setState(() {
      _isHovered = isHovering;
      _isHovered ? _controller.forward() : _controller.reverse();
    });
  }

  void _onTap(bool isTap) {
    setState(() {
      _isClicked = isTap;
      if (isTap && widget.onClick != null) {
        widget.onClick!();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: GestureDetector(
        onTapDown: (_) => _onTap(true),
        onTapUp: (_) => _onTap(false),
        onTapCancel: () => _onTap(false),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final scale =
                _isClicked ? widget.clickScale : _scaleAnimation.value;
            final opacity = widget.fadeOnHover && _isHovered
                ? _opacityAnimation.value
                : 1.0;
            final rotation = (_isHovered ? _rotationAnimation.value : 0.0) +
                (_isClicked && widget.rotateOnClick ? 0.1 : 0.0);
            final slide = _isHovered
                ? _slideAnimation.value
                : (_isClicked && widget.slideOnClick
                    ? const Offset(5, 5)
                    : Offset.zero);

            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..scale(scale)
                ..translate(slide.dx, slide.dy)
                ..rotateZ(rotation),
              child: Opacity(
                opacity: opacity,
                child: widget.builder(_isHovered, _isClicked, scale, opacity),
              ),
            );
          },
        ),
      ),
    );
  }
}
