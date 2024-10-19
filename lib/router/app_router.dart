import 'package:go_router/go_router.dart';
import 'package:portfolio_website/features/about_screen.dart';
import 'package:portfolio_website/features/contact_screen.dart';
import 'package:portfolio_website/features/home/home_screen.dart';
import 'package:portfolio_website/features/project_screen.dart';
import 'package:portfolio_website/features/skills_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      name: "home",
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: "about",
      path: '/about',
      builder: (context, state) => const AboutScreen(),
    ),
    GoRoute(
      name: "skills",
      path: '/skills',
      builder: (context, state) => const SkillsScreen(),
    ),
    GoRoute(
      name: "project",
      path: '/projects',
      builder: (context, state) => const ProjectScreen(),
    ),
    GoRoute(
      name: "contact",
      path: '/contact',
      builder: (context, state) => const ContactScreen(),
    ),
  ],
);
