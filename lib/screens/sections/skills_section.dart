import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio_website/animations/slide_in_animation.dart';
import 'package:portfolio_website/theme/theme.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.paddingLarge.w,
        vertical: AppSizes.paddingLarge.h,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              SizedBox(height: AppSizes.largeSpaceBtwItems.h),
              _buildSkillsRow(constraints),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    double headingFontSize = AppSizes.headingFontSize.sp;
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'What ',
              style: TextStyle(
                fontSize: headingFontSize,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            TextSpan(
              text: 'I Bring to the Table.',
              style: TextStyle(
                fontSize: headingFontSize,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillsRow(BoxConstraints constraints) {
    return SizedBox(
      height: constraints.maxHeight * 0.8,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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

  Widget _buildSkillColumn(String title, IconData icon, List<Skill> skills) {
    return _SkillContainer(
      title: title,
      icon: icon,
      skills: skills,
    );
  }

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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomAnimation(
            animationType: AnimationType.bounce,
            delay: const Duration(milliseconds: 100),
            child: _buildHeader(context, title, icon),
          ),
          SizedBox(height: AppSizes.mediumSpaceBtwItems.h),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: skills.map((skill) {
                  return CustomAnimation(
                    animationType: AnimationType.fadeAndSlide,
                    duration: const Duration(milliseconds: 600),
                    delay: const Duration(milliseconds: 200),
                    child: SkillItem(
                      skillName: skill.name,
                      iconPath: skill.iconPath,
                    ),
                  );
                }).toList(),
              ),
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

class SkillItem extends StatelessWidget {
  final String skillName;
  final String iconPath;

  const SkillItem({
    super.key,
    required this.skillName,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.paddingSmall.h),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: AppSizes.paddingMedium.w),
        padding: EdgeInsets.symmetric(
            horizontal: AppSizes.paddingMedium.w,
            vertical: AppSizes.paddingMedium.h),
        decoration: BoxDecoration(
          color: Colors.grey[800]?.withOpacity(0.8),
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusMedium),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.3),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              iconPath,
              width: AppSizes.iconSizeLarge.w,
              height: AppSizes.iconSizeLarge.h,
              fit: BoxFit.cover,
            ),
            SizedBox(width: AppSizes.smallSpaceBtwItems.w),
            Expanded(
              child: Text(
                skillName,
                style: TextStyle(
                  fontSize: AppSizes.mediumFontSize.sp,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Skill {
  final String name;
  final String iconPath;

  Skill(this.name, this.iconPath);
}
