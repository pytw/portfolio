import 'package:flutter/material.dart';
import 'package:portfolio_website/widgets/image.dart';
import 'package:portfolio_website/widgets/text.dart';
import '../widgets/navbar.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Navbar(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Projects',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text('Project 1: University ERP System'),
            Text('Project 2: Personal Portfolio Website'),
          ],
        ),
      ),
    );
  }
}


class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Here is a glimpse of what I have done.',
            style: TextStyle(
              fontSize: screenWidth < 600 ? 24 : 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          // First project: Image on the left, Text on the right
          _ProjectCard(
            title: 'Dashboard',
            description: 'Our MERN dashboard: The all-in-one command center for managing and visualizing data, simplified for you.',
            imagePath: 'assets/images/admin-dashboard.webp',
            // Placeholder path for the image
            features: const [
              'CRUD operation',
              'JWT auth',
              'Forget/Reset password',
              'Admin and User based access'
            ],
            screenWidth: screenWidth,
            isImageLeft: true,
          ),
          const SizedBox(height: 30),
          // Second project: Text on the left, Image on the right
          _ProjectCard(
            title: 'Chat App',
            description: 'Discover our Chat App — an uncomplicated chat app for straightforward conversations, powered by the latest technologies.',
            imagePath: 'assets/images/chat-app.webp', // Placeholder path for the image
            features: const [
              'Quick login with Google',
              'Add friend with Email',
              'Send messages in real-time'
            ],
            screenWidth: screenWidth,
            isImageLeft: false,
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final List<String> features;
  final double screenWidth;
  final bool isImageLeft;

  const _ProjectCard({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.features,
    required this.screenWidth,
    this.isImageLeft = true
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: isImageLeft
            ? [
          // Image on the Left
          assetImage(imagePath),
          const SizedBox(width: 20), // Space between image and text
          listDetail(title, description, features, screenWidth),
        ]
            : [
          // Text on the Left
          listDetail(title, description, features, screenWidth),
          const SizedBox(width: 20), // Space between text and image
          assetImage(imagePath),
        ],
      ),
    );
  }
}
