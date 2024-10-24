import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_website/animations/slide_in_animation.dart';
import 'package:portfolio_website/theme/theme.dart';
import 'package:portfolio_website/widgets/custom_button.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    ProjectDetail project = _singleProject();
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.paddingLarge.w,
        vertical: AppSizes.paddingLarge.h,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double bodyFontSize = AppSizes.mediumFontSize.sp;
          double mediumHeadingFontSize = AppSizes.extraLargeFontSize.sp;
          double iconSize = AppSizes.iconSizeMedium.sp;

          return Column(
            children: [
              _buildHeader(context),
              SizedBox(height: AppSizes.largeSpaceBtwItems.h),
              _buildProjectRow(
                  project, context, mediumHeadingFontSize, bodyFontSize),
              SizedBox(height: AppSizes.largeSpaceBtwItems.h),
              Align(
                alignment: Alignment.centerRight,
                child: CustomButton(
                  label: 'Submit',
                  onPressed: () {
                    print('Button pressed');
                  },
                  icon: Icons.send,
                  iconColor: Colors.white,
                  backgroundColor: Colors.blue,
                  hoverBackgroundColor: Colors.blueAccent,
                  iconPosition: IconPosition.isRight,
                  hoverEffects: [
                    HoverEffect.backgroundColor,
                    HoverEffect.elevation,
                    HoverEffect.shadow,
                  ],
                  clickEffects: [
                    ClickEffect.backgroundColor,
                    ClickEffect.scale,
                    ClickEffect.elevation,
                  ],
                  borderRadius: BorderRadius.circular(8),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  elevation: 4.0,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Expanded _buildProjectRow(ProjectDetail project, BuildContext context,
      double mediumHeadingFontSize, double bodyFontSize) {
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

  Wrap _buildWrapTexts(ProjectDetail project, BuildContext context,
      double mediumHeadingFontSize, double bodyFontSize) {
    return Wrap(
      spacing: AppSizes.mediumSpaceBtwItems.w,
      runSpacing: AppSizes.mediumSpaceBtwItems.h,
      alignment: WrapAlignment.center,
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
      spacing: AppSizes.mediumSpaceBtwItems.w,
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
        child: AspectRatio(
          aspectRatio: 1,
          child: Image.asset(
            project.imagePath,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    double headingFontSize = AppSizes.headingFontSize.sp;
    return Align(
      alignment: Alignment.topLeft,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Here is a glimpse of what ',
              style: TextStyle(
                fontSize: headingFontSize,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            TextSpan(
              text: 'I have done.',
              style: TextStyle(
                fontSize: headingFontSize,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
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
