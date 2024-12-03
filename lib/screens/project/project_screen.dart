import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:portfolio_website/widgets/custom_header.dart';
import 'package:portfolio_website/widgets/effect.dart';
import 'package:portfolio_website/widgets/simple_custom_button.dart';

import '../../theme/app_constant.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  _ProjectScreenState createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  late Future<List<Map<String, dynamic>>> _projects;

  @override
  void initState() {
    super.initState();
    _projects = fetchProjects();  // Fetch data once when the widget is initialized
  }

  // Fetch projects from Firestore
  Future<List<Map<String, dynamic>>> fetchProjects() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Fetch documents from 'projects' collection
    QuerySnapshot querySnapshot = await firestore.collection('projects').get();

    // Map each document to a Map (to display in the UI)
    return querySnapshot.docs.map((doc) {
      return {
        'name': doc['name'],
        'description': doc['description'],
        'rating': doc['rating'],
        'image': doc['image'],
      };
    }).toList();
  }

  double _calculatePadding(double width) {
    return width < AppSize.smallScreenBreakPoint
        ? width * 0.005
        : width < AppSize.screenBreakPoint
        ? width * 0.02
        : width * 0.08;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding:
          EdgeInsets.symmetric(horizontal: _calculatePadding(screenWidth)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProjectSection(context, _buildProjectMainHeader(context)),
              // Use FutureBuilder here, but fetch data only once in the state
              FutureBuilder<List<Map<String, dynamic>>>(
                future: _projects,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    var projects = snapshot.data;

                    // Carousel with the first 3 projects
                    return _buildProjectSection(
                      context,
                      CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          height: MediaQuery.of(context).size.height * 0.9,
                          viewportFraction: 0.8,
                        ),
                        items: projects!.sublist(0, 3).map((project) {
                          return _BuildProject(project: project);
                        }).toList(),
                      ),
                    );
                  } else {
                    return Center(child: Text('No Projects Found'));
                  }
                },
              ),
              _buildProjectSection(context, _buildProjectHeader(context)),
              // Use FutureBuilder again for the grid view (only fetch once)
              FutureBuilder<List<Map<String, dynamic>>>(
                future: _projects,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    var projects = snapshot.data;

                    // GridView with all projects
                    return _buildProjectSection(
                      context,
                      LayoutBuilder(
                        builder: (context, constraints) {
                          int crossAxisCount =
                          (constraints.maxWidth ~/ 200).clamp(2, 4);
                          return GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: crossAxisCount,
                              childAspectRatio: 1,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemCount: projects!.length,
                            itemBuilder: (context, index) {
                              return _BuildProject(
                                project: projects[index],
                              );
                            },
                          );
                        },
                      ),
                    );
                  } else {
                    return const Center(child: Text('No Projects Found'));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectSection(BuildContext context, Widget sectionWidget) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: screenHeight * 0.01,
        horizontal: screenWidth * 0.01,
      ),
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.015,
        horizontal: screenWidth * 0.015,
      ),
      child: sectionWidget,
    );
  }

  Widget _buildProjectMainHeader(BuildContext context) {
    return CustomHeader(
      titleText: "Explore Our ",
      subtitleText: "Projects",
      titleStyle: Theme.of(context).textTheme.displayMedium,
      subtitleStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget _buildProjectHeader(BuildContext context) {
    return CustomHeader(
      titleText: "More ",
      subtitleText: "Projects",
      titleStyle:
      Theme.of(context).textTheme.displaySmall?.copyWith(
        color: Theme.of(context).primaryColor,
      ),
      subtitleStyle: Theme.of(context).textTheme.displaySmall,
    );
  }
}

class _BuildProject extends StatelessWidget {
  final Map<String, dynamic> project;
  final bool isCard;

  const _BuildProject({required this.project, this.isCard = false});

  @override
  Widget build(BuildContext context) {
    return isCard
        ? Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSize.borderRadius,
        ),
      ),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _buildProjectImage(context, project['image'])),
          _buildProjectOverView(context, project),
        ],
      ),
    )
        : Stack(
      children: [
        _buildProjectImage(context, project['image']),
        _buildProjectOverView(context, project),
      ],
    );
  }
}

Widget _buildProjectImage(BuildContext context, String imageUrl) {
  print('Loading image from URL: $imageUrl');
  return ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: Image.network(
      imageUrl.isNotEmpty
          ? imageUrl
          : 'https://example.com/placeholder.jpg',
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return const Center(child: CircularProgressIndicator());
      },
      errorBuilder: (context, error, stackTrace) {
        return Icon(
          Icons.broken_image,
          size: 50,
          color: Theme.of(context).colorScheme.onError,
        );
      },
    ),
  );
}

Widget _buildProjectOverView(
    BuildContext context, Map<String, dynamic> project) {
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: AppSize.horizontalPadding,
      vertical: AppSize.verticalPadding / 2,
    ),
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [Colors.black87, Colors.transparent],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      ),
      borderRadius: BorderRadius.circular(AppSize.borderRadius),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildProjectName(context, project['name']),
        const SizedBox(height: AppSize.spacing),
        _buildProjectDescription(context, project['description']),
        const SizedBox(height: AppSize.spacing),
        _buildProjectRatingWithButton(context, project['rating']),
      ],
    ),
  );
}

Widget _buildProjectName(BuildContext context, String projectName) {
  return Text(
    projectName,
    style: Theme.of(context).textTheme.titleMedium,
  );
}

Widget _buildProjectDescription(
    BuildContext context, String projectDescription) {
  return Text(
    projectDescription,
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
    style: Theme.of(context).textTheme.titleSmall?.copyWith(
      color: Theme.of(context).colorScheme.onSecondary,
      letterSpacing: 0.5,
    ),
  );
}

Widget _buildProjectRatingWithButton(
    BuildContext context, String projectRating) {
  return Row(
    children: [
      const Icon(
        Icons.star_outline,
        color: Colors.yellow,
        size: 16,
      ),
      const SizedBox(width: AppSize.spacing / 2),
      Text(
        projectRating,
        style: Theme.of(context).textTheme.titleSmall,
      ),
      const Spacer(),
      Effect(
        builder: (isHovered, __, ___, ____) => SimpleCustomButton(
          onPressed: () {},
          label: "Details",
          textStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
            letterSpacing: 0.5,
          ),
          backgroundColor: Colors.transparent,
          borderColor: isHovered ? Colors.white : Colors.transparent,
        ),
      ),
    ],
  );
}
