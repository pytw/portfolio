import 'package:flutter/material.dart';

class ScrollLinearProgressIndicator extends StatefulWidget {
  final ScrollController scrollController;

  const ScrollLinearProgressIndicator(
      {super.key, required this.scrollController});

  @override
  State<ScrollLinearProgressIndicator> createState() =>
      _ScrollLinearProgressIndicatorState();
}

class _ScrollLinearProgressIndicatorState
    extends State<ScrollLinearProgressIndicator> {
  double _scrollProgress = 0;

  @override
  void initState() {
    super.initState();

    widget.scrollController.addListener(_updateScrollProgress);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_updateScrollProgress);
    super.dispose();
  }

  void _updateScrollProgress() {
    if (!mounted) return;

    double maxScroll = widget.scrollController.position.maxScrollExtent;
    double currentScroll = widget.scrollController.position.pixels;

    setState(() {
      _scrollProgress = maxScroll != 0 ? currentScroll / maxScroll : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: _scrollProgress,
      minHeight: 4,
      backgroundColor: Colors.grey[300],
      valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
    );
  }
}
