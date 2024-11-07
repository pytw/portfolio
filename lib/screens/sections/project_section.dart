import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_website/widgets/custom_button.dart';
import 'package:portfolio_website/widgets/custom_header.dart';

class ProjectSection extends StatelessWidget {
  final GlobalKey projectKey;
  const ProjectSection(this.projectKey, {super.key});

  // Constants for padding, spacing, and breakpoints
  static const double horizontalPadding = 16.0;
  static const double verticalPadding = 16.0;
  static const double spacing = 8.0;
  static const double largeScreenBreakpoint = 1200.0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: horizontalPadding, vertical: verticalPadding),
      child: Column(
        key: projectKey,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _BuildHeader(),
          const SizedBox(height: spacing * 3),
          _buildProjectContent(screenWidth),
          const SizedBox(height: spacing),
          const Align(
            alignment: Alignment.centerRight,
            child: _MoreProjectsButton(),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectContent(double screenWidth) {
    final _ProjectDetail project = _sampleProject();
    return screenWidth >= largeScreenBreakpoint
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                  flex: 1, child: _ProjectImage(imagePath: project.imagePath)),
              const SizedBox(
                  width: spacing * 2), // Adjusted spacing between columns
              Flexible(flex: 1, child: _ProjectDetails(project: project)),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ProjectImage(imagePath: project.imagePath),
              const SizedBox(height: spacing), // Spacing between text and image
              _ProjectDetails(project: project),
            ],
          );
  }
}

class _BuildHeader extends StatelessWidget {
  const _BuildHeader();

  @override
  Widget build(BuildContext context) {
    return CustomHeader(
      titleText: 'A Glimpse of ',
      titleStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
      subtitleText: 'My Work',
      subtitleStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Theme.of(context).primaryColor,
          ),
    );
  }
}

class _ProjectImage extends StatelessWidget {
  final String imagePath;
  const _ProjectImage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(imagePath, fit: BoxFit.contain);
  }
}

class _ProjectDetails extends StatelessWidget {
  final _ProjectDetail project;
  const _ProjectDetails({required this.project});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          project.title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.bold
              ),
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
          spacing: ProjectSection.spacing*2,
          runSpacing: ProjectSection.spacing,
          children: project.skills.map(
                  (skill) => _SkillChip(skill: skill)
          ).toList(),
        ),
      ],
    );
  }
}

class _SkillChip extends StatelessWidget {
  final _TechnicalSkill skill;
  const _SkillChip({required this.skill});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(skill.name),
      avatar: SvgPicture.asset(skill.iconPath, width: 20, height: 20),
    );
  }
}

class _MoreProjectsButton extends StatelessWidget {
  const _MoreProjectsButton();

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {},
      label: 'More Projects...',
      textStyle: TextStyle(
        color: Theme.of(context).primaryColor,
      ),
      hoverUnderlineColor: Theme.of(context).primaryColor,
      hoverEffects: const [
        HoverEffect.underline,
      ],
    );
  }
}

_ProjectDetail _sampleProject() {
  return _ProjectDetail(
    "Dashboard",
    "assets/gif/tmc.gif",
    "An admin dashboard serves multiple crucial functions, enhancing operational efficiency, decision-making, and user management. It provides a centralized platform for overseeing components, making informed decisions, and managing user interactions. The dashboard presents real-time data and analytics, enabling prompt responses to emerging trends and issues. It empowers data-driven decision-making, efficient user management, and content oversight. The dashboard also monitors system health, ensures security and compliance, and facilitates communication among team members. Its scalability supports long-term growth, adapting to changing business environments. It's a vital tool for effective management, strategic decision-making, and operational excellence.",
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
