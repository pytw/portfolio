import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website/helpers/responsive_helper.dart';
import 'package:portfolio_website/theme/theme.dart';
import 'package:portfolio_website/widgets/custom_button.dart';
import 'package:portfolio_website/widgets/custom_header.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../download_manager.dart';

// Constants for Mobile and Desktop layouts
double mSmallSpaceHeight = 2.h,
    mSmallSpaceWidth = 4.w,
    mLargeSpaceWidth = 24.w,
    mLargeSpaceHeight = 28.h;
double mSmallParaFontSize = 40.sp,
    mMediumParaFontSize = 64.sp,
    mLargeParaFontSize = 112.sp,
    mIconSize = 52.sp;
double dSmallSpaceHeight = 10.h,
    dSmallSpaceWidth = 8.w,
    dLargeSpaceWidth = 16.w,
    dLargeSpaceHeight = 48.h;
double dSmallParaFontSize = 20.sp,
    dMediumParaFontSize = 32.sp,
    dLargeParaFontSize = 56.sp,
    dIconSize = 32.sp;

class HeroSection extends StatelessWidget {
  final Function(String section) onSectionSelected;

  const HeroSection({super.key, required this.onSectionSelected});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: HeroSectionDesktopTablet(onSectionSelected: onSectionSelected),
      ),
    );
  }
}

// Desktop/Tablet Layout Widget
class HeroSectionDesktopTablet extends StatelessWidget {
  final Function(String section) onSectionSelected;

  const HeroSectionDesktopTablet({super.key, required this.onSectionSelected});

  @override
  Widget build(BuildContext context) {
    final ScreenType screenType = getScreenType(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            flex: screenType == ScreenType.mobile ? 2 : 1,
            child: Center(
                child: _IntroSection(onSectionSelected: onSectionSelected))),
        const Expanded(
            flex: 1, child: Center(child: CircularImage(isDesktop: true))),
      ],
    );
  }
}

class _IntroSection extends StatefulWidget {
  final Function(String section) onSectionSelected;

  const _IntroSection({required this.onSectionSelected});

  @override
  State<_IntroSection> createState() => _IntroSectionState();
}

class _IntroSectionState extends State<_IntroSection> {
  DownloadState? downloadState;
  final Map<String, String> downloadLinks = {
    'PDF': 'assets/documents/resume/resume.pdf',
    'DOCX': 'assets/documents/resume/resume.docx',
    'Image': 'assets/documents/resume/resume.png',
  };

  Future<void> startDownload(String format) async {
    String? filepath = downloadLinks[format];
    setState(() => downloadState = DownloadState.started);
    final result = await downloadResume(context, filepath!);
    setState(() => downloadState = result);

    if (result == DownloadState.completed || result == DownloadState.failed) {
      await Future.delayed(const Duration(seconds: 2));
      setState(() => downloadState = null);
    }
  }

  void _showDownloadOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: downloadLinks.keys.map((String format) {
            return ListTile(
              title: Text(format),
              onTap: () {
                startDownload(format);
                Navigator.pop(context);
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ScreenType screenType = getScreenType(context);
    List<String> welcome = getGreetingMessage().split(" ");
    double smallSpaceHeight =
        screenType == ScreenType.mobile ? mSmallSpaceHeight : dSmallSpaceHeight;
    double largeSpaceHeight =
        screenType == ScreenType.mobile ? mLargeSpaceHeight : dLargeSpaceHeight;
    double smallSpaceWidth =
        screenType == ScreenType.mobile ? mSmallSpaceWidth : dSmallSpaceWidth;
    double largeSpaceWidth =
        screenType == ScreenType.mobile ? mLargeSpaceWidth : dLargeSpaceWidth;
    double paraFontSize = screenType == ScreenType.mobile
        ? mSmallParaFontSize
        : dSmallParaFontSize;
    double headingFontSize = screenType == ScreenType.mobile
        ? mLargeParaFontSize
        : dLargeParaFontSize;
    double subHeadingFontSize = screenType == ScreenType.mobile
        ? mMediumParaFontSize
        : dMediumParaFontSize;
    double iconSize = screenType == ScreenType.mobile ? mIconSize : dIconSize;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomHeader(
          titleText: "${welcome[0]} ",
          titleColor: Theme.of(context).primaryColor,
          titleLetterSpacing: 2.w,
          subtitleText: "${welcome[1]} ${welcome[2]}!",
          subtitleColor: Theme.of(context).colorScheme.onPrimary,
          subTitleLetterSpacing: 2.w,
          headingFontSize: subHeadingFontSize,
          alignment: Alignment.center,
        ),
        SizedBox(height: smallSpaceHeight),
        CustomHeader(
          titleText: "I'm ",
          titleColor: Theme.of(context).colorScheme.onPrimary,
          subtitleText: 'Praveen Yadav',
          subtitleColor: Theme.of(context).primaryColor,
          headingFontSize: headingFontSize,
          alignment: Alignment.center,
        ),
        SizedBox(height: smallSpaceHeight),
        Text(
          "Your aspiring Software or UI/UX developer",
          style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary,
              fontSize: paraFontSize),
        ),
        SizedBox(height: largeSpaceHeight),
        Wrap(
          spacing: smallSpaceWidth,
          children: [
            CustomButton(
              onPressed: () => _showDownloadOptions(context),
              label: "Download Resume",
              textStyle: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: paraFontSize),
              borderColor: Theme.of(context).colorScheme.onPrimary,
              borderWidth: 2,
              hoverBorderColor: Theme.of(context).primaryColor,
              clickBorderColor: Theme.of(context).primaryColor,
            ),
            if (downloadState != null) SizedBox(width: smallSpaceWidth),
            if (downloadState == DownloadState.started)
              const CircularProgressIndicator(),
            if (downloadState == DownloadState.completed)
              Icon(Icons.check_circle, color: Colors.green, size: dIconSize),
            if (downloadState == DownloadState.failed)
              Icon(Icons.error, color: Colors.red, size: dIconSize),
            SizedBox(width: largeSpaceWidth),
            CustomButton(
              onPressed: () => widget.onSectionSelected("Projects"),
              label: "See Projects",
              textStyle: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: paraFontSize),
              backgroundColor: Theme.of(context).primaryColor,
            ),
          ],
        ),
        SizedBox(height: smallSpaceHeight),
        Wrap(
          spacing: smallSpaceWidth,
          children: [
            _buildSocialIconButton(
                icon: FontAwesomeIcons.linkedin,
                url: 'https://www.linkedin.com/in/pyapril1507',
                iconSize: iconSize),
            _buildSocialIconButton(
                icon: FontAwesomeIcons.github,
                url: 'https://www.github.com/pyapril15',
                iconSize: iconSize),
            _buildSocialIconButton(
                icon: FontAwesomeIcons.twitter,
                url: 'https://www.x.com/pyapril15',
                iconSize: iconSize),
            _buildSocialIconButton(
                icon: FontAwesomeIcons.instagram,
                url: 'https://www.instagram.com/__pyapril15.py__',
                iconSize: iconSize),
            _buildSocialIconButton(
                icon: FontAwesomeIcons.discord,
                url: 'https://www.discord.com/pyapril15',
                iconSize: iconSize),
          ],
        ),
      ],
    );
  }

  String getGreetingMessage() {
    final hour = DateTime.now().hour;
    if (hour < 5) return "Hey Good Night";
    if (hour < 12) return "Hey Good Morning";
    if (hour < 17) return "Hey Good Afternoon";
    return hour < 21 ? "Hey Good Evening" : "Hey Good Night";
  }

  Widget _buildSocialIconButton(
      {required IconData icon, required String url, required double iconSize}) {
    return IconButton(
      onPressed: () async {
        if (await canLaunchUrlString(url)) {
          await launchUrlString(url);
        }
      },
      icon: Icon(icon),
      iconSize: iconSize,
    );
  }
}

class CircularImage extends StatelessWidget {
  final bool isDesktop;

  const CircularImage({super.key, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: AppSizes.borderRadiusMedium,
            spreadRadius: 2,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: FittedBox(
        child: ClipOval(
          child: Image.asset(
            'assets/images/pyapril15.png',
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Image.asset(
              'assets/images/placeholder.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
