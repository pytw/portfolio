import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website/animations/custom_animation.dart';
import 'package:portfolio_website/widgets/custom_header.dart';
import 'package:portfolio_website/widgets/simple_custom_button.dart';
import 'package:portfolio_website/widgets/effect.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'dart:html' as html;

class HeroicSection extends StatelessWidget {
  final GlobalKey<State<StatefulWidget>> heroicKey;

  const HeroicSection(this.heroicKey, {super.key});

  // Constants
  static const double horizontalPadding = 16.0;
  static const double verticalPadding = 16.0;
  static const double spacing = 8.0;
  static const double iconSize = 24.0;
  static const double largeScreenBreakpoint = 1200.0;
  static const double mediumScreenBreakpoint = 800.0;
  static const double borderRadius = 8.0;

  // Text Constants
  static const String heroicImage = 'assets/images/pyapril15.png';
  static const String placeholderImage = 'assets/images/placeholder.png';
  static const String profession = 'Aspiring Software & UI/UX Developer';

  static const List<Map<String, dynamic>> socialMedia = [
    {
      'name': 'Github',
      'icon': FontAwesomeIcons.github,
      'url': 'https://www.github.com/pyapril15',
    },
    {
      'name': 'LinkedIn',
      'icon': FontAwesomeIcons.linkedin,
      'url': 'https://www.linkedin.com/in/pyapril1507',
    },
    {
      'name': 'Instagram',
      'icon': FontAwesomeIcons.instagram,
      'url': 'https://www.instagram.com/__pyapril15.py__',
    },
  ];

  static const Map<String, String> downloadLinks = {
    'PDF':
        'https://firebasestorage.googleapis.com/v0/b/portfolio-1952e.appspot.com/o/resume.pdf?alt=media&token=1f10e879-5234-4ab4-ab7c-c272e81f38fb',
    'DOCX':
        'https://firebasestorage.googleapis.com/v0/b/portfolio-1952e.appspot.com/o/resume.docx?alt=media&token=6bc02eaa-f332-46b0-b34a-fb51aeb2aa42',
    'PNG':
        'https://firebasestorage.googleapis.com/v0/b/portfolio-1952e.appspot.com/o/resume.png?alt=media&token=09985770-9968-4df8-8508-2942cd18935b',
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: _buildHeroicContent(context),
    );
  }

  Widget _buildHeroicContent(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= largeScreenBreakpoint) {
      return Row(
        key: heroicKey,
        children: [
          Flexible(
            child: Row(
              children: [
                _buildHeroicDetails(context),
              ],
            ),
          ),
          const SizedBox(width: (spacing * 2)),
          Flexible(child: _buildHeroicImage(context, isLargeScreen: true)),
        ],
      );
    } else if (screenWidth >= mediumScreenBreakpoint) {
      return Row(
        key: heroicKey,
        children: [
          Flexible(
            child: Row(
              children: [
                _buildHeroicDetails(context),
              ],
            ),
          ),
          const SizedBox(height: spacing),
          Flexible(child: _buildHeroicImage(context, isMediumScreen: true)),
        ],
      );
    } else {
      return Column(
        key: heroicKey,
        children: [
          _buildHeroicImage(context, isSmallScreen: true),
          const SizedBox(height: spacing),
          Center(child: _buildHeroicDetails(context)),
        ],
      );
    }
  }
}

Widget _buildHeroicDetails(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const _BuildWishing(),
      const SizedBox(height: HeroicSection.spacing),
      _buildWelcome(context),
      const SizedBox(height: HeroicSection.spacing),
      _buildProfession(context),
      const SizedBox(height: HeroicSection.spacing * 6),
      _buildActionButtons(context),
      const SizedBox(height: HeroicSection.spacing * 2),
      _buildSocialIcons(),
    ],
  );
}

class _BuildWishing extends StatelessWidget {
  const _BuildWishing();

  String _getGreetingMessage() {
    final hour = DateTime.now().hour;
    if (hour < 12) return "Good Morning";
    if (hour < 17) return "Good Afternoon";
    return "Good Evening";
  }

  @override
  Widget build(BuildContext context) {
    List<String> welcome = _getGreetingMessage().split(" ");

    return CustomHeader(
      titleText: 'Hey ',
      titleStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).primaryColor,
          ),
      subtitleText: '${welcome[0]} ${welcome[1]} !',
      subtitleStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
    );
  }
}

Widget _buildWelcome(BuildContext context) {
  return CustomHeader(
    titleText: "I'm ",
    titleStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
    subtitleText: 'Praveen Yadav',
    subtitleStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
          color: Theme.of(context).primaryColor,
        ),
    isTyping: true,
  );
}

Widget _buildProfession(BuildContext context) {
  return Text(
    HeroicSection.profession,
    style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: Theme.of(context).colorScheme.onSecondary,
        ),
  );
}

Widget _buildActionButtons(BuildContext context) {
  return Wrap(
    spacing: HeroicSection.spacing * 2,
    runSpacing: HeroicSection.spacing,
    alignment: WrapAlignment.center,
    children: [
      Effect(
        scale: 1.05,
        hoverOpacity: 0.9,
        builder: (isHovered, isClick, scale, opacity) => Tooltip(
          message: "Download Resume",
          child: SimpleCustomButton(
            onPressed: () => _showDownloadOptions(context),
            label: "Download Resume",
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            borderColor: Colors.white,
            borderWidth: 2,
          ),
        ),
      ),
      Effect(
        scale: 1.1,
        builder: (isHovered, isClicked, scale, opacity) => Tooltip(
          message: "See Projects",
          child: SimpleCustomButton(
            onPressed: () => _showDownloadOptions(context),
            label: "See Projects",
          ),
        ),
      ),
    ],
  );
}

Widget _buildSocialIcons() {
  return Wrap(
      spacing: HeroicSection.spacing * 2,
      runSpacing: HeroicSection.spacing,
      alignment: WrapAlignment.center,
      children: HeroicSection.socialMedia.map((social) {
        return _buildSocialIconButton(
            social['name'], social['icon'], social['url']);
      }).toList());
}

Widget _buildSocialIconButton(String name, IconData icon, String url) {
  return Effect(
    scale: 1.2,
    rotationAngle: 0.3,
    builder: (isHovered, isClicked, scale, opacity) => IconButton(
      onPressed: () async {
        if (await canLaunchUrlString(url)) {
          await launchUrlString(url);
        }
      },
      icon: Icon(
        icon,
        color: isHovered
            ? name == 'Instagram'
                ? Colors.red
                : name == 'Github'
                    ? Colors.blue
                    : Colors.white
            : Colors.white,
      ),
      iconSize: HeroicSection.iconSize,
      tooltip: name,
    ),
  );
}

void _showDownloadOptions(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return ListView(
          padding: const EdgeInsets.all(20),
          shrinkWrap: true,
          children: HeroicSection.downloadLinks.keys.map((format) {
            return _buildDownloadOption(context, format);
          }).toList());
    },
  );
}

Widget _buildDownloadOption(BuildContext context, String format) {
  return ListTile(
    title: Text("Download as $format"),
    onTap: () {
      Navigator.pop(context);
      final url = HeroicSection.downloadLinks[format];
      format = format.toLowerCase();
      if (url != null) {
        _startDownload(context, url, "praveen_yadav_resume.$format");
      }
    },
  );
}

void _startDownload(BuildContext context, String url, String fileName) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('Start Downloading...')),
  );

  Future.delayed(const Duration(seconds: 1), () {
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Downloading...')),
    );
  });

  try {
    downloadFileWeb(url, fileName);

    Future.delayed(const Duration(seconds: 2), () {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Download Complete')),
      );
    });
  } catch (e) {
    Future.delayed(const Duration(seconds: 2), () {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Download Failed')),
      );
    });
  }
}

void downloadFileWeb(String url, String fileName) {
  html.AnchorElement anchorElement = html.AnchorElement(href: url);
  anchorElement.download = fileName;
  anchorElement.click();
}

Widget _buildHeroicImage(
  BuildContext context, {
  bool isSmallScreen = false,
  bool isMediumScreen = false,
  bool isLargeScreen = false,
}) {
  double height = MediaQuery.of(context).size.height;

  return CustomAnimation(
    animationType: AnimationType.fadeAndSlide,
    begin: const Offset(0.0, -0.5),
    duration: const Duration(seconds: 1),
    delay: const Duration(milliseconds: 100),
    curve: Curves.easeOut,
    child: Container(
      width: double.infinity,
      constraints: BoxConstraints(
        maxHeight: isSmallScreen
            ? height * 0.5
            : isMediumScreen
                ? height * 0.5
                : height * 0.6,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.blue.shade800],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(HeroicSection.borderRadius * 2),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: HeroicSection.borderRadius,
            spreadRadius: 2,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Effect(
        scale: 1.05,
        hoverOpacity: 0.95,
        fadeOnHover: true,
        builder: (_, __, ___, ____) => ClipRRect(
          borderRadius: BorderRadius.circular(HeroicSection.borderRadius * 2),
          child: Image.asset(
            HeroicSection.heroicImage,
            fit: BoxFit.contain,
            errorBuilder: (_, __, ___) => Image.asset(
              HeroicSection.placeholderImage,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    ),
  );
}
