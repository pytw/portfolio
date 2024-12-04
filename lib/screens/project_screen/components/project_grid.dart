import 'package:flutter/material.dart';
import 'package:portfolio_website/screens/project_screen/components/project_card.dart';

class ProjectGrid extends StatelessWidget {
  final Future<List<Map<String, dynamic>>> projectsFuture;

  const ProjectGrid({required this.projectsFuture, super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: projectsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final projects = snapshot.data!;
          return LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = (constraints.maxWidth ~/ 290).clamp(2, 4);

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: 1,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  return ProjectCard(project: projects[index]);
                },
              );
            },
          );
        } else {
          return const Center(child: Text('No Projects Found'));
        }
      },
    );
  }
}
