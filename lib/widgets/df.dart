import 'package:flutter/material.dart';

enum IconPosition {
  left,
  right,
}

class CustomButton extends StatelessWidget {
  final String? label;
  final Icon? icon;
  final VoidCallback onPressed;
  final TextStyle? textStyle;
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;
  final IconPosition iconPosition;
  final bool showUnderline;
  final Color underlineColor;
  final double underlineThickness;

  const CustomButton({
    super.key,
    required this.onPressed,
    this.label,
    this.icon,
    this.textStyle,
    this.padding = const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
    this.backgroundColor = Colors.blue,
    this.borderColor = Colors.transparent,
    this.borderWidth = 1.0,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.iconPosition = IconPosition.left,
    this.showUnderline = false,
    this.underlineColor = Colors.white,
    this.underlineThickness = 1.5,
  }) : assert(label != null || icon != null,
            'Either label or icon must be provided.');

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: borderRadius,
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: borderRadius,
            border: Border.all(color: borderColor, width: borderWidth),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: _buildContent(),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildContent() {
    final List<Widget> content = [];

    if (icon != null && iconPosition == IconPosition.left) {
      content.add(icon!);
    }

    if (label != null) {
      content.add(
        Padding(
          padding: EdgeInsets.symmetric(horizontal: icon != null ? 8.0 : 0.0),
          child: Container(
            decoration: showUnderline
                ? BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: underlineColor, width: underlineThickness),
                    ),
                  )
                : null,
            child: Text(
              label!,
              style: textStyle ??
                  const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
            ),
          ),
        ),
      );
    }

    if (icon != null && iconPosition == IconPosition.right) {
      content.add(icon!);
    }

    return content;
  }
}
