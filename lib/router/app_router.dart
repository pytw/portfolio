import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/project_screen/project_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: AppRouteNames.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/projects',
        name: AppRouteNames.projects,
        builder: (context, state) => const ProjectScreen(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: const Center(child: Text('Page not found!')),
    ),
  );
}

class AppRouteNames {
  static const String home = 'home';
  static const String projects = 'projects';
}
