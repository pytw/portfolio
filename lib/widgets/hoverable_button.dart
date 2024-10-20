import 'package:flutter/material.dart';

class HoverableButton extends StatefulWidget {
  final VoidCallback onPressed; // Action when button is clicked
  final String label; // Button text
  final IconData icon; // Button icon
  final Color backgroundColor; // Button background color
  final Color labelColor; // Color of the label text
  final Color iconColor; // Color of the icon
  final EdgeInsets padding; // Padding around button content
  final double hoverScale; // How much to enlarge button on hover
  final double hoverTranslateY; // How much to move button upward on hover
  final String? tooltip; // Tooltip message on hover
  final bool isIconLeft; // If true, the icon is placed to the left of the label, otherwise to the right

  const HoverableButton({super.key,
    required this.onPressed,
    required this.label,
    required this.icon,
    this.backgroundColor = Colors.blue,
    this.labelColor = Colors.white,
    this.iconColor = Colors.white,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    this.hoverScale = 1.1,
    this.hoverTranslateY = -5.0,
    this.tooltip,
    this.isIconLeft = true,
  });

  @override
  State<HoverableButton> createState() => _HoverableButtonState();
}

class _HoverableButtonState extends State<HoverableButton> {
  bool _isHovered = false; // Track if the button is being hovered

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      // Detect mouse entering and leaving the button area
      onEnter: (_) => _setHovered(true),
      onExit: (_) => _setHovered(false),
      child: Tooltip(
        message: widget.tooltip ?? widget.label,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200), // Animation duration for hover effect
          // Apply scaling and translation on hover
          transform: Matrix4.identity()
            ..translate(0.0, _isHovered ? widget.hoverTranslateY : 0.0)
            ..scale(_isHovered ? widget.hoverScale : 1.0),
          child: ElevatedButton(
            // Button styling
            style: ElevatedButton.styleFrom(
              padding: widget.padding, // Button padding
              backgroundColor: widget.backgroundColor, // Button background color
            ),
            onPressed: widget.onPressed, // Button press action
            child: Row(
              mainAxisSize: MainAxisSize.min, // Make button size fit the content
              children: _buildContent(), // Build content with label and icon based on isIconLeft
            ),
          ),
        ),
      ),
    );
  }

  // Build button content with icon and label based on isIconLeft flag
  List<Widget> _buildContent() {
    final icon = Icon(widget.icon, color: widget.iconColor); // Define icon widget
    final label = Text(widget.label, style: TextStyle(color: widget.labelColor)); // Define label widget

    // Return a list of widgets with icon on the left or right based on isIconLeft
    if (widget.isIconLeft) {
      return [icon, const SizedBox(width: 8), label]; // Icon left, then label
    } else {
      return [label, const SizedBox(width: 8), icon]; // Label first, then icon
    }
  }

  // Update hover state
  void _setHovered(bool isHovered) {
    setState(() {
      _isHovered = isHovered; // Set hover state to true or false
    });
  }
}