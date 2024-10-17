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
    double screenWidth = MediaQuery.of(context).size.width;

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
                _buildAnimatedSection(_buildProfileSection(context), "Profile"),
                _buildAnimatedSection(_buildSkillsSection(context), "Skills"),
                _buildAnimatedSection(
                    _buildProjectsSection(context), "Projects"),
                _buildAnimatedSection(_buildContactSection(context), "Contact"),
                _buildFooter(screenWidth),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Hero Section
  Widget _buildHeroSection(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

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
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth < 600 ? 32 : 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'BCA Student | Software Developer',
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: screenWidth < 600 ? 16 : 24),
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
  Widget _buildProfileSection(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: 50, horizontal: screenWidth < 600 ? 10 : 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'About Me',
            style: TextStyle(
              fontSize: screenWidth < 600 ? 24 : 32,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 20),
          ClipOval(
            child: Image.asset(
              'assets/images/py.jpg',
              width: screenWidth < 600 ? 120 : 160,
              height: screenWidth < 600 ? 120 : 160,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'I am Praveen Yadav, a BCA student with a passion for software development. '
                'I specialize in Flutter, Java, and Python development, and I enjoy building '
                'scalable applications that solve real-world problems.',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: screenWidth < 600 ? 14 : 18, color: Colors.black87),
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
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            'Skills',
            style: TextStyle(
              fontSize: screenWidth < 600 ? 24 : 32,
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
              return _buildSkillCard(_getSkillLabel(index), screenWidth);
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillCard(String skill, double screenWidth) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: screenWidth < 600 ? 120 : 150,
      height: screenWidth < 600 ? 80 : 100,
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
          style: TextStyle(
            color: Colors.white,
            fontSize: screenWidth < 600 ? 14 : 18,
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
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            'Projects',
            style: TextStyle(
              fontSize: screenWidth < 600 ? 24 : 32,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 20),
          _buildProjectCard(
            context,
            'University ERP System',
            'A comprehensive ERP system for managing university operations.',
            screenWidth,
          ),
          _buildProjectCard(
            context,
            'Personal Portfolio Website',
            'A personal portfolio website to showcase my skills and projects.',
            screenWidth,
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(
      BuildContext context, String title, String description, double screenWidth) {
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
              style: TextStyle(
                fontSize: screenWidth < 600 ? 18 : 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(
                fontSize: screenWidth < 600 ? 14 : 16,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            CustomButton(
              label: 'View Project',
              onPressed: () {
                // Action to view project
              },
            ),
          ],
        ),
      ),
    );
  }

  // Contact Section
  Widget _buildContactSection(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(screenWidth < 600 ? 10 : 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact Me',
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
              // SVG Image with 50% width
              Expanded(
                flex: 1,
                child: SvgPicture.asset(
                  'assets/images/connect.svg', // Ensure this path is correct
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 20), // Space between SVG and text

              // Text with 50% width
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Thank you for visiting! This is your direct line to reach me. Whether you have a project in mind, a question about web development, or just want to say hello, I'm here and eager to connect with you.",
                      style: TextStyle(
                        fontSize: screenWidth < 600 ? 14 : 20,
                        color: const Color(0xff9ca3af),
                        height: 3
                      ),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      "Reach me out:-",
                      style: TextStyle(
                          fontSize: screenWidth < 600 ? 14 : 20,
                          color: const Color(0xff9ca3af),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Email Button
                    SocialButton(
                      label: 'praveen885127@gmail.com',
                      icon: Icons.mail_outline,
                      onPressed: () {
                        launch('mailto:praveen885127@gmail.com');
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
                          onPressed: () {launch("https://www.github.com/pyapril15");},
                        ),
                        SocialButton(
                          label: 'LinkedIn',
                          icon: FontAwesomeIcons.linkedin,
                          onPressed: (){launch("https://www.linkedin.com/pyapril1507");},
                        ),
                        SocialButton(
                          label: 'Twitter',
                          icon: FontAwesomeIcons.twitter,
                          onPressed: (){launch("https://www.twitter.com/pyapril15");},
                        ),
                        SocialButton(
                          label: 'Discord',
                          icon: FontAwesomeIcons.discord,
                          onPressed: (){launch("https://www.discord.com/pyapril15");},
                        ),
                        SocialButton(
                          label: 'Instagram',
                          icon: FontAwesomeIcons.instagram,
                          onPressed: () {launch("https://www.instagram.com/__pyapril15.py__");},
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


  // Footer
  Widget _buildFooter(double screenWidth) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.blueGrey[900],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '© 2024 Praveen Yadav. All rights reserved.',
            style: TextStyle(
              color: Colors.white,
              fontSize: screenWidth < 600 ? 14 : 16,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Made with Flutter',
            style: TextStyle(
              color: Colors.white70,
              fontSize: screenWidth < 600 ? 12 : 14,
            ),
          ),
        ],
      ),
    );
  }

  // Animated Section
  Widget _buildAnimatedSection(Widget child, String key) {
    return VisibilityDetector(
      key: Key(key),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction > 0.3) {
          setState(() {
            // Trigger animations here
          });
        }
      },
      child: child,
    );
  }
}
