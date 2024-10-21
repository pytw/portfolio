import 'package:flutter/material.dart';
import 'package:portfolio_website/widgets/image.dart';
import 'package:portfolio_website/widgets/text.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Here is a glimpse of what I have done.',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          // First project: Image on the left, Text on the right
          _ProjectCard(
            title: 'Dashboard',
            description:
            'Our MERN dashboard: The all-in-one command center for managing and visualizing data, simplified for you.',
            imagePath: 'assets/images/admin-dashboard.webp',
            // Placeholder path for the image
            features: [
              'CRUD operation',
              'JWT auth',
              'Forget/Reset password',
              'Admin and User based access'
            ],
            isImageLeft: true,
          ),
          SizedBox(height: 30),
          // Second project: Text on the left, Image on the right
          _ProjectCard(
            title: 'Chat App',
            description:
            'Discover our Chat App — an uncomplicated chat app for straightforward conversations, powered by the latest technologies.',
            imagePath:
            'assets/images/chat-app.webp', // Placeholder path for the image
            features: [
              'Quick login with Google',
              'Add friend with Email',
              'Send messages in real-time'
            ],
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
  final bool isImageLeft;

  const _ProjectCard(
      {required this.title,
        required this.description,
        required this.imagePath,
        required this.features,
        this.isImageLeft = true});

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
          listDetail(title, description, features),
        ]
            : [
          // Text on the Left
          listDetail(title, description, features),
          const SizedBox(width: 20), // Space between text and image
          assetImage(imagePath),
        ],
      ),
    );
  }
}