import 'package:flutter/material.dart';

class ProjectTile extends StatelessWidget {
  final String title;
  final String description;
  final String link;

  const ProjectTile({super.key, required this.title, required this.description, required this.link});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(description),
        trailing: IconButton(
          icon: const Icon(Icons.link),
          onPressed: () {
            // Launch the project link
          },
        ),
      ),
    );
  }
}
