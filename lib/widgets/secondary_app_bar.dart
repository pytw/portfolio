import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget implements PreferredSizeWidget {
  final int selectedIndex;
  final List<Map<String, dynamic>> navItems;
  final Function(int) onItemSelected;
  final VoidCallback onLogin;
  final VoidCallback onSignup;
  final String logoTitle;
  final String? logoImagePath;

  const CustomNavBar({
    super.key,
    required this.selectedIndex,
    required this.navItems,
    required this.onItemSelected,
    required this.onLogin,
    required this.onSignup,
    required this.logoTitle,
    this.logoImagePath,
  });

  @override
  Size get preferredSize => Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Side: Logo
          Row(
            children: [
              if (logoImagePath != null) Image.asset(logoImagePath!, height: 32)
              else Icon(Icons.ac_unit, size: 32, color: Colors.blue),
              const SizedBox(width: 8),
              Text(
                logoTitle,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),

          // Right Side: Navigation items + Login/Signup buttons
          Row(
            children: [
              ...navItems.asMap().entries.map((entry) {
                final index = entry.key;
                final item = entry.value;

                final isActive = index == selectedIndex;
                final color = isActive ? Colors.blue : Colors.grey;

                return GestureDetector(
                  onTap: () => onItemSelected(index),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        if (item['icon'] != null)
                          Icon(
                            item['icon'],
                            color: color,
                            size: 20,
                          ),
                        if (item['label'] != null)
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Text(
                              item['label']!,
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
                );
              }),

              const SizedBox(width: 16),

              // Login Button
              TextButton(
                onPressed: onLogin,
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.blue, fontSize: 16),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                child: Text(
                  "Signup",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
