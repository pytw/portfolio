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
                _buildAnimatedSection(_buildProjectsSection(context), "Projects"),
                _buildAnimatedSection(_buildSkillsSection(context), "Skills"),
                _buildAnimatedSection(_buildAboutSection(context), "About"),
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

  // Projects Section
  Widget _buildProjectsSection(BuildContext context) {
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
          _buildProjectCard(
            context,
            'Dashboard',
            'Our MERN dashboard: The all-in-one command center for managing and visualizing data, simplified for you.',
            'assets/images/admin-dashboard.webp', // Placeholder path for the image
            [
              'CRUD operation',
              'JWT auth',
              'Forget/Reset password',
              'Admin and User based access'
            ],
            screenWidth,
            isImageLeft: true,
          ),
          const SizedBox(height: 30),
          // Second project: Text on the left, Image on the right
          _buildProjectCard(
            context,
            'Chat App',
            'Discover our Chat App — an uncomplicated chat app for straightforward conversations, powered by the latest technologies.',
            'assets/images/chat-app.webp', // Placeholder path for the image
            [
              'Quick login with Google',
              'Add friend with Email',
              'Send messages in real-time'
            ],
            screenWidth,
            isImageLeft: false,
          ),
        ],
      ),
    );
  }

// Project Card with alternating image position
  Widget _buildProjectCard(
      BuildContext context,
      String title,
      String description,
      String imagePath,
      List<String> features,
      double screenWidth,
      {bool isImageLeft = true}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: isImageLeft
            ? [
                // Image on the Left
                _buildImageSection(imagePath, screenWidth),
                const SizedBox(width: 20), // Space between image and text
                _buildTextSection(title, description, features, screenWidth),
              ]
            : [
                // Text on the Left
                _buildTextSection(title, description, features, screenWidth),
                const SizedBox(width: 20), // Space between text and image
                _buildImageSection(imagePath, screenWidth),
              ],
      ),
    );
  }

// Image section
  Widget _buildImageSection(String imagePath, double screenWidth) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(1),
              blurRadius: 20,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            imagePath, // Ensure the correct image path
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

// Text section
  Widget _buildTextSection(String title, String description,
      List<String> features, double screenWidth) {
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: screenWidth < 600 ? 18 : 22,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(
              fontSize: screenWidth < 600 ? 14 : 16,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: features.map((feature) {
              return Row(
                children: [
                  const Icon(Icons.check_circle, color: Colors.green, size: 16),
                  const SizedBox(width: 5),
                  Text(
                    feature,
                    style: TextStyle(
                      fontSize: screenWidth < 600 ? 12 : 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
          const SizedBox(height: 15),
          // Action Buttons (View and Source Code)
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  // Action to view the project
                },
                icon: const Icon(Icons.open_in_new, color: Colors.white),
                iconAlignment: IconAlignment.end,
                label: const Text('Have a look'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
              ),
              const SizedBox(width: 10),
              OutlinedButton(
                onPressed: () {
                  // Action for source code
                },
                child: const Text('Source Code'),
              ),
            ],
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

  // About Section
  Widget _buildAboutSection(BuildContext context) {
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
                            height: 2
                        ),
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

  // Contact Section
  Widget _buildContactSection(BuildContext context) {
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
                          onPressed: () {
                            launch("https://www.github.com/pyapril15");
                          },
                        ),
                        SocialButton(
                          label: 'LinkedIn',
                          icon: FontAwesomeIcons.linkedin,
                          onPressed: () {
                            launch("https://www.linkedin.com/pyapril1507");
                          },
                        ),
                        SocialButton(
                          label: 'Twitter',
                          icon: FontAwesomeIcons.twitter,
                          onPressed: () {
                            launch("https://www.twitter.com/pyapril15");
                          },
                        ),
                        SocialButton(
                          label: 'Discord',
                          icon: FontAwesomeIcons.discord,
                          onPressed: () {
                            launch("https://www.discord.com/pyapril15");
                          },
                        ),
                        SocialButton(
                          label: 'Instagram',
                          icon: FontAwesomeIcons.instagram,
                          onPressed: () {
                            launch(
                                "https://www.instagram.com/__pyapril15.py__");
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

  // Footer
  Widget _buildFooter(double screenWidth) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.blueGrey[900],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '\u00A9 2024 Praveen Yadav. All rights reserved.',
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
