import 'package:flutter/material.dart';
import 'projects_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Portfolio'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/projects');
            },
            child: const Text('Projects'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/about');
            },
            child: const Text('About Me'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/contact');
            },
            child: const Text('Contact'),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Hello, I\'m Praveen Yadav',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text('Welcome to my portfolio!'),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProjectsPage()),
                );
              },
              child: const Text('View My Work'),
            ),
          ],
        ),
      ),
    );
  }
}
