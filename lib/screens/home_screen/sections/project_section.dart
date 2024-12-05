import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../models/models.dart';
import '../../../router/app_router.dart';
import '../../../theme/app_constant.dart';
import '../../../widgets/custom_header.dart';
import '../../../widgets/effect.dart';
import '../../../widgets/simple_custom_button.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _buildProjectHeader(context),
        const SizedBox(height: AppSize.spacing * 4),
        _buildProjectContent(context),
        const SizedBox(height: AppSize.spacing),
        _buildMoreProjectBtn(context),
      ],
    );
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

  Widget _buildProjectContent(BuildContext context) {
    final ProjectDetail project = AppText.sampleProject();
    return LayoutBuilder(builder: (context, constraints) {
      final screenWidth = constraints.maxWidth;
      final isDesktop = screenWidth >= AppSize.layoutBuilderBreakPoint;

      return isDesktop
          ? Row(
              children: [
                Flexible(child: _buildProjectImage(project.imagePath)),
                const SizedBox(width: AppSize.spacing * 3),
                Flexible(child: _buildProjectDetail(context, project)),
              ],
            )
          : Column(
              children: [
                _buildProjectImage(project.imagePath),
                const SizedBox(height: AppSize.spacing * 2),
                _buildProjectDetail(context, project),
              ],
            );
    });
  }

  Widget _buildProjectImage(String imagePath) {
    return Effect(
      scale: 1.03,
      hoverOpacity: 0.8,
      fadeOnHover: true,
      builder: (isHovered, isClicked, scale, opacity) {
        return CachedNetworkImage(
          imageUrl: imagePath,
          fit: BoxFit.contain,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => Icon(
            Icons.broken_image,
            color: Theme.of(context).colorScheme.onError,
          ),
        );
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
              ),
        ),
        const SizedBox(height: AppSize.spacing),
        Text(
          project.overview,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
                letterSpacing: 0.5,
                height: 2,
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
    return Semantics(
      label: 'Button to more projects',
      child: Effect(
        scale: 1.1,
        clickScale: 1,
        builder: (isHovered, isClicked, __, ___) => SimpleCustomButton(
          onPressed: () {
            context.goNamed(AppRouteNames.projects);
          },
          label: 'More Projects . . .',
          textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: isClicked
                    ? const Color(0xff1a73e8)
                    : isHovered
                        ? Colors.white
                        : const Color(0xff1a73e8),
              ),
          backgroundColor: Colors.transparent,
          showUnderline: true,
          underlineColor: const Color(0xff1a73e8),
        ),
      ),
    );
  }
}
