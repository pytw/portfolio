import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_website/animations/slide_in_animation.dart';
import 'package:portfolio_website/helpers/responsive_helper.dart';
import 'package:portfolio_website/theme/theme.dart';
import 'package:portfolio_website/widgets/custom_button.dart';
import 'package:portfolio_website/widgets/custom_header.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ScreenType screenType = getScreenType(context);
    return LayoutBuilder(
      builder: (context, constraints) => SizedBox(
        width: double.infinity,
        height: screenType==ScreenType.mobile?null:double.infinity,
        child: Column(
          children: [
            CustomHeader(
              titleText: 'Here is a glimpse of what ',
              titleColor: Theme.of(context).colorScheme.onPrimary,
              subtitleText: 'I have done.',
              subtitleColor: Theme.of(context).primaryColor,
              headingFontSize: screenType==ScreenType.mobile?78.sp:42.sp,
            ),
            SizedBox(height: screenType==ScreenType.mobile?16.h:28.h),
            screenType == ScreenType.mobile
                ? const ProjectSectionMobile()
                : const ProjectSectionDesktop(),
            SizedBox(height: screenType==ScreenType.mobile?16.h:28.h),
            Align(
              alignment: Alignment.topRight,
              child: CustomButton(
                onPressed: () {},
                label: 'More project...',
                textStyle: TextStyle(color: Theme.of(context).primaryColor),
                hoverUnderlineColor: Theme.of(context).primaryColor,
                hoverEffects: const [
                  HoverEffect.underline,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectSectionDesktop extends StatelessWidget {
  const ProjectSectionDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    ProjectDetail project = _singleProject();

    double bodyFontSize = 20.sp;
    double mediumHeadingFontSize = 28.sp;

    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildSvgImage(project),
          SizedBox(width: AppSizes.largeSpaceBtwItems.w),
          Expanded(
            flex: 1,
            child: CustomAnimation(
              animationType: AnimationType.scale,
              child: SingleChildScrollView(
                child: _buildWrapTexts(
                    project, context, mediumHeadingFontSize, bodyFontSize),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectSectionMobile extends StatelessWidget {
  const ProjectSectionMobile({super.key});

  @override
  Widget build(BuildContext context) {
    ProjectDetail project = _singleProject();

    double bodyFontSize = 56.sp;
    double mediumHeadingFontSize = 68.sp;

    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              _buildSvgImage(project),
            ],
          ),
          SizedBox(height: 28.h,),
          Expanded(
            flex: 2,
            child: CustomAnimation(
              animationType: AnimationType.scale,
              child: SingleChildScrollView(
                child: _buildWrapTexts(
                    project, context, mediumHeadingFontSize, bodyFontSize),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

ProjectDetail _singleProject() {
  return ProjectDetail(
    "Dashboard",
    "assets/images/admin-dashboard.webp",
    "An admin dashboard serves multiple crucial functions, enhancing operational efficiency, decision-making, and user management. It provides a centralized platform for overseeing components, making informed decisions, and managing user interactions. The dashboard presents real-time data and analytics, enabling prompt responses to emerging trends and issues. It empowers data-driven decision-making, efficient user management, and content oversight. The dashboard also monitors system health, ensures security and compliance, and facilitates communication among team members. Its scalability supports long-term growth, adapting to changing business environments. It's a vital tool for effective management, strategic decision-making, and operational excellence.",
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
  final String overView;
  final List<TechnicalSkill> skills;

  ProjectDetail(this.title, this.imagePath, this.overView, this.skills);
}

class TechnicalSkill {
  final String name;
  final String iconPath;

  TechnicalSkill(this.name, this.iconPath);
}

Column _buildWrapTexts(ProjectDetail project, BuildContext context,
    double mediumHeadingFontSize, double bodyFontSize) {
  return Column(
    children: [
      Text(
        project.title,
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontSize: mediumHeadingFontSize,
            ),
      ),
      Text(
        project.overView,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              height: AppSizes.lineHeightLarge.h,
              letterSpacing: AppSizes.letterSpacingLarge.w,
              color: Theme.of(context).colorScheme.onSecondary,
              fontSize: bodyFontSize,
            ),
      ),
      _buildWrapChipSvgImage(project),
    ],
  );
}

Wrap _buildWrapChipSvgImage(ProjectDetail project) {
  return Wrap(
    children: project.skills.map((skill) {
      return Chip(
        label: Text(skill.name),
        avatar: SvgPicture.asset(
          skill.iconPath,
          fit: BoxFit.cover,
        ),
      );
    }).toList(),
  );
}

Expanded _buildSvgImage(ProjectDetail project) {
  return Expanded(
    flex: 1,
    child: CustomAnimation(
      animationType: AnimationType.scale,
      child: FittedBox(
        child: Image.asset(
          project.imagePath,
          fit: BoxFit.contain,
        ),
      ),
    ),
  );
}
