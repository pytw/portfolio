import 'package:flutter/material.dart';
import 'package:portfolio_website/screens/project_screen/components/project_detail.dart';
import 'package:portfolio_website/screens/project_screen/components/project_image.dart';

import '../../../theme/app_constant.dart';

class ProjectCard extends StatelessWidget {
  final Map<String, dynamic> project;

  const ProjectCard({required this.project, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
      ),
      elevation: 8,
      shadowColor: Colors.black.withOpacity(0.2),
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Colors.blue.shade200],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Expanded(child: ProjectImage(imageUrl: project['image'])),
            ProjectDetails(project: project),
          ],
        ),
      ),
    );
  }
}
