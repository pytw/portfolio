import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: Navbar(),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildHeroSection(context),
            _buildAnimatedSection(_buildProfileSection(), "Profile"),
            _buildAnimatedSection(_buildSkillsSection(context), "Skills"),
            _buildAnimatedSection(_buildProjectsSection(context), "Projects"),
            _buildAnimatedSection(_buildContactSection(context), "Contact"),
          ],
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

  // Contact Section with More Attractive Design
  Widget _buildContactSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            'Contact Me',
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent),
          ),
          SizedBox(height: 20),
          Text(
            'Feel free to reach out via email or social media!',
            style: TextStyle(fontSize: 18, color: Colors.black87),
          ),
          SizedBox(height: 20),
          CustomButton(
            label: 'Email Me',
            onPressed: () {
              // Action for email
            },
          ),
        ],
      ),
    );
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
