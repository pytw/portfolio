import 'dart:async';
import 'package:flutter/material.dart';
import 'package:portfolio_website/screens/sections/about_section.dart';
import 'package:portfolio_website/screens/sections/contact_section.dart';
import 'package:portfolio_website/screens/sections/footer_section.dart';
import 'package:portfolio_website/screens/sections/heroic_section.dart';
import 'package:portfolio_website/screens/sections/project_section.dart';
import 'package:portfolio_website/screens/sections/skill_section.dart';
import 'package:portfolio_website/widgets/navbar.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<bool> _isScrolling = ValueNotifier<bool>(false);
  bool _isAutoScrolling = false;
  String _scrollDirection = 'down';
  double _lastScrollPosition = 0.0;

  final Map<String, GlobalKey> _sectionKeys = {
    'Home': GlobalKey(),
    'Project': GlobalKey(),
    'Skill': GlobalKey(),
    'About': GlobalKey(),
    'Contact': GlobalKey(),
  };

  String _activeSection = 'Home';

  static const double mediumScreenBreakPoint = 768.0;
  static const double smallScreenBreakPoint = 600.0;

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

    if (!_isScrolling.value) _isScrolling.value = true;

    final keyContext = _sectionKeys[section]?.currentContext;
    if (keyContext != null) {
      _isAutoScrolling = true;
      Scrollable.ensureVisible(
        keyContext,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      ).then((_) => _isAutoScrolling = false);
    }

    Future.delayed(const Duration(milliseconds: 800), () {
      _isScrolling.value = false;
    });
  }

  void _onScroll() {
    if (_isAutoScrolling) return;

    final currentPosition = _scrollController.offset;
    final newDirection = currentPosition > _lastScrollPosition ? 'down' : 'up';

    if (newDirection != _scrollDirection) {
      setState(() {
        _scrollDirection = newDirection;
      });
    }

    if (!_isScrolling.value) _isScrolling.value = true;

    _lastScrollPosition = currentPosition;

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

    Future.delayed(const Duration(milliseconds: 200), () {
      _isScrolling.value = false;
    });
  }

  double _calculatePadding(double width) {
    if (width < smallScreenBreakPoint) return width * 0.005;
    if (width < mediumScreenBreakPoint) return width * 0.01;
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
              child: ValueListenableBuilder<bool>(
                valueListenable: _isScrolling,
                builder: (context, isScrolling, child) {
                  return VideoBackground(
                    videoPath: "assets/videos/star.mp4",
                    play: isScrolling,
                  );
                },
              ),
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
}

class VideoBackground extends StatefulWidget {
  final String videoPath;
  final bool play;
  final bool isNetwork;

  const VideoBackground({
    super.key,
    required this.videoPath,
    required this.play,
    this.isNetwork = false,
  });

  @override
  State<VideoBackground> createState() => _VideoBackgroundState();
}

class _VideoBackgroundState extends State<VideoBackground> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _initializeController(widget.videoPath, widget.isNetwork);
  }

  void _initializeController(String path, bool isNetwork) {
    _videoController = isNetwork
        ? VideoPlayerController.networkUrl(path as Uri)
        : VideoPlayerController.asset(path);

    _videoController
      ..setLooping(true)
      ..setVolume(1.0)
      ..initialize().then((_) {
        if (widget.play) {
          _videoController.play();
          _videoController.setPlaybackSpeed(2.0);
        }
        setState(() {});
      });
  }

  @override
  void didUpdateWidget(covariant VideoBackground oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.play) {
      _videoController.play();
    } else {
      _videoController.pause();
    }
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _videoController.value.isInitialized
        ? FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: _videoController.value.size.width,
              height: _videoController.value.size.height,
              child: VideoPlayer(_videoController),
            ),
          )
        : const SizedBox();
  }
}
