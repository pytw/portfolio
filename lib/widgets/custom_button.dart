import 'package:flutter/material.dart';

enum HoverEffect {
  none,
  scale,
  backgroundColor,
  borderColor,
  labelColor,
  iconColor,
  shadow,
  underline,
}

enum ClickEffect {
  none,
  scale,
  backgroundColor,
  borderColor,
  labelColor,
  iconColor,
  elevation,
  shadow,
  lightEffect,
}

enum IconPosition {
  isLeft,
  isRight,
}

class CustomButton extends StatefulWidget {
  // Core properties
  final String? label;
  final IconData? icon;
  final VoidCallback onPressed;
  final TextStyle textStyle;

  // Icon properties
  final Color iconColor;
  final double iconSize;
  final IconPosition iconPosition;

  // Background and Border
  final double elevation;
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;

  // Hover and Click Effects
  final List<HoverEffect> hoverEffects;
  final List<ClickEffect> clickEffects;

  // Colors for Hover and Click
  final Color hoverBackgroundColor;
  final Color hoverBorderColor;
  final Color hoverLabelColor;
  final Color hoverIconColor;
  final Color clickBackgroundColor;
  final Color clickBorderColor;
  final Color clickLabelColor;
  final Color clickIconColor;

  // Additional styling
  final double? width;
  final double? height;
  final bool isEnabled;
  final bool showLoadingIndicator;
  final Widget? loadingIndicator;
  final Color disabledColor;
  final Color disabledTextColor;
  final MouseCursor cursor;
  final MouseCursor loadingCursor;
  final Color hoverUnderlineColor;
  final double hoverUnderlineWidth;

  const CustomButton({
    super.key,
    required this.onPressed,
    this.label,
    this.icon,
    this.iconColor = Colors.white,
    this.iconSize = 16.0,
    this.textStyle = const TextStyle(color: Colors.white, fontSize: 16),
    this.elevation = 4.0,
    this.padding = const EdgeInsets.all(6.0),
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.backgroundColor = Colors.transparent,
    this.borderColor = Colors.transparent,
    this.borderWidth = 1.0,
    this.hoverBackgroundColor = Colors.transparent,
    this.hoverBorderColor = Colors.white,
    this.hoverLabelColor = Colors.white,
    this.hoverIconColor = Colors.white,
    this.clickBackgroundColor = Colors.transparent,
    this.clickBorderColor = Colors.white,
    this.clickLabelColor = Colors.white,
    this.clickIconColor = Colors.white,
    this.iconPosition = IconPosition.isLeft,
    this.hoverEffects = const [HoverEffect.none],
    this.clickEffects = const [ClickEffect.none],
    this.isEnabled = true,
    this.width,
    this.height,
    this.disabledColor = Colors.grey,
    this.disabledTextColor = Colors.white70,
    this.showLoadingIndicator = false,
    this.loadingIndicator,
    this.cursor = SystemMouseCursors.click,
    this.loadingCursor = SystemMouseCursors.wait,
    this.hoverUnderlineColor = Colors.white,
    this.hoverUnderlineWidth = 2.0,
  }) : assert(label != null || icon != null,
            'Either label or icon must be provided.');

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton>
    with SingleTickerProviderStateMixin {
  bool _isHovering = false;
  bool _isPressed = false;

  // Get the effective background color based on hover/click states
  Color get effectiveBackgroundColor {
    if (_isPressed) {
      return widget.clickEffects.contains(ClickEffect.backgroundColor)
          ? widget.clickBackgroundColor
          : widget.backgroundColor;
    }
    if (_isHovering) {
      return widget.hoverEffects.contains(HoverEffect.backgroundColor)
          ? widget.hoverBackgroundColor
          : widget.backgroundColor;
    }
    return widget.backgroundColor;
  }

  // Get the effective border color based on hover/click states
  Color get effectiveBorderColor {
    if (_isPressed) {
      return widget.clickEffects.contains(ClickEffect.borderColor)
          ? widget.clickBorderColor
          : widget.borderColor;
    }
    if (_isHovering) {
      return widget.hoverEffects.contains(HoverEffect.borderColor)
          ? widget.hoverBorderColor
          : widget.borderColor;
    }
    return widget.borderColor;
  }

  // Get the effective label color based on hover/click states
  Color get effectiveLabelColor {
    if (_isPressed) {
      return widget.clickEffects.contains(ClickEffect.labelColor)
          ? widget.clickLabelColor
          : (widget.textStyle.color ?? Colors.white);
    }
    if (_isHovering) {
      return widget.hoverEffects.contains(HoverEffect.labelColor)
          ? widget.hoverLabelColor
          : (widget.textStyle.color ?? Colors.white);
    }
    return widget.textStyle.color ?? Colors.white;
  }

  // Get the effective icon color based on hover/click states
  Color get effectiveIconColor {
    if (_isPressed) {
      return widget.clickEffects.contains(ClickEffect.iconColor)
          ? widget.clickIconColor
          : widget.iconColor;
    }
    if (_isHovering) {
      return widget.hoverEffects.contains(HoverEffect.iconColor)
          ? widget.hoverIconColor
          : widget.iconColor;
    }
    return widget.iconColor;
  }

  // Determine whether to show underline on hover
  bool get showUnderline =>
      _isHovering && widget.hoverEffects.contains(HoverEffect.underline);

  @override
  Widget build(BuildContext context) {
    double scale = _isHovering
        ? (widget.hoverEffects.contains(HoverEffect.scale) ? 1.1 : 1.0)
        : (_isPressed
            ? (widget.clickEffects.contains(ClickEffect.scale) ? 0.9 : 1.0)
            : 1.0);

    return MouseRegion(
      cursor: widget.showLoadingIndicator
          ? widget.loadingCursor
          : (widget.isEnabled ? widget.cursor : MouseCursor.defer),
      onEnter:
          widget.isEnabled ? (_) => setState(() => _isHovering = true) : null,
      onExit:
          widget.isEnabled ? (_) => setState(() => _isHovering = false) : null,
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) {
          setState(() => _isPressed = false);
          if (widget.isEnabled && !widget.showLoadingIndicator) {
            widget.onPressed();
          }
        },
        onTapCancel: () => setState(() => _isPressed = false),
        child: AnimatedScale(
          scale: scale,
          duration: const Duration(milliseconds: 200),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              color: effectiveBackgroundColor,
              borderRadius: widget.borderRadius,
              border: Border.all(
                  color: effectiveBorderColor, width: widget.borderWidth),
              boxShadow: [
                if (widget.hoverEffects.contains(HoverEffect.shadow) &&
                    _isHovering &&
                    !_isPressed)
                  const BoxShadow(
                      color: Colors.black54,
                      blurRadius: 10,
                      offset: Offset(0, 4)),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: widget.isEnabled && !widget.showLoadingIndicator
                    ? widget.onPressed
                    : null,
                borderRadius: widget.borderRadius,
                child: Padding(
                  padding: widget.padding,
                  child: _buildButtonContent(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonContent() {
    if (widget.showLoadingIndicator) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.loadingIndicator != null) widget.loadingIndicator!,
          if (widget.loadingIndicator == null)
            const CircularProgressIndicator(color: Colors.white),
        ],
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.icon != null && widget.iconPosition == IconPosition.isLeft)
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(widget.icon,
                color: effectiveIconColor, size: widget.iconSize),
          ),
        _buildLabel(),
        if (widget.icon != null && widget.iconPosition == IconPosition.isRight)
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Icon(widget.icon,
                color: effectiveIconColor, size: widget.iconSize),
          ),
      ],
    );
  }

  Widget _buildLabel() {
    return Container(
      decoration: showUnderline
          ? BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: widget.hoverUnderlineColor,
                      width: widget.hoverUnderlineWidth)),
            )
          : null,
      child: Text(
        widget.label!,
        style: widget.textStyle.copyWith(color: effectiveLabelColor),
      ),
    );
  }
}
