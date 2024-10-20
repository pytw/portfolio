import 'package:flutter/material.dart';

class Navbar extends StatefulWidget implements PreferredSizeWidget {
  final Function(String section) onSectionSelected;

  const Navbar({
    super.key,
    required this.onSectionSelected,
  });

  @override
  State<Navbar> createState() => _NavbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _NavbarState extends State<Navbar> {
  String activeSection = 'Home'; // Default active section
  String hoveredSection = '';
  final Map<String, GlobalKey> keys = {
    'Home': GlobalKey(),
    'Projects': GlobalKey(),
    'Skills': GlobalKey(),
    'About': GlobalKey(),
    'Contact': GlobalKey(),
  };
  final Map<String, double> widths = {};

  @override
  void initState() {
    super.initState();
    // Measure the width of the 'Home' button after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) => _measureButton('Home'));
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black87,
      elevation: 0,
      title: Row(
        children: [
          const Text(
            'PY',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          _buildNavItem(Icons.home, 'Home'),
          _buildNavItem(Icons.work, 'Projects'),
          _buildNavItem(Icons.code, 'Skills'),
          _buildNavItem(Icons.person, 'About'),
          _buildNavItem(Icons.contact_mail, 'Contact'),
        ],
      ),
    );
  }

  // Method to create a navigation item with icon and label
  Widget _buildNavItem(IconData icon, String label) {
    bool isActive = activeSection == label;
    bool isHovered = hoveredSection == label;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: InkWell(
        key: keys[label],
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          setState(() {
            activeSection = label; // Set the clicked section as active
          });
          widget.onSectionSelected(label);
          _measureButton(label); // Measure button width on click
        },
        onHover: (hovering) {
          setState(() {
            hoveredSection = hovering ? label : '';
            if (hovering) _measureButton(label); // Measure button width on hover
          });
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: isActive || isHovered ? Colors.blue : Colors.white),
                const SizedBox(width: 4),
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 2,
              width: (isActive || isHovered) ? widths[label] ?? 0.0 : 0,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }

  // Measure the button width using the GlobalKey
  void _measureButton(String label) {
    final keyContext = keys[label]?.currentContext;
    if (keyContext != null) {
      final box = keyContext.findRenderObject() as RenderBox;
      setState(() {
        widths[label] = box.size.width; // Save the button width
      });
    }
  }
}
