import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_website/main.dart';
import 'package:portfolio_website/screens/sections/about_section.dart';
import 'package:portfolio_website/screens/sections/contact_section.dart';
import 'package:portfolio_website/screens/sections/footer_section.dart';
import 'package:portfolio_website/screens/sections/hero_section.dart';
import 'package:portfolio_website/screens/sections/project_section.dart';
import 'package:portfolio_website/screens/sections/skills_section.dart';
import 'package:portfolio_website/theme/theme.dart';
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
    final mediaQuery = MediaQuery.of(context).size;
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
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: mediaQuery.width*0.025),
              width: mediaQuery.width*0.95,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    key: _homeKey,
                    margin: EdgeInsets.symmetric(vertical: mediaQuery.height*0.025),
                    height: mediaQuery.height*0.95,
                    child: const HeroSection(), // Home Section
                  ),
                  SizedBox(height: AppSizes.mediumSpaceBtwItems.h),
                  Container(
                    key: _projectsKey,
                    margin: EdgeInsets.symmetric(vertical: mediaQuery.height*0.025),
                    height: mediaQuery.height*0.95,
                    child: const ProjectSection(), // Project Section
                  ),
                  SizedBox(height: AppSizes.mediumSpaceBtwItems.h),
                  Container(
                    key: _skillsKey,
                    margin: EdgeInsets.symmetric(vertical: mediaQuery.height*0.025),
                    height: mediaQuery.height*0.95,
                    child: const SkillsSection(), // Skills Section
                  ),
                  SizedBox(height: AppSizes.mediumSpaceBtwItems.h),
                  Container(
                    key: _aboutKey,
                    margin: EdgeInsets.symmetric(vertical: mediaQuery.height*0.025),
                    height: mediaQuery.height*0.95,
                    child: const AboutSection(), // About Section
                  ),
                  SizedBox(height: AppSizes.mediumSpaceBtwItems.h),
                  Container(
                    key: _contactKey,
                    margin: EdgeInsets.symmetric(vertical: mediaQuery.height*0.025),
                    height: mediaQuery.height*0.95,
                    child: const ContactSection(), // Contact Section
                  ),
                  const Footer(), // Footer
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
