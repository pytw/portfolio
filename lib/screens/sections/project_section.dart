import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_website/animations/slide_in_animation.dart';
import 'package:portfolio_website/helpers/responsive_helper.dart';
import 'package:portfolio_website/widgets/custom_button.dart';
import 'package:portfolio_website/widgets/custom_header.dart';

double textHeight = 3.2.h;
double letterSpace = 1.2.w;

// mobile
double mSmallSpaceHeight = 18.h;
double mLargeSpaceHeight = 32.h;

double mHeadingFontSize = 78.sp;
double mSubHeadingFontSize = 68.sp;
double mBodyFontSize = 56.sp;

// desktop
double dSmallSpaceHeight = 32.h;
double dLargeSpaceWidth = 48.w;

double dHeadingFontSize = 36.sp;
double dSubHeadingFontSize = 24.sp;
double dBodyFontSize = 20.sp;

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ScreenType screenType = getScreenType(context);

    double spaceHeight = screenType==ScreenType.mobile?mSmallSpaceHeight:dSmallSpaceHeight;
    double headingFontSize = screenType==ScreenType.mobile?mHeadingFontSize:dHeadingFontSize;

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
              headingFontSize: headingFontSize,
              titleLetterSpacing: letterSpace,
              subTitleLetterSpacing: letterSpace,
            ),
            SizedBox(height: spaceHeight),
            screenType == ScreenType.mobile
                ? const ProjectSectionMobile()
                : const ProjectSectionDesktop(),
            SizedBox(height: spaceHeight),
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

    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildImage(project),
          SizedBox(width: dLargeSpaceWidth),
          Expanded(
            flex: 1,
            child: CustomAnimation(
              animationType: AnimationType.scale,
              child: SingleChildScrollView(
                child: _buildWrapTexts(context, project),
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

    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              _buildImage(project),
            ],
          ),
          SizedBox(height: mLargeSpaceHeight),
          Expanded(
            flex: 2,
            child: CustomAnimation(
              animationType: AnimationType.scale,
              child: SingleChildScrollView(
                child: _buildWrapTexts(context, project),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Column _buildWrapTexts(BuildContext context, ProjectDetail project) {
  ScreenType screenType = getScreenType(context);

  double spaceHeight = mSmallSpaceHeight;

  double subHeadingFontSize = screenType==ScreenType.mobile?mSubHeadingFontSize:dSubHeadingFontSize;
  double bodyFontSize = screenType==ScreenType.mobile?mBodyFontSize:dBodyFontSize;

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
          project.title,
          style: TextStyle(
            fontSize: subHeadingFontSize,
            letterSpacing: letterSpace,
          )
      ),
      SizedBox(height: spaceHeight),
      Text(
          project.overView,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary,
            fontSize: bodyFontSize,
            letterSpacing: letterSpace,
            height: textHeight,
          )
      ),
      SizedBox(height: spaceHeight),
      _buildWrapChipSvgImage(project),
    ],
  );
}

Wrap _buildWrapChipSvgImage(ProjectDetail project) {
  return Wrap(
    spacing: 10.w,

    alignment: WrapAlignment.spaceEvenly,
    runAlignment: WrapAlignment.center,
    crossAxisAlignment: WrapCrossAlignment.center,

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

Expanded _buildImage(ProjectDetail project) {
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
