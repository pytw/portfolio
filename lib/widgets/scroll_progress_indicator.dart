import 'package:flutter/material.dart';

class ScrollProgressIndicator extends StatelessWidget {
  final double progress;

  const ScrollProgressIndicator({required this.progress, super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: LinearProgressIndicator(
        value: progress,
        minHeight: 4,
        backgroundColor: Colors.grey[300],
        valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
      ),
    );
  }
}
