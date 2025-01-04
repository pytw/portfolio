import 'package:flutter/material.dart';

import '../theme/app_constant.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  final Function(String section) onSectionSelected;
  final String activeSection;
  final List<Map<String, dynamic>> navItems;

  const Navbar({
    super.key,
    required this.onSectionSelected,
    required this.activeSection,
    required this.navItems,
  });

  Widget _buildLogo(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSize.horizontalPadding,
        ),
        child: InkWell(
          onTap: () => onSectionSelected('Home'),
          mouseCursor: SystemMouseCursors.click,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          child: Text(
            'PY',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Theme.of(context).primaryColor,
                  letterSpacing: 2,
                ),
          ),
        ),
      );

  Widget _buildNavItem({
    required String label,
    required IconData icon,
    required bool isActive,
  }) {
    final hoverNotifier = ValueNotifier<bool>(false);

    return ValueListenableBuilder<bool>(
      valueListenable: hoverNotifier,
      builder: (context, isHovered, child) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => hoverNotifier.value = true,
          onExit: (_) => hoverNotifier.value = false,
          child: GestureDetector(
            onTap: () => onSectionSelected(label),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSize.horizontalPadding,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icon,
                    color: Colors.blue,
                  ),
                  const SizedBox(width: AppSize.spacing/2),
                  Text(
                    label,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: isHovered || isActive ? Colors.blue : Colors.white,
                      fontWeight:
                          isActive ? FontWeight.w500 : FontWeight.normal,
                      letterSpacing: 1
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isSmallScreen = width < AppSize.screenBreakPoint;

    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          _buildLogo(context),
          const Spacer(),
          if (isSmallScreen)
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu, color: Colors.blue),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            )
          else
            Row(
              children: navItems.map((section) {
                final String label = section['label'] as String;
                return _buildNavItem(
                  label: label,
                  icon: section['icon'] as IconData,
                  isActive: activeSection == label,
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
