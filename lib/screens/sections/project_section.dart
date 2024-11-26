import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_website/constants/app_size.dart';
import 'package:portfolio_website/constants/app_text.dart';
import 'package:portfolio_website/models/models.dart';
import 'package:portfolio_website/widgets/custom_header.dart';
import 'package:portfolio_website/widgets/simple_custom_button.dart';
import 'package:portfolio_website/widgets/effect.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _buildProjectHeader(context),
        const SizedBox(height: AppSize.spacing * 3),
        _buildProjectContent(context),
        const SizedBox(height: AppSize.spacing * 2),
        _buildMoreProjectBtn(context),
      ],
    );
  }

  Widget _buildProjectContent(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final ProjectDetail project = AppText.sampleProject();
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
    titleStyle: Theme.of(context).textTheme.displaySmall?.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
    subtitleText: 'My Work',
    subtitleStyle: Theme.of(context).textTheme.displaySmall?.copyWith(
          color: Theme.of(context).primaryColor,
        ),
  );
}

Widget _buildProjectImage(String imagePath) {
  return Effect(
    scale: 1.03,
    hoverOpacity: 0.8,
    fadeOnHover: true,
    builder: (isHovered, isClicked, scale, opacity) {
      return Image.asset(imagePath, fit: BoxFit.contain);
    },
  );
}

Widget _buildProjectDetail(BuildContext context, ProjectDetail project) {
  return Column(
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
        "The project is called Transport Management System (TMC), developed using the PyQt6 package in Python, designed specifically for transport booking in colleges. This application is cross-platform, allowing it to run on multiple operating systems.\n\n"
        "The frontend of the application was created using Qt Designer in Python, while the backend is powered by Python and utilizes MySQL as the database. The system comes with a variety of features, including transport booking for exams, events, and regular services.\n\n"
        "Other key features include student detail management, course management, university management, subject management, and fee management, among others. This application provides a comprehensive solution for managing transport services in colleges.",
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
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
  );
}

Widget _buildSkillChip(TechnicalSkill skill) {
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
