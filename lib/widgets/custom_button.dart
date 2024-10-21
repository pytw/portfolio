import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData? icon;
  final Color iconColor;
  final double iconSize;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final Color? hoverColor;
  final TextStyle? textStyle;
  final bool iconFirst; // New parameter for icon alignment

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.iconColor = Colors.white,
    this.iconSize = 16,
    this.elevation,
    this.padding,
    this.borderRadius,
    this.hoverColor,
    this.textStyle,
    this.iconFirst = true, // Default to icon on the left
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovering = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovering = false;
        });
      },
      child: AnimatedScale(
        scale: _isHovering ? 1.1 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ButtonStyle(
            elevation: WidgetStateProperty.all<double>(
              widget.elevation ?? 4.0,
            ),
            padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
              widget.padding ?? const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            ),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
              ),
            ),
            backgroundColor: WidgetStateProperty.all<Color>(
              _isHovering
                  ? (widget.hoverColor ?? Colors.blue[700]!)
                  : Colors.blueAccent,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null && widget.iconFirst) ...[
                Icon(
                  widget.icon,
                  color: widget.iconColor,
                  size: widget.iconSize,
                ),
                const SizedBox(width: 8),
              ],
              Text(
                widget.label,
                style: widget.textStyle ??
                    const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
              ),
              if (widget.icon != null && !widget.iconFirst) ...[
                const SizedBox(width: 8),
                Icon(
                  widget.icon,
                  color: widget.iconColor,
                  size: widget.iconSize,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
