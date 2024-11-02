import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_website/widgets/custom_button.dart';
import 'package:portfolio_website/widgets/custom_header.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenUtil().screenWidth;
    double horizontalPadding = screenWidth > 800 ? 20.0 : 20.0;

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
    return CustomHeader(
      titleText: 'A Glimpse of ',
      titleStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
          ),
      subtitleText: 'My Work',
      subtitleStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
          ),
    );
  }
}

class _ProjectResponsiveLayout extends StatelessWidget {
  final bool isStacked;
  const _ProjectResponsiveLayout({required this.isStacked});

  @override
  Widget build(BuildContext context) {
    final _ProjectDetail project = _sampleProject();

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
            crossAxisAlignment: CrossAxisAlignment.center,
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
  final _ProjectDetail project;
  const _ProjectDetails({required this.project});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            project.title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            project.overview,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  height: 2,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
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
