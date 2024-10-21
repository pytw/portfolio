import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio_website/animations/slide_in_animation.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'What ',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue, // Blue color for "What"
                  ),
                ),
                TextSpan(
                  text: 'I Bring to the Table.',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // White color for the rest
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Skills Section
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomAnimation(
                      animationType: AnimationType.slide,
                      begin: const Offset(-1.0, 0.0),
                      child: _SkillContainer(
                        title: 'Frontend',
                        icon: Icons.web,
                        skills: [
                          Skill('Flutter', 'assets/icons/Flutter.svg'),
                          Skill('Tkinter', 'assets/icons/Python.svg'),
                          Skill('Qt', 'assets/icons/Qt-Framework.svg'),
                          Skill('HTML', 'assets/icons/HTML5.svg'),
                          Skill('CSS', 'assets/icons/css3.svg'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomAnimation(
                      animationType: AnimationType.slide,
                      begin: const Offset(0.0, -1.0),
                      child: _SkillContainer(
                        title: 'Backend',
                        icon: Icons.storage,
                        skills: [
                          Skill('Firebase', 'assets/icons/Firebase.svg'),
                          Skill('Dart', 'assets/icons/Dart.svg'),
                          Skill('Python', 'assets/icons/Python.svg'),
                          Skill('Java', 'assets/icons/Java.svg'),
                          Skill('Django', 'assets/icons/Django.svg'),
                          Skill('Django Rest', 'assets/icons/django-rest.svg'),
                          Skill('MySQL', 'assets/icons/MySQl.svg'),
                          Skill('SQLite', 'assets/icons/SQLite.svg'),
                          Skill('Postman', 'assets/icons/Postman.svg'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomAnimation(
                      animationType: AnimationType.slide,
                      begin: const Offset(1.0, 0.0),
                      child: _SkillContainer(
                        title: 'Other Tools',
                        icon: Icons.build,
                        skills: [
                          Skill('Matplotlib', 'assets/icons/Matplotlib.svg'),
                          Skill('Pandas', 'assets/icons/pandas.svg'),
                          Skill('NumPy', 'assets/icons/NumPy.svg'),
                          Skill('Git', 'assets/icons/Git.svg'),
                          Skill('Github', 'assets/icons/GitHub.svg'),
                          Skill(
                              'Github Action', 'assets/icons/github-actions.svg'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 40), // Adjust spacing between sections
        ],
      ),
    );
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
      height: 300, // Fixed height for the container
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.blue),
        color: Colors.black,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.blue),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: skills.map((skill) {
                  return SkillItem(
                    skillName: skill.name,
                    iconPath: skill.iconPath,
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
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
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          SvgPicture.asset(
            iconPath,
            width: 24,
            height: 24,
            fit: BoxFit.cover,
          ), // Skill icon
          const SizedBox(width: 10),
          Text(
            skillName,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xff9ca3af),
            ),
          ),
        ],
      ),
    );
  }
}

class Skill {
  final String name;
  final String iconPath;

  Skill(this.name, this.iconPath);
}