import 'package:flutter/material.dart';
import '../theme/app_constant.dart';

class CustomDrawer extends StatelessWidget {
  final Function(String section) onSectionSelected;

  CustomDrawer({super.key, required this.onSectionSelected});

  final List<Map<String, dynamic>> _sections = [
    {'label': 'Home', 'icon': Icons.home},
    {'label': 'Project', 'icon': Icons.work},
    {'label': 'Skill', 'icon': Icons.code},
    {'label': 'About', 'icon': Icons.person},
    {'label': 'Contact', 'icon': Icons.contact_mail},
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage(AppImage.heroicImage)),
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.shade600,
                    Colors.blue.shade400,
                    Colors.blue.shade200,
                    Colors.blue.shade100,
                    Colors.blue.shade50,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: const [0.1, 0.3, 0.5, 0.7, 1.9],
                )),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Menu',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Praveen Yadav',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.black, letterSpacing: 0.5, height: 1.5),
                    ),
                    Text(
                      AppText.profession,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.black, letterSpacing: 0.5, height: 1.5),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ..._sections.map((section) {
            return ListTile(
              leading: Icon(section['icon'] as IconData, color: Colors.blue),
              title: Text(section['label'] as String),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              onTap: () {
                onSectionSelected(section['label'] as String);
                Navigator.of(context).pop();
              },
            );
          }),
        ],
      ),
    );
  }
}
