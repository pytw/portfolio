import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'About Me',
            style: TextStyle(
              color: Colors.black,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'I am a passionate developer with a love for building beautiful, functional web and mobile applications. '
                'I enjoy learning new technologies and constantly seek to improve my skills. '
                'With experience in Flutter, Dart, and web development, I bring creative solutions to complex problems.',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          const CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage('assets/images/py.jpg'), // Replace with your image
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.code, color: Colors.purple),
                onPressed: () {
                  // Link to GitHub profile or other
                },
              ),
              const SizedBox(width: 16),
              IconButton(
                icon: const Icon(Icons.linked_camera, color: Colors.blue),
                onPressed: () {
                  // Link to LinkedIn profile
                },
              ),
              const SizedBox(width: 16),
              IconButton(
                icon: const Icon(Icons.email, color: Colors.red),
                onPressed: () {
                  // Link to Email or Contact Form
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
