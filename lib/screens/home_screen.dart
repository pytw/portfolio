import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/widgets/social_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../widgets/navbar.dart';
import '../widgets/social_links.dart';
import '../widgets/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;
  bool _isMailHovered = false; // Track email hover state
  bool _isSocialButtonHovered = false; // Track social button hover state

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
          padding: const EdgeInsets.only(bottom: 16),
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildHeroSection(context),
                _buildAnimatedSection(_buildProfileSection(), "Profile"),
                _buildAnimatedSection(_buildSkillsSection(context), "Skills"),
                _buildAnimatedSection(
                    _buildProjectsSection(context), "Projects"),
                _buildAnimatedSection(_buildContactSection(context), "Contact"),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Divider(
                          height: 1.2,
                          thickness: 1,
                          color: Colors.white,
                          indent: 50,
                          endIndent: 10,
                        )),
                    Text(
                        "Don't hesitate to reach out. \u00A9 2024 | Praveen Yadav",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    Expanded(
                        child: Divider(
                          height: 1.2,
                          thickness: 1,
                          color: Colors.white,
                          indent: 10,
                          endIndent: 50,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Hero Section
  Widget _buildHeroSection(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/bg.webp',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Center(
                  child: Text('Image not found',
                      style: TextStyle(color: Colors.red)));
            },
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black.withOpacity(0.7), Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hi, I\'m Praveen Yadav',
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'BCA Student | Software Developer',
                  style: TextStyle(color: Colors.white70, fontSize: 24),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  label: 'Download CV',
                  onPressed: () {
                    // Action for CV download
                  },
                ),
                const SizedBox(height: 20),
                const SocialLinks(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Profile Section
  Widget _buildProfileSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'About Me',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 20),
          ClipOval(
            child: Image.asset(
              'assets/images/py.jpg',
              width: 160,
              height: 160,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'I am Praveen Yadav, a BCA student with a passion for software development. '
                'I specialize in Flutter, Java, and Python development, and I enjoy building '
                'scalable applications that solve real-world problems.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.black87),
          ),
          const SizedBox(height: 20),
          CustomButton(
            label: 'More About Me',
            onPressed: () {
              // Action to learn more about you
            },
          ),
        ],
      ),
    );
  }

  // Skills Section
  Widget _buildSkillsSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text(
            'Skills',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            runSpacing: 20,
            children: List.generate(5, (int index) {
              return _buildSkillCard(_getSkillLabel(index));
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillCard(String skill) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: 150,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Center(
        child: Text(
          skill,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  String _getSkillLabel(int index) {
    switch (index) {
      case 0:
        return 'Flutter';
      case 1:
        return 'Java';
      case 2:
        return 'Python';
      case 3:
        return 'MySQL';
      case 4:
        return 'Firebase';
      default:
        return '';
    }
  }

  // Projects Section
  Widget _buildProjectsSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text(
            'Projects',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 20),
          _buildProjectCard(
            context,
            'University ERP System',
            'A comprehensive ERP system for managing university operations.',
          ),
          _buildProjectCard(
            context,
            'Personal Portfolio Website',
            'A personal portfolio website to showcase my skills and projects.',
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(
      BuildContext context, String title, String description) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 10),
            CustomButton(
              label: 'View Project',
              onPressed: () {
                // Action for viewing the project
              },
            ),
          ],
        ),
      ),
    );
  }

// Contact Section
  Widget _buildContactSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Let's get to know each other better.",
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Flexible SVG image to avoid overflow
              Flexible(
                child: SvgPicture.asset(
                  'assets/images/connect.svg',
                  fit: BoxFit.contain, // Adjust fit to prevent overflow
                  placeholderBuilder: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              // Expanded Column to handle overflow in content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Thank you for visiting! This is your direct line to reach me. "
                            "Whether you have a project in mind, a question about web development, "
                            "or just want to say hello, I'm here and eager to connect with you. "
                            "Reach out to me via email:",
                        style: TextStyle(fontSize: 16, color: Colors.white, height: 2, letterSpacing: 1),
                      ),
                      const SizedBox(height: 30),
                      SocialButton(
                        label: "praveen885127@gmail.com",
                        icon: Icons.mail_outline,
                        onPressed: () { launch('mailto:praveen885127@gmail.com'); },
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        "Connect through social media:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Wrap(
                        spacing: 10.0,
                        runSpacing: 10.0,
                        children: [
                          SocialButton(label: "Github", icon: FontAwesomeIcons.github, onPressed: () { launch('https://github.com/pyapril15'); }),
                          SocialButton(label: "Twitter", icon: FontAwesomeIcons.twitter, onPressed: () { launch('https://twitter.com/pyapril15'); }),
                          SocialButton(label: "LinkedIn", icon: FontAwesomeIcons.linkedin, onPressed: () { launch('https://linkedin.com/in/pyapril1507'); }),
                          SocialButton(label: "Discord", icon: FontAwesomeIcons.discord, onPressed: () { launch('https://discord.com/pyapril15'); }),
                          SocialButton(label: "Instagram", icon: FontAwesomeIcons.instagram, onPressed: () { launch('https://instagram.com/__pyapril15.py__'); }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


  // Wrapper to make section widgets animated
  Widget _buildAnimatedSection(Widget section, String key) {
    return VisibilityDetector(
      key: Key(key),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction > 0.3) {
          // Trigger animation when section is 30% visible
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        child: section,
      ),
    );
  }
}
