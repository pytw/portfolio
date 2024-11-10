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

class _EffectState extends State<Effect> {
  bool _isHovered = false;
  bool _isClicked = false;

  void _onHover(bool isHovering) {
    setState(() {
      _isHovered = isHovering;
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
    // Determine the scale, opacity, rotation, and slide based on hover and click states
    final scale =
        _isClicked ? widget.clickScale : (_isHovered ? widget.scale : 1.0);
    final opacity =
        widget.fadeOnHover && _isHovered ? widget.hoverOpacity : 1.0;
    final rotation = (_isHovered ? widget.rotationAngle : 0.0) +
        (_isClicked && widget.rotateOnClick ? 0.1 : 0.0);
    final slide = _isHovered
        ? widget.slideOffset
        : (_isClicked && widget.slideOnClick ? const Offset(5, 5) : Offset.zero);

    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: GestureDetector(
        onTapDown: (_) => _onTap(true),
        onTapUp: (_) => _onTap(false),
        onTapCancel: () => _onTap(false),
        child: AnimatedContainer(
          duration: widget.duration,
          transform: Matrix4.identity()
            ..scale(scale)
            ..translate(slide.dx, slide.dy)
            ..rotateZ(rotation),
          child: AnimatedOpacity(
            duration: widget.duration,
            opacity: opacity,
            child: widget.builder(_isHovered, _isClicked, scale, opacity),
          ),
        ),
      ),
    );
  }
}
