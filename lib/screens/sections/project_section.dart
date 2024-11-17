import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_website/animations/custom_animation.dart';
import 'package:portfolio_website/constants/app_size.dart';
import 'package:portfolio_website/widgets/custom_header.dart';
import 'package:portfolio_website/widgets/simple_custom_button.dart';
import 'package:portfolio_website/widgets/effect.dart';

class ProjectSection extends StatelessWidget {
  final GlobalKey projectKey;

  const ProjectSection(this.projectKey, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSize.horizontalPadding,
        vertical: AppSize.verticalPadding,
      ),
      child: Column(
        key: projectKey,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildProjectHeader(context),
          const SizedBox(height: AppSize.spacing * 3),
          _buildProjectContent(context),
          const SizedBox(height: AppSize.spacing * 2),
          _buildMoreProjectBtn(context),
        ],
      ),
    );
  }

  Widget _buildProjectContent(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final _ProjectDetail project = _sampleProject();
    if (screenWidth >= AppSize.screenBreakPoint) {
      return Row(
        children: [
          Flexible(
            flex: 1,
            child: _buildProjectImage(project.imagePath),
          ),
          const SizedBox(width: AppSize.spacing * 2),
          Flexible(
            flex: 1,
            child: _buildProjectDetail(context, project),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          _buildProjectImage(project.imagePath),
          const SizedBox(height: AppSize.spacing),
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
  return CustomAnimation(
    begin: const Offset(-0.1, 0),
    child: Effect(
      scale: 1.03,
      hoverOpacity: 0.8,
      fadeOnHover: true,
      builder: (isHovered, isClicked, scale, opacity) {
        return Image.asset(imagePath, fit: BoxFit.contain);
      },
    ),
  );
}

Widget _buildProjectDetail(BuildContext context, _ProjectDetail project) {
  return CustomAnimation(
    begin: const Offset(0.1, 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          project.title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: AppSize.spacing),
        Text(
          project.overview,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
                letterSpacing: 0.8,
                height: 2.5,
              ),
        ),
        const SizedBox(height: AppSize.spacing),
        Wrap(
          spacing: AppSize.spacing * 2,
          alignment: WrapAlignment.spaceEvenly,
          runSpacing: AppSize.spacing,
          runAlignment: WrapAlignment.spaceEvenly,
          children:
              project.skills.map((skill) => _buildSkillChip(skill)).toList(),
        ),
      ],
    ),
  );
}

Widget _buildSkillChip(_TechnicalSkill skill) {
  return Effect(
    scale: 1.1,
    builder: (isHovered, __, ___, ____) => Chip(
      label: Text(skill.name),
      labelStyle: TextStyle(color: isHovered ? Colors.blue : Colors.white),
      side: BorderSide(color: isHovered ? Colors.blue : Colors.white),
      avatar: SvgPicture.asset(skill.iconPath, width: 20, height: 20),
    ),
  );
}

Widget _buildMoreProjectBtn(BuildContext context) {
  return Effect(
    scale: 1.1,
    clickScale: 1,
    builder: (isHovered, isClicked, __, ___) => SimpleCustomButton(
      onPressed: () {},
      label: 'More Projects . . .',
      textStyle: TextStyle(
        color: isClicked
            ? const Color(0xff1a73e8)
            : isHovered
                ? Colors.white
                : const Color(0xff1a73e8),
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
