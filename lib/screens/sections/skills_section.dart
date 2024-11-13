import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio_website/animations/custom_animation.dart';
import 'package:portfolio_website/helpers/responsive_helper.dart';
import 'package:portfolio_website/theme/theme.dart';
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


List<Skill> _frontendSkills() {
  return [
    Skill('Flutter', 'assets/icons/Flutter.svg'),
    Skill('Tkinter', 'assets/icons/Python.svg'),
    Skill('Qt', 'assets/icons/Qt-Framework.svg'),
    Skill('HTML', 'assets/icons/HTML5.svg'),
    Skill('CSS', 'assets/icons/css3.svg'),
  ];
}

List<Skill> _backendSkills() {
  return [
    Skill('Firebase', 'assets/icons/Firebase.svg'),
    Skill('Dart', 'assets/icons/Dart.svg'),
    Skill('Python', 'assets/icons/Python.svg'),
    Skill('Java', 'assets/icons/Java.svg'),
    Skill('Django', 'assets/icons/Django.svg'),
    Skill('Django Rest', 'assets/icons/django-rest.svg'),
    Skill('MySQL', 'assets/icons/MySQl.svg'),
    Skill('SQLite', 'assets/icons/SQLite.svg'),
    Skill('Postman', 'assets/icons/Postman.svg'),
  ];
}

List<Skill> _otherToolsSkills() {
  return [
    Skill('Matplotlib', 'assets/icons/Matplotlib.svg'),
    Skill('Pandas', 'assets/icons/pandas.svg'),
    Skill('NumPy', 'assets/icons/NumPy.svg'),
    Skill('Git', 'assets/icons/Git.svg'),
    Skill('Github', 'assets/icons/GitHub.svg'),
    Skill('Github Action', 'assets/icons/github-actions.svg'),
  ];
}

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ScreenType screenType = getScreenType(context);

    double spaceHeight = screenType==ScreenType.mobile?mSmallSpaceHeight:dSmallSpaceHeight;
    double headingFontSize = screenType==ScreenType.mobile?mHeadingFontSize:dHeadingFontSize;

    return LayoutBuilder(
        builder: (context, constraints) => SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              CustomHeader(
                titleText: 'What ',
                titleStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: headingFontSize,
                  letterSpacing: letterSpace,
                ),
                subtitleText: 'I Bring to the Table.',
                subtitleStyle: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: headingFontSize,
                  letterSpacing: letterSpace,
                ),
              ),
              SizedBox(height: spaceHeight),
              screenType == ScreenType.mobile
                  ? const SkillSectionMobile()
                  : const SkillSectionDesktop(),
            ],
          ),
        )
    );
  }
}

class SkillSectionDesktop extends StatelessWidget {
  const SkillSectionDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: CustomAnimation(
              animationType: AnimationType.slide,
              begin: const Offset(-1.0, 0.0),
              child:
              _buildSkillColumn('Frontend', Icons.web, _frontendSkills()),
            ),
          ),
          SizedBox(width: AppSizes.largeSpaceBtwItems.w),
          Expanded(
            child: CustomAnimation(
              child:
              _buildSkillColumn('Backend', Icons.storage, _backendSkills()),
            ),
          ),
          SizedBox(width: AppSizes.largeSpaceBtwItems.w),
          Expanded(
            child: CustomAnimation(
              animationType: AnimationType.slide,
              begin: const Offset(1.0, 0.0),
              child: _buildSkillColumn(
                  'Other Tools', Icons.build, _otherToolsSkills()),
            ),
          ),
        ],
      ),
    );
  }
}

class SkillSectionMobile extends StatelessWidget {
  const SkillSectionMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: CustomAnimation(
              animationType: AnimationType.slide,
              begin: const Offset(-1.0, 0.0),
              child:
              _buildSkillColumn('Frontend', Icons.web, _frontendSkills()),
            ),
          ),
          SizedBox(height: 18.h),
          Expanded(
            child: CustomAnimation(
              child:
              _buildSkillColumn('Backend', Icons.storage, _backendSkills()),
            ),
          ),
          SizedBox(height: 18.h),
          Expanded(
            child: CustomAnimation(
              animationType: AnimationType.slide,
              begin: const Offset(1.0, 0.0),
              child: _buildSkillColumn(
                  'Other Tools', Icons.build, _otherToolsSkills()),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildSkillColumn(String title, IconData icon, List<Skill> skills) {
  return _SkillContainer(
    title: title,
    icon: icon,
    skills: skills,
  );
}


class _SkillContainer extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Skill> skills;

  const _SkillContainer({
    required this.title,
    required this.icon,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppSizes.paddingLarge.w,
          vertical: AppSizes.paddingLarge.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.borderExtraLarge.sp),
        border: Border.all(color: Theme.of(context).primaryColor),
        color: Colors.black.withOpacity(0.7),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.5),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context, title, icon),
          SizedBox(height: AppSizes.mediumSpaceBtwItems.h),
          // Scrollable ListView
          Expanded(
            child: ListView.builder(
              itemCount: skills.length,
              itemBuilder: (context, index) {
                final skill = skills[index];
                return ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: AppSizes.paddingSmall.h,
                    horizontal: AppSizes.paddingMedium.w,
                  ),
                  leading: SvgPicture.asset(
                    skill.iconPath,
                    width: AppSizes.iconSizeLarge.w,
                    height: AppSizes.iconSizeLarge.h,
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    skill.name,
                    style: TextStyle(
                      fontSize: AppSizes.mediumFontSize.sp,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, String title, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.blue, size: AppSizes.iconSizeMedium.sp),
        SizedBox(width: AppSizes.smallSpaceBtwItems.w),
        Text(
          title,
          style: TextStyle(
            fontSize: AppSizes.largeFontSize.sp,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ],
    );
  }
}

class Skill {
  final String name;
  final String iconPath;

  Skill(this.name, this.iconPath);
}
