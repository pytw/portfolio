import 'package:dev_icons/dev_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/navbar.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Navbar(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Skills', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text('- Flutter Development'),
            Text('- Java Programming'),
            Text('- Python Scripting'),
          ],
        ),
      ),
    );
  }
}

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'What ',
                  style: TextStyle(
                    fontSize: screenWidth < 600 ? 24 : 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue, // Blue color for "What"
                  ),
                ),
                TextSpan(
                  text: 'I Bring to the Table.',
                  style: TextStyle(
                    fontSize: screenWidth < 600 ? 24 : 32,
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
                    child: SkillContainer(
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
                  const SizedBox(width: 10),
                  Expanded(
                    child: SkillContainer(
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
                  const SizedBox(width: 10),
                  Expanded(
                    child: SkillContainer(
                      title: 'Other Tools',
                      icon: Icons.build,
                      skills: [
                        Skill('Matplotlib', 'assets/icons/Matplotlib.svg'),
                        Skill('Pandas', 'assets/icons/pandas.svg'),
                        Skill('NumPy', 'assets/icons/NumPy.svg'),
                        Skill('Git', 'assets/icons/Git.svg'),
                        Skill('Github', 'assets/icons/GitHub.svg'),
                        Skill('Github Action', 'assets/icons/github-actions.svg'),
                      ],
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

class SkillContainer extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Skill> skills;

  const SkillContainer({super.key,
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
            offset: Offset(0, 5),
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

