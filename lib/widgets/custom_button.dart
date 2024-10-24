import 'package:flutter/material.dart';

enum HoverEffect {
  none,
  scale,
  backgroundColor,
  borderColor,
  labelColor,
  iconColor,
  elevation,
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
}

enum IconPosition {
  isLeft,
  isRight,
}

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
  final Color clickBackgroundColor;
  final Color clickBorderColor;
  final Color clickLabelColor;
  final Color clickIconColor;
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
  final Color hoverUnderlineColor;
  final double hoverUnderlineWidth;

  const CustomButton({
    super.key,
    required this.onPressed,
    this.label,
    this.icon,
    this.iconColor = Colors.white,
    this.iconSize = 16.0,
    this.textStyle = const TextStyle(
        color: Colors.white, fontSize: 16),
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
    this.hoverUnderlineWidth = 2.0
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
    Color effectiveLabelColor =
        widget.textStyle.color ?? Colors.white; // Default label color
    Color effectiveIconColor = widget.iconColor;
    double scale = 1.0;
    bool showUnderline = false;

    // Handle hover effects (if not clicked)
    if (widget.isEnabled && _isHovering && !_isPressed) {
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
      if (widget.hoverEffects.contains(HoverEffect.elevation)) {}
      if (widget.hoverEffects.contains(HoverEffect.scale)) {
        scale = 1.1; // Increased scale on hover
      }
      if (widget.hoverEffects.contains(HoverEffect.underline)) {
        showUnderline = true;
      }
    }

    // Handle click effects
    if (widget.isEnabled && _isPressed) {
      if (widget.clickEffects.contains(ClickEffect.backgroundColor)) {
        effectiveBackgroundColor = widget.clickBackgroundColor;
      }
      if (widget.clickEffects.contains(ClickEffect.borderColor)) {
        effectiveBorderColor = widget.clickBorderColor;
      }
      if (widget.clickEffects.contains(ClickEffect.labelColor)) {
        effectiveLabelColor = widget.clickLabelColor;
      }
      if (widget.clickEffects.contains(ClickEffect.iconColor)) {
        effectiveIconColor = widget.clickIconColor;
      }
      if (widget.clickEffects.contains(ClickEffect.elevation)) {}
      if (widget.clickEffects.contains(ClickEffect.scale)) {
        scale = 0.9; // Scale-down slightly on click
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
                    offset: Offset(0, 4),
                  ),
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
                  child: _buildButtonContent(
                      effectiveLabelColor, effectiveIconColor, showUnderline),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonContent(
      Color effectiveLabelColor, Color effectiveIconColor, bool showUnderline) {
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
      return _buildLabel(effectiveLabelColor, showUnderline);
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
        _buildLabel(effectiveLabelColor, showUnderline),
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

  Widget _buildLabel(Color effectiveLabelColor, bool showUnderline) {
    return Container(
      decoration: showUnderline
          ? BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: widget.hoverUnderlineColor,
                  width: widget.hoverUnderlineWidth,
                ),
              ),
            )
          : null,
      child: Text(
        widget.label!,
        style: widget.textStyle.copyWith(
          color:
              widget.isEnabled ? effectiveLabelColor : widget.disabledTextColor,
        ),
      ),
    );
  }
}
