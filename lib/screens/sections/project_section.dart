import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double horizontalPadding = screenWidth > 800 ? 80.0 : 20.0;

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const SizedBox(height: 20),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: screenWidth > 600
                ? const _ProjectResponsiveLayout(isStacked: false)
                : const _ProjectResponsiveLayout(isStacked: true),
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: _MoreProjectsButton(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'A Glimpse of My Work',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
        Text(
          'Selected Projects',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).primaryColor,
              ),
        ),
      ],
    );
  }
}

class _ProjectResponsiveLayout extends StatelessWidget {
  final bool isStacked;
  const _ProjectResponsiveLayout({required this.isStacked});

  @override
  Widget build(BuildContext context) {
    final ProjectDetail project = _sampleProject();

    return isStacked
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ProjectImage(imagePath: project.imagePath),
              const SizedBox(height: 20),
              _ProjectDetails(project: project),
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                  flex: 1, child: _ProjectImage(imagePath: project.imagePath)),
              const SizedBox(width: 40),
              Flexible(flex: 1, child: _ProjectDetails(project: project)),
            ],
          );
  }
}

class _ProjectImage extends StatelessWidget {
  final String imagePath;
  const _ProjectImage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 400, maxWidth: 600),
      child: Image.asset(imagePath, fit: BoxFit.cover),
    );
  }
}

class _ProjectDetails extends StatelessWidget {
  final ProjectDetail project;
  const _ProjectDetails({required this.project});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project.title,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            project.overview,
            style:
                Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.5),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 8,
            runSpacing: 10,
            children: project.skills
                .map((skill) => _SkillChip(skill: skill))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  final TechnicalSkill skill;
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
    return TextButton(
      onPressed: () {},
      child: Text(
        'More Projects...',
        style: TextStyle(
            color: Theme.of(context).primaryColor,
            decoration: TextDecoration.underline),
      ),
    );
  }
}

ProjectDetail _sampleProject() {
  return ProjectDetail(
    "Admin Dashboard",
    "assets/gif/tmc.gif",
    "An admin dashboard providing real-time data analytics, streamlined user management, and comprehensive monitoring to support decision-making and operational efficiency.",
    _technicalSkills(),
  );
}

List<TechnicalSkill> _technicalSkills() {
  return [
    TechnicalSkill('Flutter', 'assets/icons/Flutter.svg'),
    TechnicalSkill('Tkinter', 'assets/icons/Python.svg'),
    TechnicalSkill('Qt', 'assets/icons/Qt-Framework.svg'),
    TechnicalSkill('HTML', 'assets/icons/HTML5.svg'),
    TechnicalSkill('CSS', 'assets/icons/css3.svg'),
  ];
}

class ProjectDetail {
  final String title;
  final String imagePath;
  final String overview;
  final List<TechnicalSkill> skills;

  ProjectDetail(this.title, this.imagePath, this.overview, this.skills);
}

class TechnicalSkill {
  final String name;
  final String iconPath;

  TechnicalSkill(this.name, this.iconPath);
}
