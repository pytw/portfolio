import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // Use the standard AppBar height

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      title: const Text('My Portfolio'),
      actions: [
        TextButton(
          onPressed: () => context.go('/'),
          child: const Text('Home', style: TextStyle(color: Colors.white)),
        ),
        TextButton(
          onPressed: () => context.go('/projects'),
          child: const Text('Projects', style: TextStyle(color: Colors.white)),
        ),
        TextButton(
          onPressed: () => context.go('/about'),
          child: const Text('About Me', style: TextStyle(color: Colors.white)),
        ),
        TextButton(
          onPressed: () => context.go('/contact'),
          child: const Text('Contact', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
