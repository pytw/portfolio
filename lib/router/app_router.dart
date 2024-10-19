import 'package:go_router/go_router.dart';
import 'package:portfolio_website/features/project_screen.dart';

import '../features/about_screen.dart';
import '../features/contact_screen.dart';
import '../features/home/home_screen.dart';
import '../features/skills_screen.dart';


final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/about',
      builder: (context, state) => const AboutScreen(),
    ),
    GoRoute(
      path: '/skills',
      builder: (context, state) => const SkillsScreen(),
    ),
    GoRoute(
      path: '/projects',
      builder: (context, state) => const ProjectScreen(),
    ),
    GoRoute(
      path: '/contact',
      builder: (context, state) => const ContactScreen(),
    ),
  ],
);
