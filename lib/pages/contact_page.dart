import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Feel free to reach out!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(labelText: 'Your Name'),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Your Email'),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Your Message'),
              maxLines: 4,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle contact form submission
              },
              child: const Text('Send Message'),
            ),
          ],
        ),
      ),
    );
  }
}
