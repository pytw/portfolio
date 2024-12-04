import 'package:flutter/material.dart';

class SectionIndicator extends StatelessWidget {
  final Map<String, GlobalKey> sectionKeys;
  final String activeSection;
  final void Function(String section) onSectionTap;

  const SectionIndicator({
    required this.sectionKeys,
    required this.activeSection,
    required this.onSectionTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: sectionKeys.keys.map((section) {
        final isActive = activeSection == section;
        return GestureDetector(
          onTap: () => onSectionTap(section),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            margin: const EdgeInsets.only(bottom: 10),
            width: isActive ? 16 : 12,
            height: isActive ? 16 : 12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? Theme.of(context).primaryColor : Colors.grey,
              boxShadow: isActive
                  ? [
                      BoxShadow(
                        color: Theme.of(context).primaryColor.withOpacity(0.5),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ]
                  : null,
            ),
          ),
        );
      }).toList(),
    );
  }
}
