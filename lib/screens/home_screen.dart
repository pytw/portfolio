import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:portfolio_website/screens/sections/about_section.dart';
import 'package:portfolio_website/screens/sections/contact_section.dart';
import 'package:portfolio_website/screens/sections/footer_section.dart';
import 'package:portfolio_website/screens/sections/heroic_section.dart';
import 'package:portfolio_website/screens/sections/project_section.dart';
import 'package:portfolio_website/screens/sections/skill_section.dart';
import 'package:portfolio_website/widgets/custom_drawer.dart';
import 'package:portfolio_website/widgets/navbar.dart';

import '../theme/app_constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isAutoScrolling = false;
  String _activeSection = 'Home';
  final Map<String, GlobalKey> _sectionKeys = {
    'Home': GlobalKey(),
    'Project': GlobalKey(),
    'Skill': GlobalKey(),
    'About': GlobalKey(),
    'Contact': GlobalKey(),
  };

  final Map<String, bool> _sectionVisibility = {
    'Home': false,
    'Project': false,
    'Skill': false,
    'About': false,
    'Contact': false,
  };

  bool _showBackToTopButton = false;

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

  void _onVisibilityChanged(String section, bool isVisible) {
    setState(() {
      _sectionVisibility[section] = isVisible;
    });
  }

  void _scrollToSection(String section) {
    if (_activeSection == section || _isAutoScrolling) return;

    setState(() => _activeSection = section);

    final keyContext = _sectionKeys[section]?.currentContext;
    if (keyContext != null) {
      _isAutoScrolling = true;
      Scrollable.ensureVisible(
        keyContext,
        duration: const Duration(milliseconds: 800),
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
        final position = box.localToGlobal(Offset.zero).dy;

        if (position >= -100 &&
            position <= 100 &&
            _activeSection != entry.key) {
          setState(() => _activeSection = entry.key);
          break;
        }
      }
    }

    setState(() {
      _showBackToTopButton = _scrollController.offset > 300;
    });
  }

  Widget _buildScrollProgressIndicator() {
    return Positioned(
      left: 0, top: 0, right: 0,
      child: LinearProgressIndicator(
        value: _scrollController.hasClients
            ? _scrollController.position.pixels /
                _scrollController.position.maxScrollExtent
            : 0.0,
        minHeight: 4,
        backgroundColor: Colors.grey[300],
        valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
      ),
    );
  }

  Widget _buildSectionIndicator() {
    return Column(
      children: _sectionKeys.keys.map((section) {
        final isActive = _activeSection == section;
        return GestureDetector(
          onTap: () => _scrollToSection(section),
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            width: isActive ? 14 : 10,
            height: isActive ? 14 : 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? Colors.blue : Colors.grey,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildBackToTopButton() {
    return Visibility(
      visible: _showBackToTopButton,
      child: Positioned(
        bottom: 20,
        right: 20,
        child: FloatingActionButton(
          onPressed: () => _scrollToSection('Home'),
          tooltip: 'Back to top',
          backgroundColor: Colors.blue,
          child: const Icon(Icons.arrow_upward),
        ),
      ),
    );
  }

  double _calculatePadding(double width) {
    return width < AppSize.smallScreenBreakPoint
        ? width * 0.02
        : width < AppSize.screenBreakPoint
            ? width * 0.05
            : width * 0.12;
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
        drawer: CustomDrawer(onSectionSelected: _scrollToSection),
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                  horizontal: _calculatePadding(screenWidth)),
              child: Column(
                children: [
                  for (var section in _sectionKeys.keys) ...[
                    _buildSection(
                      section,
                      _getSectionWidget(section),
                      screenHeight,
                      screenWidth,
                    ),
                    const SizedBox(height: AppSize.spacing * 3),
                  ],
                  const FooterSection(),
                ],
              ),
            ),
            _buildScrollProgressIndicator(),
            Positioned(
              top: screenHeight/2 - 80, right: 16,
                child: _buildSectionIndicator(),
            ),
            _buildBackToTopButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
    String sectionKey,
    Widget sectionWidget,
    double screenHeight,
    double screenWidth,
  ) {
    return VisibilityDetector(
      key: Key(sectionKey),
      onVisibilityChanged: (info) {
        _onVisibilityChanged(sectionKey, info.visibleFraction > 0.1);
      },
      child: AnimatedBuilder(
        animation: _scrollController,
        builder: (context, child) {
          final isVisible = _sectionVisibility[sectionKey] ?? false;

          final fadeInOpacity = isVisible ? 1.0 : 0.0;
          final slideUpOffset = isVisible ? 0.0 : 50.0;

          return AnimatedOpacity(
            duration: const Duration(milliseconds: 600),
            opacity: fadeInOpacity,
            child: Transform.translate(
              offset: Offset(0, slideUpOffset),
              child: Container(
                key: _sectionKeys[sectionKey],
                margin: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.02,
                  horizontal: screenWidth * 0.015,
                ),
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.02,
                  horizontal: screenWidth * 0.02,
                ),
                child: sectionWidget,
              ),
            ),
          );
        },
        child: sectionWidget,
      ),
    );
  }

  Widget _getSectionWidget(String section) {
    switch (section) {
      case 'Home':
        return const HeroicSection();
      case 'Project':
        return const ProjectSection();
      case 'Skill':
        return const SkillSection();
      case 'About':
        return const AboutSection();
      case 'Contact':
        return const ContactSection();
      default:
        return const SizedBox.shrink();
    }
  }
}
