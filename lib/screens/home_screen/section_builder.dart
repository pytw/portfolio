import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../sections/section_wrapper.dart';

class SectionBuilder extends StatelessWidget {
  final String sectionKey;
  final Widget sectionWidget;
  final GlobalKey globalKey;
  final Function(String, bool) onVisibilityChanged;
  final bool isVisible;

  const SectionBuilder({
    required this.sectionKey,
    required this.sectionWidget,
    required this.globalKey,
    required this.onVisibilityChanged,
    required this.isVisible,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final fadeInOpacity = isVisible ? 1.0 : 0.0;
    final slideUpOffset = isVisible ? 0.0 : 50.0;

    return VisibilityDetector(
      key: Key(sectionKey),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1) {
          onVisibilityChanged(sectionKey, true);
        } else {
          onVisibilityChanged(sectionKey, false);
        }
      },
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 600),
        opacity: fadeInOpacity,
        child: Transform.translate(
          offset: Offset(0, slideUpOffset),
          child: SectionWrapper(
            globalKey: globalKey,
            child: sectionWidget,
          ),
        ),
      ),
    );
  }
}
