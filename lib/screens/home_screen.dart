/*
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website/widgets/hoverable_button.dart';
import 'package:portfolio_website/widgets/image.dart';
import 'package:portfolio_website/widgets/navbar.dart';
import 'package:portfolio_website/widgets/social_button.dart';
import 'package:portfolio_website/widgets/text.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const Navbar(),
        body: Padding(
          padding: EdgeInsets.only(bottom: 16.h), // Responsive padding
          child: ScrollbarTheme(
            data: ScrollbarThemeData(
              thumbColor:
                  WidgetStateProperty.all(Theme.of(context).primaryColor),
              thickness: WidgetStateProperty.all(8.w),
              radius: const Radius.circular(10),
              thumbVisibility: WidgetStateProperty.all(true),
            ),
            child: Scrollbar(
              controller: _scrollController,
              thumbVisibility: true,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HeroSection(), // Custom Widget for the Hero section
                    ProjectSection(),
                    SkillsSection(),
                    AboutSection(),
                    ContactSection(),
                    Footer(), // Custom Widget for the Footer section
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left Section: Text and Buttons
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hey Welcome!',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: 10.h),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "I'm ",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      TextSpan(
                        text: 'Praveen Yadav',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Your Aspiring Fullstack Web Developer.',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.grey[400]),
                ),
                SizedBox(height: 20.h),
                _buildButtons(context),
                SizedBox(height: 20.h),
                _buildSocialIcons(context),
              ],
            ),
          ),

          // Right Section: Image
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/pyapril15.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Row(
      children: [
        HoverableButton(
          onPressed: () {},
          label: "Have",
          icon: Icons.add,
        ),
        SizedBox(width: 20.w),
        ElevatedButton(
          onPressed: () {
            // Handle see project action
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            backgroundColor: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: const Text('See Project'),
        ),
      ],
    );
  }

  Widget _buildSocialIcons(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            // Handle LinkedIn action
          },
          icon: const Icon(Icons.linked_camera),
          color: Colors.white,
        ),
        SizedBox(width: 10.w),
        IconButton(
          onPressed: () {
            // Handle GitHub action
          },
          icon: const Icon(Icons.code),
          color: Colors.white,
        ),
        SizedBox(width: 10.w),
        IconButton(
          onPressed: () {
            // Handle Twitter/X action
          },
          icon: const Icon(Icons.alternate_email),
          color: Colors.white,
        ),
      ],
    );
  }
}

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Here is a glimpse of what I have done.',
            style: TextStyle(
              fontSize: screenWidth < 600 ? 24 : 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          // First project: Image on the left, Text on the right
          _ProjectCard(
            title: 'Dashboard',
            description:
                'Our MERN dashboard: The all-in-one command center for managing and visualizing data, simplified for you.',
            imagePath: 'assets/images/admin-dashboard.webp',
            // Placeholder path for the image
            features: const [
              'CRUD operation',
              'JWT auth',
              'Forget/Reset password',
              'Admin and User based access'
            ],
            screenWidth: screenWidth,
            isImageLeft: true,
          ),
          const SizedBox(height: 30),
          // Second project: Text on the left, Image on the right
          _ProjectCard(
            title: 'Chat App',
            description:
                'Discover our Chat App — an uncomplicated chat app for straightforward conversations, powered by the latest technologies.',
            imagePath:
                'assets/images/chat-app.webp', // Placeholder path for the image
            features: const [
              'Quick login with Google',
              'Add friend with Email',
              'Send messages in real-time'
            ],
            screenWidth: screenWidth,
            isImageLeft: false,
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final List<String> features;
  final double screenWidth;
  final bool isImageLeft;

  const _ProjectCard(
      {required this.title,
      required this.description,
      required this.imagePath,
      required this.features,
      required this.screenWidth,
      this.isImageLeft = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: isImageLeft
            ? [
                // Image on the Left
                assetImage(imagePath),
                const SizedBox(width: 20), // Space between image and text
                listDetail(title, description, features, screenWidth),
              ]
            : [
                // Text on the Left
                listDetail(title, description, features, screenWidth),
                const SizedBox(width: 20), // Space between text and image
                assetImage(imagePath),
              ],
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
                  const SizedBox(width: 10),
                  Expanded(
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
                  const SizedBox(width: 10),
                  Expanded(
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

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'But wait.. Who am I...',
            style: TextStyle(
              fontSize: screenWidth < 600 ? 24 : 28,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: SvgPicture.asset(
                    'assets/images/about-me.svg', // Ensure this path is correct
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello, I'm Praveen Yadav, a dedicated undergraduate student with a profound interest in web development. Currently pursuing my Bachelor of Computer Applications (BCA) degree, my goal is to master both front-end and back-end technologies, aiming to become a versatile and skilled developer. I thrive on the creativity and problem-solving that web development offers. Let's connect and exchange ideas in the dynamic world of web development. I'm always open to new connections and exciting opportunities. Feel free to reach out, and let's embark on this journey together.",
                        style: TextStyle(
                            fontSize: screenWidth < 600 ? 14 : 20,
                            color: const Color(0xff9ca3af),
                            height: 2),
                      ),
                      const SizedBox(height: 50),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Action to connect with me
                        },
                        icon: const Icon(FontAwesomeIcons.link,
                            color: Colors.white),
                        iconAlignment: IconAlignment.end,
                        label: const Text('Connect with me'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(screenWidth < 600 ? 10 : 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Let's get to know each other better.",
            style: TextStyle(
              fontSize: screenWidth < 600 ? 24 : 32,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 20),

          // Row for SVG and text with 50% width each
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: SvgPicture.asset(
                  'assets/images/connect.svg', // Ensure this path is correct
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(width: 20), // Space between SVG and text

              // Text with 50% width
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Thank you for visiting! This is your direct line to reach me. Whether you have a project in mind, a question about web development, or just want to say hello, I'm here and eager to connect with you.",
                        style: TextStyle(
                            fontSize: screenWidth < 600 ? 14 : 20,
                            color: const Color(0xff9ca3af),
                            height: 3),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Reach me out:-",
                        style: TextStyle(
                          fontSize: screenWidth < 600 ? 14 : 20,
                          color: const Color(0xff9ca3af),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    // Email Button
                    SocialButton(
                      label: 'praveen885127@gmail.com',
                      icon: Icons.mail_outline,
                      onPressed: () {
                        launchUrlString('mailto:praveen885127@gmail.com');
                      },
                    ),
                    const SizedBox(height: 40),

                    // Social Links as buttons
                    Wrap(
                      spacing: screenWidth < 600 ? 10 : 20,
                      runSpacing: 10,
                      children: [
                        SocialButton(
                          label: 'Github',
                          icon: FontAwesomeIcons.github,
                          onPressed: () {
                            launchUrlString("https://www.github.com/pyapril15");
                          },
                        ),
                        SocialButton(
                          label: 'LinkedIn',
                          icon: FontAwesomeIcons.linkedin,
                          onPressed: () {
                            launchUrlString(
                                "https://www.linkedin.com/pyapril1507");
                          },
                        ),
                        SocialButton(
                          label: 'Twitter',
                          icon: FontAwesomeIcons.twitter,
                          onPressed: () {
                            launchUrlString(
                                "https://www.twitter.com/pyapril15");
                          },
                        ),
                        SocialButton(
                          label: 'Discord',
                          icon: FontAwesomeIcons.discord,
                          onPressed: () {
                            launchUrlString(
                                'https://www.discord.com/pyapril15');
                          },
                        ),
                        SocialButton(
                          label: 'Instagram',
                          icon: FontAwesomeIcons.instagram,
                          onPressed: () {
                            launchUrlString(
                                'https://www.instagram.com/__pyapril15.py__');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:portfolio_website/screens/sections/about_section.dart';
import 'package:portfolio_website/screens/sections/contact_section.dart';
import 'package:portfolio_website/screens/sections/footer_section.dart';
import 'package:portfolio_website/screens/sections/hero_section.dart';
import 'package:portfolio_website/screens/sections/project_section.dart';
import 'package:portfolio_website/screens/sections/skills_section.dart';
import 'package:portfolio_website/widgets/navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey(); // About Section key
  final GlobalKey _contactKey = GlobalKey();

  String activeSection = 'Home';

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // Method to scroll to a specific section
  void scrollToSection(GlobalKey key, String section) {
    setState(() {
      activeSection = section; // Update active section
    });

    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: Navbar(
          onSectionSelected: (String section) {
            // Scroll to the corresponding section based on the selected item
            switch (section) {
              case 'Home':
                scrollToSection(_homeKey, section);
                break;
              case 'Projects':
                scrollToSection(_projectsKey, section);
                break;
              case 'Skills':
                scrollToSection(_skillsKey, section);
                break;
              case 'About':
                scrollToSection(_aboutKey, section);
                break;
              case 'Contact':
                scrollToSection(_contactKey, section);
                break;
            }
          },
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 16), // Responsive padding
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  key: _homeKey,
                  child: const HeroSection(), // Home Section
                ),
                Container(
                  key: _projectsKey,
                  child: const ProjectSection(), // Project Section
                ),
                Container(
                  key: _skillsKey,
                  child: const SkillsSection(), // Skills Section
                ),
                Container(
                  key: _aboutKey,
                  child: const AboutSection(), // About Section
                ),
                Container(
                  key: _contactKey,
                  child: const ContactSection(), // Contact Section
                ),
                const Footer(), // Footer
              ],
            ),
          ),
        ),
      ),
    );
  }
}
