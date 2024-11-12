import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_website/widgets/custom_header.dart';
import 'package:portfolio_website/widgets/df.dart';
import 'package:portfolio_website/widgets/effect.dart';

class ProjectSection extends StatelessWidget {
  final GlobalKey projectKey;

  const ProjectSection(this.projectKey, {super.key});

  static const double horizontalPadding = 16.0;
  static const double verticalPadding = 16.0;
  static const double spacing = 8.0;
  static const double screenBreakPoint = 800.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: horizontalPadding, vertical: verticalPadding),
      child: Column(
        key: projectKey,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildProjectHeader(context),
          const SizedBox(height: spacing * 3),
          _buildProjectContent(context),
          const SizedBox(height: spacing*2),
          _buildMoreProjectBtn(context),
        ],
      ),
    );
  }

  Widget _buildProjectContent(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final _ProjectDetail project = _sampleProject();
    if (screenWidth >= screenBreakPoint) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            flex: 1,
            child: _buildProjectImage(project.imagePath),
          ),
          const SizedBox(width: spacing * 2),
          Flexible(
            flex: 1,
            child: _buildProjectDetail(context, project),
          ),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildProjectImage(project.imagePath),
          const SizedBox(height: spacing),
          _buildProjectDetail(context, project),
        ],
      );
    }
  }
}

Widget _buildProjectHeader(BuildContext context) {
  return CustomHeader(
    titleText: 'A Glimpse of ',
    titleStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
    subtitleText: 'My Work',
    subtitleStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
          color: Theme.of(context).primaryColor,
        ),
  );
}

Widget _buildProjectImage(String imagePath) {
  return Effect(
    scale: 1.02,
    hoverOpacity: 0.8,
    fadeOnHover: true,
    builder: (isHovered, isClicked, scale, opacity) {
      return Image.asset(imagePath, fit: BoxFit.contain);
    },
  );
}

Widget _buildProjectDetail(BuildContext context, _ProjectDetail project) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        project.title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: ProjectSection.spacing),
      Text(
        project.overview,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
              letterSpacing: 0.8,
              height: 2.5,
            ),
      ),
      const SizedBox(height: ProjectSection.spacing),
      Wrap(
        spacing: ProjectSection.spacing * 2,
        alignment: WrapAlignment.spaceEvenly,
        runSpacing: ProjectSection.spacing,
        runAlignment: WrapAlignment.spaceEvenly,
        children:
            project.skills.map((skill) => _buildSkillChip(skill)).toList(),
      ),
    ],
  );
}

Widget _buildSkillChip(_TechnicalSkill skill) {
  return Effect(
    rotationAngle: 0.3,
    builder: (isHovered, __, ___, ____) => Chip(
      label: Text(skill.name),
      labelStyle: TextStyle(color: isHovered ? Colors.blue : Colors.white),
      side: BorderSide(color: isHovered ? Colors.red : Colors.white),
      avatar: SvgPicture.asset(skill.iconPath, width: 20, height: 20),
    ),
  );
}

Widget _buildMoreProjectBtn(BuildContext context) {
  return Effect(
    scale: 1.15,
    clickScale: 1,
    builder: (isHovered, _, __, ___) => CustomButton(
      onPressed: () {},
      label: 'More Projects . . .',
      textStyle: const TextStyle(
        color: Color(0xff1a73e8),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      showUnderline: true,
      underlineColor: const Color(0xff1a73e8),
    ),
  );
}

_ProjectDetail _sampleProject() {
  return _ProjectDetail(
    "Dashboard",
    "assets/gif/tmc.gif",
    "An admin dashboard serves multiple crucial functions, enhancing operational efficiency, decision-making, and user management. It provides a centralized platform for overseeing components, making informed decisions, and managing user interactions. The dashboard presents real-time data and analytics, enabling prompt responses to emerging trends and issues. It empowers data-driven decision-making, efficient user management, and content oversight. The dashboard also monitors system health, ensures security and compliance, and facilitates communication among team members. Its scalability supports long-term growth, adapting to changing business environments.",
    _technicalSkills(),
  );
}

List<_TechnicalSkill> _technicalSkills() {
  return [
    _TechnicalSkill('Flutter', 'assets/icons/Flutter.svg'),
    _TechnicalSkill('Tkinter', 'assets/icons/Python.svg'),
    _TechnicalSkill('Qt', 'assets/icons/Qt-Framework.svg'),
    _TechnicalSkill('HTML', 'assets/icons/HTML5.svg'),
    _TechnicalSkill('CSS', 'assets/icons/css3.svg'),
  ];
}

class _ProjectDetail {
  final String title;
  final String imagePath;
  final String overview;
  final List<_TechnicalSkill> skills;

  _ProjectDetail(this.title, this.imagePath, this.overview, this.skills);
}

class _TechnicalSkill {
  final String name;
  final String iconPath;

  _TechnicalSkill(this.name, this.iconPath);
}
