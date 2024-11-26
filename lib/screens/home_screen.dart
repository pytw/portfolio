import 'package:flutter/material.dart';
import 'package:portfolio_website/constants/app_image.dart';
import 'package:portfolio_website/constants/app_size.dart';
import 'package:portfolio_website/screens/sections/about_section.dart';
import 'package:portfolio_website/screens/sections/contact_section.dart';
import 'package:portfolio_website/screens/sections/footer_section.dart';
import 'package:portfolio_website/screens/sections/heroic_section.dart';
import 'package:portfolio_website/screens/sections/project_section.dart';
import 'package:portfolio_website/screens/sections/skill_section.dart';
import 'package:portfolio_website/widgets/navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isAutoScrolling = false;
  late String _activeSection = 'Home';

  final Map<String, GlobalKey> _sectionKeys = {
    'Home': GlobalKey(),
    'Project': GlobalKey(),
    'Skill': GlobalKey(),
    'About': GlobalKey(),
    'Contact': GlobalKey(),
  };

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(String section) {
    if (_activeSection == section) return;

    setState(() => _activeSection = section);

    final keyContext = _sectionKeys[section]?.currentContext;
    if (keyContext != null) {
      _isAutoScrolling = true;
      Scrollable.ensureVisible(
        keyContext,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      ).then((_) => _isAutoScrolling = false);
    }
  }

  void _onScroll() {
    if (_isAutoScrolling) return;
    for (var entry in _sectionKeys.entries) {
      final context = entry.value.currentContext;
      if (context != null) {
        final box = context.findRenderObject() as RenderBox;
        final position = box.localToGlobal(Offset.zero);
        if (position.dy <= 100 && position.dy >= -100) {
          if (_activeSection != entry.key) {
            setState(() => _activeSection = entry.key);
          }
          break;
        }
      }
    }
  }

  double _calculatePadding(double width) {
    if (width < AppSize.smallScreenBreakPoint) return width * 0.005;
    if (width < AppSize.screenBreakPoint) return width * 0.05;
    return width * 0.12;
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: Navbar(
          activeSection: _activeSection,
          onSectionSelected: _scrollToSection,
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: _buildScrollImageEffect(),
            ),
            SingleChildScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                  horizontal: _calculatePadding(screenWidth)),
              child: Column(
                children: [
                  _buildSection(
                    'Home',
                    const HeroicSection(),
                    screenHeight,
                    screenWidth,
                  ),
                  _buildSection('Project', const ProjectSection(), screenHeight,
                      screenWidth),
                  _buildSection(
                      'Skill', const SkillSection(), screenHeight, screenWidth),
                  _buildSection(
                      'About', const AboutSection(), screenHeight, screenWidth),
                  _buildSection('Contact', const ContactSection(), screenHeight,
                      screenWidth),
                  const FooterSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String key, Widget sectionWidget, double screenHeight,
      double screenWidth) {
    return Container(
      key: _sectionKeys[key],
      margin: EdgeInsets.symmetric(
        vertical: screenHeight * 0.02,
        horizontal: screenWidth * 0.02,
      ),
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.02,
        horizontal: screenWidth * 0.02,
      ),
      child: sectionWidget,
    );
  }

  Widget _buildScrollImageEffect() {
    final List<String> images = [AppImage.bg1, AppImage.bg2, AppImage.bg3];

    return AnimatedBuilder(
      animation: _scrollController,
      builder: (context, child) {
        double offset =
            _scrollController.hasClients ? _scrollController.offset : 0.0;
        double totalHeight = MediaQuery.of(context).size.height;

        int currentImageIndex = (offset ~/ totalHeight) % images.length;

        int nextImageIndex = (currentImageIndex + 1) % images.length;

        double transitionFactor = (offset % totalHeight) / totalHeight;

        return Stack(
          fit: StackFit.expand,
          children: [
            Opacity(
              opacity: 1 - transitionFactor,
              child: Image.asset(
                images[currentImageIndex],
                fit: BoxFit.fill,
              ),
            ),
            Opacity(
              opacity: transitionFactor,
              child: Image.asset(
                images[nextImageIndex],
                fit: BoxFit.fill,
              ),
            ),
          ],
        );
      },
    );
  }
}
