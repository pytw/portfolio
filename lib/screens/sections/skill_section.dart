import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_website/constants/app_size.dart';
import 'package:portfolio_website/widgets/custom_header.dart';
import 'package:portfolio_website/widgets/effect.dart';

class SkillSection extends StatelessWidget {
  const SkillSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSize.horizontalPadding,
        vertical: AppSize.verticalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildSkillHeader(context),
          const SizedBox(height: AppSize.spacing * 3),
          LayoutBuilder(
            builder: (context, constraints) {
              final isWideScreen =
                  constraints.maxWidth > AppSize.screenBreakPoint;
              return isWideScreen
                  ? _buildHorizontalSkillCategories(context, skillCategories)
                  : _buildVerticalSkillCategories(context, skillCategories);
            },
          ),
        ],
      ),
    );
  }
}

Widget _buildSkillHeader(BuildContext context) {
  return CustomHeader(
    titleText: 'What ',
    titleStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
          color: Theme.of(context).primaryColor,
        ),
    subtitleText: 'I Bring to the Table.',
    subtitleStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
  );
}

Widget _buildHorizontalSkillCategories(
  BuildContext context,
  List<SkillCategory> categories,
) {
  return IntrinsicHeight(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: categories.map((category) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSize.spacing),
            child: _buildSkillCategoryCard(context, category),
          ),
        );
      }).toList(),
    ),
  );
}

Widget _buildVerticalSkillCategories(
  BuildContext context,
  List<SkillCategory> categories,
) {
  return Wrap(
    spacing: AppSize.spacing * 3,
    runSpacing: AppSize.spacing * 3,
    alignment: WrapAlignment.center,
    children: categories.map((category) {
      return ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 350),
        child: _buildSkillCategoryCard(context, category),
      );
    }).toList(),
  );
}

Widget _buildSkillCategoryCard(BuildContext context, SkillCategory category) {
  return Effect(
    scale: 1.05,
    builder: (_, __, ___, ____) => Container(
      padding: const EdgeInsets.all(AppSize.spacing * 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.borderRadius * 2),
        color: Colors.black.withOpacity(0.7),
        border: Border.all(color: Theme.of(context).primaryColor),
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
          _buildSkillCategoryHeader(context, category),
          const SizedBox(height: AppSize.spacing * 2),
          _buildSkillList(context, category.skills),
        ],
      ),
    ),
  );
}

Widget _buildSkillCategoryHeader(BuildContext context, SkillCategory category) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(category.icon, color: Theme.of(context).primaryColor),
      const SizedBox(width: AppSize.spacing),
      Text(
        category.title,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
      ),
    ],
  );
}

Widget _buildSkillList(BuildContext context, List<Skill> skills) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: skills.map((skill) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSize.spacing),
        child: Row(
          children: [
            SvgPicture.asset(skill.iconPath, width: 28, height: 28),
            const SizedBox(width: AppSize.spacing * 2),
            Text(
              skill.name,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
            ),
          ],
        ),
      );
    }).toList(),
  );
}

class SkillCategory {
  final String title;
  final IconData icon;
  final List<Skill> skills;

  SkillCategory(
      {required this.title, required this.icon, required this.skills});
}

class Skill {
  final String name;
  final String iconPath;

  Skill(this.name, this.iconPath);
}

List<Skill> _frontendSkill() {
  return [
    Skill('Flutter', 'assets/icons/Flutter.svg'),
    Skill('Tkinter', 'assets/icons/Python.svg'),
    Skill('Qt', 'assets/icons/Qt-Framework.svg'),
    Skill('HTML', 'assets/icons/HTML5.svg'),
    Skill('CSS', 'assets/icons/css3.svg'),
  ];
}

List<Skill> _backendSkill() {
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

List<Skill> _otherToolsSkill() {
  return [
    Skill('Matplotlib', 'assets/icons/Matplotlib.svg'),
    Skill('Pandas', 'assets/icons/pandas.svg'),
    Skill('NumPy', 'assets/icons/NumPy.svg'),
    Skill('Git', 'assets/icons/Git.svg'),
    Skill('Github', 'assets/icons/GitHub.svg'),
    Skill('Github Action', 'assets/icons/github-actions.svg'),
  ];
}

final List<SkillCategory> skillCategories = [
  SkillCategory(
    title: 'Frontend',
    icon: Icons.web,
    skills: _frontendSkill(),
  ),
  SkillCategory(
    title: 'Backend',
    icon: Icons.storage,
    skills: _backendSkill(),
  ),
  SkillCategory(
    title: 'Other Tools',
    icon: Icons.build,
    skills: _otherToolsSkill(),
  ),
];
