import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
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
  // Scroll controller to track scrolling
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

  // Hero Section with Background Image
  Widget _buildHeroSection(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/bg.webp', // Ensure you have a high-quality image
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
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'BCA Student | Software Developer',
                  style: TextStyle(color: Colors.white70, fontSize: 24),
                ),
                SizedBox(height: 20),
                CustomButton(
                  label: 'Download CV',
                  onPressed: () {
                    // Action for CV download
                  },
                ),
                SizedBox(height: 20),
                SocialLinks(), // Social Media Icons
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Profile Section with Continuous Animation
  Widget _buildProfileSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'About Me',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          SizedBox(height: 20),
          ClipOval(
            child: Image.asset(
              'assets/images/py.jpg',
              width: 160,
              height: 160,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'I am Praveen Yadav, a BCA student with a passion for software development. '
            'I specialize in Flutter, Java, and Python development, and I enjoy building '
            'scalable applications that solve real-world problems.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.black87),
          ),
          SizedBox(height: 20),
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

  // Skills Section with Continuous Animation
  Widget _buildSkillsSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            'Skills',
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent),
          ),
          SizedBox(height: 20),
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

  // Skill Card Component with Hover Effect
  Widget _buildSkillCard(String skill) {
    return MouseRegion(
      onEnter: (_) => _showSkillEffect(skill),
      onExit: (_) => _hideSkillEffect(skill),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
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
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Center(
          child: Text(
            skill,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  // Get Skills based on index
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

  // Projects Section with Continuous Animation
  Widget _buildProjectsSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            'Projects',
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent),
          ),
          SizedBox(height: 20),
          _buildProjectCard(context, 'University ERP System',
              'A comprehensive ERP system for managing university operations.'),
          _buildProjectCard(context, 'Personal Portfolio Website',
              'A personal portfolio website to showcase my skills and projects.'),
        ],
      ),
    );
  }

  // Project Card Component with More Design
  Widget _buildProjectCard(
      BuildContext context, String title, String description) {
    return MouseRegion(
      onEnter: (_) => _showProjectEffect(title),
      onExit: (_) => _hideProjectEffect(title),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 5),
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
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent),
              ),
              SizedBox(height: 10),
              Text(
                description,
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              SizedBox(height: 10),
              CustomButton(
                label: 'View Project',
                onPressed: () {
                  // Action for viewing the project
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Let's get to know each other better.",
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: MouseRegion(
                  onEnter: (_) => _showGlowEffect(true),
                  onExit: (_) => _showGlowEffect(false),
                  child: SvgPicture.asset(
                    'assets/images/connect.svg', // Ensure you have added the correct path for SVG
                    fit: BoxFit.cover,
                    placeholderBuilder: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    // Fallback if the image is not found
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Thank you for visiting! This is your direct line to reach me. "
                          "Whether you have a project in mind, a question about web development, "
                          "or just want to say hello, I'm here and eager to connect with you. "
                          "Reach out to me via email:",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    _buildGlowButton(
                      onPressed: () {},
                      label: "praveen885127@gmail.com",
                      icon: Icons.mail_outline,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Connect through social media:",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildGlowButton(
                          onPressed: () {},
                          label: "Github",
                          icon: FontAwesomeIcons.github,
                        ),
                        _buildGlowButton(
                          onPressed: () {},
                          label: "Twitter",
                          icon: FontAwesomeIcons.twitter,
                        ),
                        _buildGlowButton(
                          onPressed: () {},
                          label: "LinkedIn",
                          icon: FontAwesomeIcons.linkedin,
                        ),
                        _buildGlowButton(
                          onPressed: () {},
                          label: "Instagram",
                          icon: FontAwesomeIcons.instagram,
                        ),
                        _buildGlowButton(
                          onPressed: () {},
                          label: "Facebook",
                          icon: FontAwesomeIcons.facebook,
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

  Widget _buildGlowButton({
    required VoidCallback onPressed,
    required String label,
    required IconData icon,
  }) {
    return MouseRegion(
      onEnter: (_) => _showGlowEffect(true),
      onExit: (_) => _showGlowEffect(false),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.5),
              blurRadius: 10.0,
              spreadRadius: 1.0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: TextButton.icon(
          onPressed: onPressed,
          icon: FaIcon(icon, size: 20.0, color: Colors.black),
          label: Text(label, style: const TextStyle(color: Colors.black)),
        ),
      ),
    );
  }

  void _showGlowEffect(bool isHovered) {
    // Logic to handle glow effect state
  }


  // Wrapper for animated sections
  Widget _buildAnimatedSection(Widget child, String sectionName) {
    return VisibilityDetector(
      key: Key(sectionName),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.0) {
          // Trigger animations or effects here
          setState(() {});
        }
      },
      child: child,
    );
  }

  // Show effect on Skill Card
  void _showSkillEffect(String skill) {
    setState(() {
      // Add hover effect logic here
    });
  }

  // Hide effect on Skill Card
  void _hideSkillEffect(String skill) {
    setState(() {
      // Remove hover effect logic here
    });
  }

  // Show effect on Project Card
  void _showProjectEffect(String title) {
    setState(() {
      // Add hover effect logic here
    });
  }

  // Hide effect on Project Card
  void _hideProjectEffect(String title) {
    setState(() {
      // Remove hover effect logic here
    });
  }
}
