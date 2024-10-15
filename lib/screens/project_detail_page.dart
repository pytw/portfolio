import 'package:flutter/material.dart';
import '../models/project.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailPage extends StatelessWidget {
  final Project project;

  const ProjectDetailPage({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(project.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(project.imageUrl),
            const SizedBox(height: 10),
            Text(project.description, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Technologies: ${project.technologies.join(', ')}'),
            const SizedBox(height: 10),
            Text(project.details),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (await canLaunch(project.repoLink)) {
                  await launch(project.repoLink);
                } else {
                  throw 'Could not launch ${project.repoLink}';
                }
              },
              child: const Text('View Code on GitHub'),
            ),
          ],
        ),
      ),
    );
  }
}
