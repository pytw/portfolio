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
    if (width < AppSize.screenBreakPoint) return width * 0.01;
    return width * 0.1;
  }

  @override
  Widget build(BuildContext context) {
    final padding = _calculatePadding(MediaQuery.of(context).size.width);

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
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: Column(
                children: [
                  _buildSection('Home', const HeroicSection()),
                  _buildSection('Project', const ProjectSection()),
                  _buildSection('Skill', const SkillSection()),
                  _buildSection('About', const AboutSection()),
                  _buildSection('Contact', const ContactSection()),
                  const FooterSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String key, Widget sectionWidget) {
    return Column(
      key: _sectionKeys[key],
      children: [
        sectionWidget,
        const SizedBox(height: 36),
      ],
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
                fit: BoxFit.cover,
              ),
            ),
            Opacity(
              opacity: transitionFactor,
              child: Image.asset(
                images[nextImageIndex],
                fit: BoxFit.cover,
              ),
            ),
          ],
        );
      },
    );
  }
}
