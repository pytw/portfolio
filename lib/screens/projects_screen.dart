import 'package:flutter/material.dart';
import '../widgets/project_tile.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Projects')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ProjectTile(
            title: 'University ERP System',
            description: 'JavaFX & MySQL Desktop Application',
            link: 'https://github.com/yourrepo',
          ),
          ProjectTile(
            title: 'Portfolio Website',
            description: 'Built using Flutter & Firebase',
            link: 'https://yourportfolio.com',
          ),
        ],
      ),
    );
  }
}
