import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:portfolio_website/constants/app_image.dart';
import 'package:portfolio_website/constants/app_size.dart';
import 'package:portfolio_website/constants/app_text.dart';
import 'package:portfolio_website/widgets/custom_header.dart';
import 'package:portfolio_website/widgets/simple_custom_button.dart';
import 'package:portfolio_website/widgets/effect.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'dart:html' as html;

class HeroicSection extends StatelessWidget {
  const HeroicSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSize.horizontalPadding,
          vertical: AppSize.verticalPadding),
      child: _buildHeroicContent(context),
    );
  }

  Widget _buildHeroicContent(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= AppSize.screenBreakPoint) {
      return Row(
        children: [
          Flexible(
            child: Row(
              children: [
                _buildHeroicDetails(context),
              ],
            ),
          ),
          const SizedBox(width: (AppSize.spacing * 2)),
          const Flexible(child: HeroicImageContainer()),
        ],
      );
    } else {
      return Column(
        children: [
          const HeroicImageContainer(),
          const SizedBox(height: AppSize.spacing),
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
      const SizedBox(height: AppSize.spacing),
      _buildWelcome(context),
      const SizedBox(height: AppSize.spacing),
      _buildProfession(context),
      const SizedBox(height: AppSize.spacing * 6),
      _buildActionButtons(context),
      const SizedBox(height: AppSize.spacing * 2),
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
    showIcon: true,
  );
}

Widget _buildProfession(BuildContext context) {
  return Text(
    AppText.profession,
    style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: Theme.of(context).colorScheme.onSecondary,
        ),
  );
}

Widget _buildActionButtons(BuildContext context) {
  return Wrap(
    spacing: AppSize.spacing * 2,
    runSpacing: AppSize.spacing,
    alignment: WrapAlignment.center,
    children: [
      Effect(
        scale: 1.1,
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
      spacing: AppSize.spacing * 2,
      runSpacing: AppSize.spacing,
      alignment: WrapAlignment.center,
      children: AppText.socialMedia.map((social) {
        return _buildSocialIconButton(social.name, social.icon, social.url);
      }).toList());
}

Widget _buildSocialIconButton(String name, IconData icon, String url) {
  return Effect(
    scale: 1.1,
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
      iconSize: AppSize.iconSize,
      tooltip: name,
    ),
  );
}

void _showDownloadOptions(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return ListView(
          padding: const EdgeInsets.all(AppSize.horizontalPadding),
          shrinkWrap: true,
          children: AppText.downloadLinks.keys.map((format) {
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
      final url = AppText.downloadLinks[format];
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

class HeroicImageContainer extends StatefulWidget {
  const HeroicImageContainer({super.key});

  @override
  State<HeroicImageContainer> createState() => _HeroicImageContainerState();
}

class _HeroicImageContainerState extends State<HeroicImageContainer> {
  late DateTime currentTime;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    currentTime = DateTime.now();
    _timer = Timer.periodic(const Duration(seconds: 1), _onTimerTick);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _onTimerTick(Timer timer) {
    setState(() {
      currentTime = DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isLargeScreen = screenWidth >= AppSize.screenBreakPoint;
    final gradientCenter = _calculateGradientCenter(currentTime);

    return Container(
      width: isLargeScreen ? screenWidth * 0.3 : double.infinity,
      height: isLargeScreen ? screenWidth * 0.3 : screenWidth * 0.6,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Colors.blue.shade800,
            Colors.blue.shade600,
            Colors.blue.shade400,
            Colors.blue.shade200,
            Colors.blue.shade100,
            Colors.blue.shade50,
          ],
          stops: const [0.1, 0.2, 0.4, 0.6, 0.8, 1],
          center: gradientCenter,
          radius: 1,
        ),
        shape: isLargeScreen ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: isLargeScreen
            ? null
            : BorderRadius.circular(AppSize.borderRadius * 2),
      ),
      child: isLargeScreen
          ? ClipOval(child: _buildImage())
          : ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.borderRadius * 2),
              child: _buildImage(),
            ),
    );
  }

  Alignment _calculateGradientCenter(DateTime time) {
    final hour = time.hour % 12;
    final minute = time.minute;
    final second = time.second;

    final hourAngle = (hour * 30) - 90;
    final minuteAngle = minute * 0.5;
    final secondAngle = second * (0.5 / 60);

    final totalAngle = hourAngle + minuteAngle + secondAngle;

    final radians = totalAngle * pi / 180;

    final x = cos(radians);
    final y = sin(radians);

    return Alignment(x, y);
  }

  Widget _buildImage() {
    return Effect(
      scale: 1.05,
      builder: (_, __, ___, ____) => Image.asset(
        AppImage.heroicImage,
        fit: BoxFit.contain,
        errorBuilder: (_, __, ___) => const Icon(FontAwesomeIcons.user),
      ),
    );
  }
}
