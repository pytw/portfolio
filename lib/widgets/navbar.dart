import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'PY',
        style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2),
      ),
      actions: [
        TextButton.icon(
          onPressed: () => context.goNamed('home'),
          label: const Text("Home",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 1.2)),
          icon: const Icon(Icons.home_outlined),
          style: TextButton.styleFrom(iconColor: Colors.blue),
        ),
        TextButton.icon(
          onPressed: () => context.goNamed('project'),
          label: const Text("Projects",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 1.2)),
          icon: const Icon(Icons.data_object_outlined),
          style: TextButton.styleFrom(iconColor: Colors.blue),
        ),
        TextButton.icon(
          onPressed: () => context.goNamed('skill'),
          label: const Text("Skills",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 1.2)),
          icon: const Icon(Icons.emoji_objects_outlined),
          style: TextButton.styleFrom(iconColor: Colors.blue),
        ),
        TextButton.icon(
          onPressed: () => context.goNamed('about'),
          label: const Text("About",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 1.2)),
          icon: const Icon(Icons.person_outline),
          style: TextButton.styleFrom(iconColor: Colors.blue),
        ),
        TextButton.icon(
          onPressed: () => context.goNamed('contact'),
          label: const Text("Contact",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 1.2)),
          icon: const Icon(Icons.mail_outline),
          style: TextButton.styleFrom(
              iconColor: Colors.white, backgroundColor: Colors.blue),
        ),
      ],
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight); // AppBar height
}
