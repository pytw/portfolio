import 'package:flutter/material.dart';
import 'package:portfolio_website/screens/project_screen/components/project_detail.dart';
import 'package:portfolio_website/screens/project_screen/components/project_image.dart';

class ProjectStack extends StatelessWidget {
  final Map<String, dynamic> project;

  const ProjectStack({required this.project, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ProjectImage(imageUrl: project['image']),
        ProjectDetails(project: project),
      ],
    );
  }
}
