import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/screens/project_screen/components/project_content.dart';

import '../../theme/app_constant.dart';
import '../../widgets/back_to_top.dart';
import '../../widgets/date_time_widget.dart';
import '../../widgets/scroll_progress_indicator.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  final ScrollController _scrollController = ScrollController();
  late Future<List<Map<String, dynamic>>> _projects;

  late final Stream<DateTime> _dateTimeStream = Stream.periodic(
    const Duration(seconds: 1),
    (_) => DateTime.now(),
  );

  @override
  void initState() {
    super.initState();
    _projects = fetchProjects();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<List<Map<String, dynamic>>> fetchProjects() async {
    try {
      FirebaseFirestore fireStore = FirebaseFirestore.instance;
      QuerySnapshot querySnapshot =
          await fireStore.collection('projects').get();

      return querySnapshot.docs.map((doc) {
        return {
          'name': doc['name'],
          'rating': doc['rating'],
          'image': doc['image'],
          'link': doc['link'],
        };
      }).toList();
    } catch (error) {
      debugPrint('Error fetching projects: $error');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ProjectContent(
              scrollController: _scrollController,
              projectsFuture: _projects,
              padding: _calculatePadding(screenWidth),
            ),
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: ScrollLinearProgressIndicator(
                  scrollController: _scrollController),
            ),
            Positioned(
              top: 8,
              right: 0,
              child: DateTimeWidget(dateTimeStream: _dateTimeStream),
            ),
            BackToTopButton(scrollController: _scrollController),
          ],
        ),
      ),
    );
  }

  double _calculatePadding(double width) {
    return width < AppSize.smallScreenBreakPoint
        ? width * 0.005
        : width < AppSize.screenBreakPoint
            ? width * 0.02
            : width * 0.08;
  }
}
