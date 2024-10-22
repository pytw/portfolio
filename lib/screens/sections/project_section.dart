import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website/widgets/custom_button.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Project Section',
                style: TextStyle(
                  fontSize: 36.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16.h), // Space between title and grid
              Expanded(
                child: Column(
                  children: [
                    // First Row
                    Expanded(
                      child: Row(
                        children: [
                          _Quadrant(
                            content: Image.asset(
                              'assets/images/admin-dashboard.webp', // First image path
                              fit: BoxFit.cover,
                            ),
                          ),
                          _Quadrant(
                            content: _OverviewContent(), // Overview content
                          ),
                        ],
                      ),
                    ),
                    // Second Row
                    Expanded(
                      child: Row(
                        children: [
                          _Quadrant(
                            content: _TechnologiesContent(), // Technologies content
                          ),
                          _Quadrant(
                            content: Image.asset(
                              'assets/images/chat-app.webp', // Second image path
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: CustomButton(
                        onPressed: () {},
                        label: "More projects",
                        icon: FontAwesomeIcons.link,
                        iconFirst: false,
                        iconSize: 24,
                        textStyle: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontSize: 24),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// Reusable Quadrant Widget
class _Quadrant extends StatelessWidget {
  final Widget content; // Content of the quadrant

  const _Quadrant({required this.content});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.blue),
          color: Colors.black.withOpacity(0.7),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.5),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: content, // Use the content passed
        ),
      ),
    );
  }
}

// Overview Content Widget
class _OverviewContent extends StatelessWidget {
  const _OverviewContent();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.7), // Color for the overview content
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.all(16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Project Overview',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                "This project is designed to showcase the integration of various technologies in creating an effective application. The goal is to develop a user-friendly interface while ensuring robust backend support. Key features include real-time data synchronization, responsive design, and seamless user experience. The project aims to bridge the gap between front-end and back-end functionalities.",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                  height: 1.5, // Line height for better readability
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Technologies Content Widget
class _TechnologiesContent extends StatelessWidget {
  const _TechnologiesContent();

  @override
  Widget build(BuildContext context) {
    final technologies = [
      Technology('Flutter', 'assets/icons/flutter.svg'),
      Technology('Dart', 'assets/icons/dart.svg'),
      Technology('Firebase', 'assets/icons/firebase.svg'),
      Technology('Git', 'assets/icons/git.svg'),
    ];

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.7), // Color for the technologies content
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Technologies Used',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: ListView(
              children: technologies.map((tech) {
                return TechnologyItem(
                  techName: tech.name,
                  iconPath: tech.iconPath,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// Technology Item Widget
class TechnologyItem extends StatelessWidget {
  final String techName;
  final String iconPath;

  const TechnologyItem({
    super.key,
    required this.techName,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h), // Adjusted padding for smaller size
      child: Container(
        padding: EdgeInsets.all(10.w), // Smaller padding
        decoration: BoxDecoration(
          color: Colors.grey[800]?.withOpacity(0.8),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.3),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              iconPath,
              width: 30.w, // Smaller icon size
              height: 30.h,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Text(
                techName,
                style: TextStyle(
                  fontSize: 18.sp, // Smaller text size
                  color: const Color(0xff9ca3af),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Technology Class
class Technology {
  final String name;
  final String iconPath;

  Technology(this.name, this.iconPath);
}
