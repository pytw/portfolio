import 'package:flutter/material.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  final Function(String section) onSectionSelected;
  final String activeSection;

  Navbar({
    super.key,
    required this.onSectionSelected,
    required this.activeSection,
  });

  static const double mediumScreenBreakPoint = 768.0;
  static const double smallScreenBreakPoint = 600.0;

  final List<Map<String, dynamic>> _sections = [
    {'label': 'Home', 'icon': Icons.home},
    {'label': 'Project', 'icon': Icons.work},
    {'label': 'Skill', 'icon': Icons.code},
    {'label': 'About', 'icon': Icons.person},
    {'label': 'Contact', 'icon': Icons.contact_mail},
  ];

  Widget _buildLogo() => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: Text(
          'PY',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  Widget _buildNavItem({
    required String label,
    required IconData icon,
    required bool isActive,
    required bool isHovered,
    required bool isTablet,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => onSectionSelected(label),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: Colors.blue,
                size: isTablet ? 20 : 24,
              ),
              if (!isTablet) const SizedBox(width: 6),
              if (!isTablet)
                Text(
                  label,
                  style: TextStyle(
                    color: isHovered || isActive ? Colors.blue : Colors.white,
                    fontSize: isTablet ? 16 : 18,
                    fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isTablet = width < mediumScreenBreakPoint;
    final bool isSmallScreen = width < smallScreenBreakPoint;

    return AppBar(
      elevation: 0,
      backgroundColor: Colors.black,
      title: Row(
        children: [
          _buildLogo(),
          const Spacer(),
          if (isSmallScreen)
            PopupMenuButton<String>(
              icon: const Icon(Icons.menu, color: Colors.blue),
              onSelected: onSectionSelected,
              itemBuilder: (_) => _sections
                  .map(
                    (section) => PopupMenuItem<String>(
                      value: section['label'] as String,
                      child: Text(
                        section['label'] as String,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  )
                  .toList(),
            )
          else
            Row(
              children: _sections.map((section) {
                final String label = section['label'] as String;
                return StatefulBuilder(
                  builder: (context, setState) {
                    bool isHovered = false;
                    return MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onEnter: (_) => setState(() => isHovered = true),
                      onExit: (_) => setState(() => isHovered = false),
                      child: _buildNavItem(
                        label: label,
                        icon: section['icon'] as IconData,
                        isActive: activeSection == label,
                        isHovered: isHovered,
                        isTablet: isTablet,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
