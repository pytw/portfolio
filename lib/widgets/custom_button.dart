import 'package:flutter/material.dart';

/// Enum for defining hover effects on the button.
enum HoverEffect {
  none,
  scale,
  backgroundColor,
  borderColor,
  labelColor,
  iconColor,
  elevation,
  shadow,
}

/// Enum for defining click effects on the button.
enum ClickEffect {
  none,
  scale,
  backgroundColor,
  borderColor,
  labelColor,
  iconColor,
  elevation,
  shadow,
}

/// Enum for defining the position of the icon relative to the label.
enum IconPosition {
  isLeft,
  isRight,
}

/// A customizable button widget that supports hover and click effects.
///
/// This button can display either an icon, a label, or both, and provides various
/// visual effects on hover and click events.
///
/// ### Usage:
///
/// To use the `CustomButton`, you need to provide either an icon, a label, or both.
///
/// ```dart
/// CustomButton(
///   onPressed: () {
///     print('Button pressed');
///   },
///   label: 'Submit',
///   icon: Icons.check,
///   iconPosition: IconPosition.isLeft,
///   hoverEffects: [HoverEffect.backgroundColor, HoverEffect.labelColor],
///   clickEffects: [ClickEffect.backgroundColor],
/// )
/// ```
///
class CustomButton extends StatefulWidget {
  final String? label;
  final IconData? icon;
  final VoidCallback onPressed;
  final Color iconColor;
  final double iconSize;
  final double elevation;
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;
  final Color hoverBackgroundColor;
  final Color hoverBorderColor;
  final Color hoverLabelColor;
  final Color hoverIconColor;
  final TextStyle textStyle;
  final IconPosition iconPosition;
  final List<HoverEffect> hoverEffects;
  final List<ClickEffect> clickEffects;
  final bool isEnabled;
  final double? width;
  final double? height;
  final Color disabledColor;
  final Color disabledTextColor;
  final bool showLoadingIndicator;
  final Widget? loadingIndicator;
  final MouseCursor cursor;
  final MouseCursor loadingCursor;

  const CustomButton({
    super.key,
    required this.onPressed,
    this.label,
    this.icon,
    this.iconColor = Colors.white,
    this.iconSize = 16.0,
    this.textStyle = const TextStyle(color: Colors.white, fontSize: 16),
    this.elevation = 4.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.backgroundColor = Colors.blue,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0.0,
    this.hoverBackgroundColor = Colors.blueAccent,
    this.hoverBorderColor = Colors.blueAccent,
    this.hoverLabelColor = Colors.black,
    this.hoverIconColor = Colors.yellow,
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
  }) : assert(label != null || icon != null,
            'Either label or icon must be provided.');

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton>
    with SingleTickerProviderStateMixin {
  bool _isHovering = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    Color effectiveBackgroundColor = widget.backgroundColor;
    Color effectiveBorderColor = widget.borderColor;
    Color effectiveLabelColor = widget.textStyle.color ?? Colors.white;
    Color effectiveIconColor = widget.iconColor;

    double effectiveElevation = widget.elevation;

    if (widget.isEnabled && _isHovering) {
      if (widget.hoverEffects.contains(HoverEffect.backgroundColor)) {
        effectiveBackgroundColor = widget.hoverBackgroundColor;
      }
      if (widget.hoverEffects.contains(HoverEffect.borderColor)) {
        effectiveBorderColor = widget.hoverBorderColor;
      }
      if (widget.hoverEffects.contains(HoverEffect.labelColor)) {
        effectiveLabelColor = widget.hoverLabelColor;
      }
      if (widget.hoverEffects.contains(HoverEffect.iconColor)) {
        effectiveIconColor = widget.hoverIconColor;
      }
      if (widget.hoverEffects.contains(HoverEffect.elevation)) {
        effectiveElevation += 2.0;
      }
    }

    if (widget.isEnabled && _isPressed) {
      if (widget.clickEffects.contains(ClickEffect.backgroundColor)) {
        effectiveBackgroundColor = Colors.red;
      }
      if (widget.clickEffects.contains(ClickEffect.borderColor)) {
        effectiveBorderColor = Colors.red;
      }
      if (widget.clickEffects.contains(ClickEffect.labelColor)) {
        effectiveLabelColor = Colors.white;
      }
      if (widget.clickEffects.contains(ClickEffect.iconColor)) {
        effectiveIconColor = Colors.red;
      }
      if (widget.clickEffects.contains(ClickEffect.elevation)) {
        effectiveElevation += 4.0;
      }
    }

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
          scale: _isPressed && widget.clickEffects.contains(ClickEffect.scale)
              ? 0.95
              : 1.0,
          duration: const Duration(milliseconds: 200),
          child: SizedBox(
            width: widget.width,
            height: widget.height,
            child: Material(
              elevation: effectiveElevation,
              borderRadius: widget.borderRadius,
              shadowColor: _isHovering &&
                      widget.hoverEffects.contains(HoverEffect.shadow)
                  ? Colors.black54
                  : Colors.transparent,
              child: ElevatedButton(
                onPressed: widget.isEnabled && !widget.showLoadingIndicator
                    ? widget.onPressed
                    : null,
                style: ButtonStyle(
                  elevation: WidgetStateProperty.all(effectiveElevation),
                  padding: WidgetStateProperty.all(widget.padding),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: widget.borderRadius,
                      side: BorderSide(
                        color: effectiveBorderColor,
                        width: widget.borderWidth,
                      ),
                    ),
                  ),
                  backgroundColor:
                      WidgetStateProperty.all(effectiveBackgroundColor),
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                ),
                child: _buildButtonContent(
                    effectiveLabelColor, effectiveIconColor),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonContent(
      Color effectiveLabelColor, Color effectiveIconColor) {
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

    if (widget.icon != null && widget.label == null) {
      return Icon(
        widget.icon,
        color: widget.isEnabled ? effectiveIconColor : widget.disabledTextColor,
        size: widget.iconSize,
      );
    }

    if (widget.label != null && widget.icon == null) {
      return Text(
        widget.label!,
        style: widget.textStyle.copyWith(color: effectiveLabelColor),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.icon != null && widget.iconPosition == IconPosition.isLeft)
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              widget.icon,
              color: widget.isEnabled
                  ? effectiveIconColor
                  : widget.disabledTextColor,
              size: widget.iconSize,
            ),
          ),
        Text(
          widget.label!,
          style: widget.textStyle.copyWith(color: effectiveLabelColor),
        ),
        if (widget.icon != null && widget.iconPosition == IconPosition.isRight)
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Icon(
              widget.icon,
              color: widget.isEnabled
                  ? effectiveIconColor
                  : widget.disabledTextColor,
              size: widget.iconSize,
            ),
          ),
      ],
    );
  }
}
