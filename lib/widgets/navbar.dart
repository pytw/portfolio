import 'dart:async';
import 'package:flutter/material.dart';

class Navbar extends StatefulWidget implements PreferredSizeWidget {
  final Function(String section) onSectionSelected;
  final String activeSection;

  const Navbar({
    super.key,
    required this.onSectionSelected,
    required this.activeSection,
  });

  @override
  State<Navbar> createState() => _NavbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _NavbarState extends State<Navbar> {
  String hoveredSection = '';
  final Map<String, GlobalKey> keys = {
    'Home': GlobalKey(),
    'Projects': GlobalKey(),
    'Skills': GlobalKey(),
    'About': GlobalKey(),
    'Contact': GlobalKey(),
  };
  final Map<String, double> widths = {};

  final List<Map<String, dynamic>> sections = [
    {'label': 'Home', 'icon': Icons.home},
    {'label': 'Projects', 'icon': Icons.work},
    {'label': 'Skills', 'icon': Icons.code},
    {'label': 'About', 'icon': Icons.person},
    {'label': 'Contact', 'icon': Icons.contact_mail},
  ];

  Timer? debounceTimer;

  static const Color activeColor = Colors.blue;
  static const Color inactiveColor = Colors.white;
  static const TextStyle desktopTextStyle = TextStyle(
    color: inactiveColor,
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle tabletTextStyle = TextStyle(
    color: inactiveColor,
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _measureButton(widget.activeSection));
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black87,
      elevation: 0,
      title: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return _buildMobileNav();
          } else if (constraints.maxWidth < 768) {
            return _buildTabletNav();
          } else {
            return _buildDesktopNav();
          }
        },
      ),
    );
  }

  Widget _buildMobileNav() {
    return Row(
      children: [
        _buildLogo(),
        const Spacer(),
        PopupMenuButton<String>(
          icon: const Icon(Icons.menu, color: inactiveColor),
          onSelected: (value) => widget.onSectionSelected(value),
          itemBuilder: (context) => _buildMenuItems(),
        ),
      ],
    );
  }

  Widget _buildTabletNav() {
    return Row(
      children: [
        _buildLogo(),
        const Spacer(),
        ...sections.map((section) => _buildNavItem(
              section['icon'] as IconData,
              section['label'] as String,
              isTablet: true,
            )),
      ],
    );
  }

  Widget _buildDesktopNav() {
    return Row(
      children: [
        _buildLogo(),
        const Spacer(),
        ...sections.map((section) => _buildNavItem(
              section['icon'] as IconData,
              section['label'] as String,
            )),
      ],
    );
  }

  Widget _buildLogo() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Text(
        'PY',
        style: TextStyle(
          color: activeColor,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  List<PopupMenuEntry<String>> _buildMenuItems() {
    return sections
        .map((section) => PopupMenuItem<String>(
              value: section['label'] as String,
              child: Text(section['label'] as String),
            ))
        .toList();
  }

  Widget _buildNavItem(IconData icon, String label, {bool isTablet = false}) {
    bool isActive = widget.activeSection == label;
    bool isHovered = hoveredSection == label;

    return Tooltip(
      message: label,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: InkWell(
          key: keys[label],
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            widget.onSectionSelected(label);
            _measureButton(label);
          },
          onHover: (hovering) {
            setState(() {
              hoveredSection = hovering ? label : '';
              if (hovering) _measureButton(label);
            });
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icon,
                    color: isActive || isHovered ? activeColor : inactiveColor,
                    size: isTablet ? 18 : 24,
                  ),
                  if (!isTablet) const SizedBox(width: 4),
                  if (!isTablet)
                    Text(
                      label,
                      style: isTablet
                          ? tabletTextStyle.copyWith(
                              color: isActive ? activeColor : inactiveColor,
                              fontWeight: isActive
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            )
                          : desktopTextStyle.copyWith(
                              color: isActive ? activeColor : inactiveColor,
                              fontWeight: isActive
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                    ),
                ],
              ),
              const SizedBox(height: 4),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 2,
                width: (isActive || isHovered) ? widths[label] ?? 0.0 : 0,
                color: activeColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _measureButton(String label) {
    debounceTimer?.cancel();
    debounceTimer = Timer(const Duration(milliseconds: 50), () {
      final keyContext = keys[label]?.currentContext;
      if (keyContext != null) {
        final box = keyContext.findRenderObject() as RenderBox;
        setState(() {
          widths[label] = box.size.width;
        });
      }
    });
  }
}
