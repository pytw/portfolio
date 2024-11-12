import 'dart:async';
import 'package:flutter/material.dart';

class CustomHeader extends StatefulWidget {
  final String titleText;
  final String subtitleText;
  final TextStyle titleStyle;
  final TextStyle subtitleStyle;
  final AlignmentGeometry alignment;
  final bool isTyping;

  const CustomHeader({
    super.key,
    required this.titleText,
    required this.subtitleText,
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
    this.alignment = Alignment.topLeft,
    this.isTyping = false,
  })  : titleStyle = titleStyle ??
            const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 0,
              wordSpacing: 0,
            ),
        subtitleStyle = subtitleStyle ??
            const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
              letterSpacing: 0,
              wordSpacing: 0,
            );

  @override
  State<CustomHeader> createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {
  String _displayedSubtitle = '';
  Timer? _timer;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    if (widget.isTyping) _startTypingAnimation();
  }

  void _startTypingAnimation() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (!mounted) return;

      setState(() {
        if (_currentIndex < widget.subtitleText.length) {
          _displayedSubtitle += widget.subtitleText[_currentIndex++];
        } else {
          _resetTyping();
        }
      });
    });
  }

  void _resetTyping() {
    if (!mounted) return;

    _timer?.cancel();
    Future.delayed(const Duration(milliseconds: 800), () {
      if (!mounted) return;

      setState(() {
        _displayedSubtitle = '';
        _currentIndex = 0;
        _startTypingAnimation();
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.alignment,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: widget.titleText,
              style: widget.titleStyle,
            ),
            TextSpan(
              text: widget.isTyping ? _displayedSubtitle : widget.subtitleText,
              style: widget.subtitleStyle,
            ),
          ],
        ),
      ),
    );
  }
}
