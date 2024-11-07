import 'package:flutter/material.dart';
import 'package:portfolio_website/screens/sections/about_section.dart';
import 'package:portfolio_website/screens/sections/contact_section.dart';
import 'package:portfolio_website/screens/sections/footer_section.dart';
import 'package:portfolio_website/screens/sections/heroic_section.dart';
import 'package:portfolio_website/screens/sections/project_section.dart';
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
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  String activeSection = 'Home';

  // Constants
  static const double verticalPadding = 16.0;
  static const double spacing = 8.0;

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

  void scrollToSection(GlobalKey key, String section) {
    setState(() {
      activeSection = section;
    });

    // Smooth scrolling to the target section
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: Navbar(
          activeSection: activeSection,
          onSectionSelected: (String section) {
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
        body: Scrollbar(
          controller: _scrollController,
          thumbVisibility: true,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: verticalPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HeroicSection(),
                  SizedBox(height: spacing*4),
                  ProjectSection(),
                  SizedBox(height: spacing*4),
                  AboutSection(),
                  SizedBox(height: spacing*4),
                  ContactSection(),
                  SizedBox(height: spacing*4),
                  FooterSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
