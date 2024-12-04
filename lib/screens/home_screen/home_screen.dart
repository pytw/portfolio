import 'package:flutter/material.dart';
import 'package:portfolio_website/screens/home_screen/section_builder.dart';
import 'package:portfolio_website/widgets/back_to_top.dart';
import 'package:portfolio_website/widgets/date_time_widget.dart';
import 'package:portfolio_website/widgets/scroll_progress_indicator.dart';
import 'package:portfolio_website/screens/home_screen/sections/about_section.dart';
import 'package:portfolio_website/screens/home_screen/sections/contact_section.dart';
import 'package:portfolio_website/screens/sections/footer_section.dart';
import 'package:portfolio_website/screens/home_screen/sections/heroic_section.dart';
import 'package:portfolio_website/screens/home_screen/sections/project_section.dart';
import 'package:portfolio_website/screens/home_screen/sections/skill_section.dart';
import 'package:portfolio_website/widgets/custom_drawer.dart';
import 'package:portfolio_website/widgets/navbar.dart';
import '../../../theme/app_constant.dart';
import '../../widgets/section_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  double _scrollProgress = 0.0;

  bool _isAutoScrolling = false;
  String _activeSection = 'Home';

  late final Stream<DateTime> _dateTimeStream = Stream.periodic(
    const Duration(seconds: 1),
    (_) => DateTime.now(),
  );

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
    setState(() {
      double maxScroll = _scrollController.position.maxScrollExtent;
      double currentScroll = _scrollController.position.pixels;
      _scrollProgress = maxScroll != 0 ? currentScroll / maxScroll : 0;
    });

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
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: Navbar(
        activeSection: _activeSection,
        onSectionSelected: _scrollToSection,
      ),
      drawer: CustomDrawer(onSectionSelected: _scrollToSection),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: _calculatePadding(screenWidth),
              ),
              child: Column(
                children: [
                  for (var section in _sectionKeys.keys) ...[
                    SectionBuilder(
                      sectionKey: section,
                      sectionWidget: _getSectionWidget(section),
                      globalKey: _sectionKeys[section]!,
                      onVisibilityChanged: _onVisibilityChanged,
                      isVisible: _sectionVisibility[section] ?? false,
                    ),
                    const SizedBox(height: AppSize.spacing * 3),
                  ],
                  const FooterSection(),
                ],
              ),
            ),
            ScrollProgressIndicator(progress: _scrollProgress),
            Positioned(
              top: 8,
              right: 0,
              child: DateTimeWidget(dateTimeStream: _dateTimeStream),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 3,
              right: 16,
              child: SectionIndicator(
                sectionKeys: _sectionKeys,
                activeSection: _activeSection,
                onSectionTap: _scrollToSection,
              ),
            ),
            BackToTopButton(scrollController: _scrollController),
          ],
        ),
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
