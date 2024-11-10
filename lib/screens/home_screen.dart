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
  final ScrollController _scrollController = ScrollController();
  final Map<String, GlobalKey> _sectionKeys = {
    'Home': GlobalKey(),
    'Projects': GlobalKey(),
    'Skills': GlobalKey(),
    'About': GlobalKey(),
    'Contact': GlobalKey(),
  };

  String _activeSection = 'Home';
  bool _isAutoScrolling = false;

  static const double mediumScreenBreakPoint = 768.0;
  static const double smallScreenBreakPoint = 600.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(String section) {
    setState(() {
      _activeSection = section;
    });

    final keyContext = _sectionKeys[section]?.currentContext;
    if (keyContext != null) {
      _isAutoScrolling = true;
      Scrollable.ensureVisible(
        keyContext,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      ).then((_) {
        _isAutoScrolling = false;
      });
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
            setState(() {
              _activeSection = entry.key;
            });
          }
          break;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    double padding;
    if (size.width < smallScreenBreakPoint) {
      padding = size.width * 0.005;
    } else if (size.width < mediumScreenBreakPoint) {
      padding = size.width * 0.01;
    } else {
      padding = size.width * 0.08;
    }

    return SafeArea(
      child: Scaffold(
        appBar: Navbar(
          activeSection: _activeSection,
          onSectionSelected: (section) => _scrollToSection(section),
        ),
        body: Scrollbar(
          controller: _scrollController,
          thumbVisibility: true,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: Column(
                children: [
                  ConstrainedBox(
                      constraints: BoxConstraints(minHeight: size.height * 0.7),
                      child: HeroicSection(_sectionKeys['Home']!)),
                  const SizedBox(height: 32),
                  ConstrainedBox(
                      constraints: BoxConstraints(minHeight: size.height * 0.8),
                      child: ProjectSection(_sectionKeys['Projects']!)),
                  const SizedBox(height: 32),
                  ConstrainedBox(
                      constraints: BoxConstraints(minHeight: size.height * 0.8),
                      child: AboutSection(_sectionKeys['About']!)),
                  const SizedBox(height: 32),
                  ConstrainedBox(
                      constraints: BoxConstraints(minHeight: size.height * 0.8),
                      child: ContactSection(_sectionKeys['Contact']!)),
                  const SizedBox(height: 32),
                  const FooterSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
