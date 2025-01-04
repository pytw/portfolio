import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget implements PreferredSizeWidget {
  final int selectedIndex;
  final List<NavItem> navItems;
  final Function(int) onItemSelected;
  final VoidCallback onLogin;
  final VoidCallback onSignup;

  CustomNavBar({
    required this.selectedIndex,
    required this.navItems,
    required this.onItemSelected,
    required this.onLogin,
    required this.onSignup,
  });

  @override
  Size get preferredSize => Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left side: Logo
          Row(
            children: [
              Icon(Icons.ac_unit, size: 32, color: Colors.blue), // Example logo
              const SizedBox(width: 8),
              Text(
                "AppName",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),

          // Right side: Navigation items + Login/Signup buttons
          Row(
            children: [
              ...navItems.asMap().entries.map((entry) {
                final index = entry.key;
                final item = entry.value;

                final isActive = index == selectedIndex;
                final color = isActive ? Colors.blue : Colors.grey;

                return GestureDetector(
                  onTap: () => onItemSelected(index),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            if (item.icon != null)
                              Icon(item.icon, color: color, size: 20),
                            if (item.label != null)
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                  item.label!,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: color,
                                    fontWeight: isActive
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),

              const SizedBox(width: 16),

              // Login Button
              TextButton(
                onPressed: onLogin,
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.blue),
                ),
              ),

              // Signup Button
              ElevatedButton(
                onPressed: onSignup,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text("Signup"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NavItem {
  final IconData? icon;
  final String? label;

  NavItem({this.icon, this.label});
}
