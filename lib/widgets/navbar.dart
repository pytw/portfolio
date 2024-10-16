import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class Navbar extends StatelessWidget implements PreferredSizeWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Portfolio', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, letterSpacing: 1.2),),
      actions: [
        TextButton.icon(
          onPressed: () => context.go('/'),
          label: const Text("Home", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 1.2, decoration: TextDecoration.underline, decorationColor: Colors.white)),
          icon: const Icon(Icons.home_outlined),
          style: TextButton.styleFrom(iconColor: Colors.blue),
        ),
        TextButton.icon(
          onPressed: () => context.go('/projects'),
          label: const Text("Projects", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 1.2)),
          icon: const Icon(Icons.data_object_outlined),
          style: TextButton.styleFrom(iconColor: Colors.blue),
        ),
        TextButton.icon(
          onPressed: () => context.go('/skills'),
          label: const Text("Skills", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 1.2)),
          icon: const Icon(Icons.emoji_objects_outlined),
          style: TextButton.styleFrom(iconColor: Colors.blue),
        ),
        TextButton.icon(
          onPressed: () => context.go('/about'),
          label: const Text("About", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 1.2)),
          icon: const Icon(Icons.person_outline),
          style: TextButton.styleFrom(iconColor: Colors.blue),
        ),
        TextButton.icon(
          onPressed: () => context.go('/contact'),
          label: const Text("Contact", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 1.2)),
          icon:  const Icon(Icons.mail_outline),
          style: TextButton.styleFrom(iconColor: Colors.white, backgroundColor: Colors.blue),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // AppBar height
}
