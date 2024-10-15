import 'package:flutter/material.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Projects')),
      body: ListView(
        children: const [
          ProjectTile(
              title: 'Project 1', description: 'Description of Project 1'),
          ProjectTile(
              title: 'Project 2', description: 'Description of Project 2'),
          ProjectTile(
              title: 'Project 3', description: 'Description of Project 3'),
        ],
      ),
    );
  }
}

class ProjectTile extends StatelessWidget {
  final String title;
  final String description;

  const ProjectTile(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
      ),
    );
  }
}
