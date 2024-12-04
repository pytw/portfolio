import 'package:flutter/material.dart';

class BackToTopButton extends StatelessWidget {
  final ScrollController scrollController;
  final double scrollThreshold;
  final Color? backgroundColor;
  final IconData icon;
  final Duration scrollDuration;
  final Curve scrollCurve;

  const BackToTopButton({
    required this.scrollController,
    this.scrollThreshold = 300,
    this.backgroundColor,
    this.icon = Icons.arrow_upward,
    this.scrollDuration = const Duration(milliseconds: 500),
    this.scrollCurve = Curves.easeInOut,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: ValueNotifier(scrollController.offset > scrollThreshold),
      builder: (context, show, child) {
        return AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          bottom: show ? 20 : -80,
          right: 20,
          child: AnimatedOpacity(
            opacity: show ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: FloatingActionButton(
              onPressed: () => _scrollToTop(),
              tooltip: 'Back to top',
              backgroundColor:
                  backgroundColor ?? Theme.of(context).primaryColor,
              child: Icon(icon),
            ),
          ),
        );
      },
    );
  }

  void _scrollToTop() {
    scrollController.animateTo(
      0,
      duration: scrollDuration,
      curve: scrollCurve,
    );
  }
}
