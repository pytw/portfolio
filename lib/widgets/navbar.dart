import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      title: const Text('Portfolio'),
      actions: [
        TextButton(
          onPressed: () => context.go('/'),
          child: const Text('Home', style: TextStyle(color: Colors.white)),
        ),
        TextButton(
          onPressed: () => context.go('/about'),
          child: const Text('About', style: TextStyle(color: Colors.white)),
        ),
        TextButton(
          onPressed: () => context.go('/skills'),
          child: const Text('Skills', style: TextStyle(color: Colors.white)),
        ),
        TextButton(
          onPressed: () => context.go('/projects'),
          child: const Text('Projects', style: TextStyle(color: Colors.white)),
        ),
        TextButton(
          onPressed: () => context.go('/contact'),
          child: const Text('Contact', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // AppBar height
}
