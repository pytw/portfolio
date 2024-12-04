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
  double _scrollProgress = 0.0;
  late final Stream<DateTime> _dateTimeStream = Stream.periodic(
    const Duration(seconds: 1),
    (_) => DateTime.now(),
  );

  @override
  void initState() {
    super.initState();
    _projects = fetchProjects();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    setState(() {
      double maxScroll = _scrollController.position.maxScrollExtent;
      double currentScroll = _scrollController.position.pixels;
      _scrollProgress = maxScroll != 0 ? currentScroll / maxScroll : 0;
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  Future<List<Map<String, dynamic>>> fetchProjects() async {
    FirebaseFirestore fireStore = FirebaseFirestore.instance;

    QuerySnapshot querySnapshot = await fireStore.collection('projects').get();

    return querySnapshot.docs.map((doc) {
      return {
        'name': doc['name'],
        'rating': doc['rating'],
        'image': doc['image'],
        'link': doc['link'],
      };
    }).toList();
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
            ScrollProgressIndicator(progress: _scrollProgress),
            Positioned(
              top: 8,
              right: 0,
              child: DateTimeWidget(dateTimeStream: _dateTimeStream),
            ),
            BackToTopButton(scrollController: _scrollController)
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
