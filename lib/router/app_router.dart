import 'package:go_router/go_router.dart';
import '../screens/home_screen.dart';
import '../screens/about_screen.dart';
import '../screens/skills_screen.dart';
import '../screens/projects_screen.dart';
import '../screens/contact_screen.dart';

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
      builder: (context, state) => const ProjectsScreen(),
    ),
    GoRoute(
      path: '/contact',
      builder: (context, state) => const ContactScreen(),
    ),
  ],
);
