import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/screens/project_screen/components/project_stack.dart';

class ProjectCarousel extends StatelessWidget {
  final Future<List<Map<String, dynamic>>> projectsFuture;

  const ProjectCarousel({required this.projectsFuture, super.key});

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
              final height = MediaQuery.of(context).size.height;
              final width = constraints.maxWidth;
              final carouselHeight = width > 500 ? height * 0.8 : height * 0.5;

              return CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  height: carouselHeight,
                  viewportFraction: 0.8,
                ),
                items: projects.take(3).map((project) {
                  return ProjectStack(project: project);
                }).toList(),
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
