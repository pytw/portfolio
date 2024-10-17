import 'package:flutter/material.dart';

class SocialButton extends StatefulWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  const SocialButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  @override
  _SocialButtonState createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
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
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: _isHovering ? Colors.blue : Colors.transparent,
              width: 2.0,
            ),
          ),
        ),
        child: ElevatedButton.icon(
          onPressed: widget.onPressed,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent), // Transparent background
            padding: WidgetStateProperty.all<EdgeInsets>(const EdgeInsets.all(8)),
            shadowColor: WidgetStateProperty.all<Color>(Colors.transparent), // No shadow
          ),
          icon: Icon(
            widget.icon,
            size: _isHovering ? 24 : 20, // Increase icon size on hover
            color: _isHovering ? Colors.blue : Colors.white, // Change color on hover
          ),
          label: Text(
            widget.label,
            style: TextStyle(
              fontSize: _isHovering ? 18 : 16, // Increase text size on hover
              color: _isHovering ? Colors.blue : Colors.white, // Change text color on hover
            ),
          ),
        ),
      ),
    );
  }
}
