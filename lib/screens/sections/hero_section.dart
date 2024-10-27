import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website/helpers/responsive_helper.dart';
import 'package:portfolio_website/theme/theme.dart';
import 'package:portfolio_website/widgets/custom_button.dart';
import 'package:portfolio_website/widgets/custom_header.dart';
import 'package:url_launcher/url_launcher_string.dart';

// mobile constants
double mSmallSpaceHeight = 2.h;
double mSmallSpaceWidth = 4.w;
double mLargeSpaceWidth = 24.w;
double mLargeSpaceHeight = 28.h;

double mSmallParaFontSize = 40.sp;
double mMediumParaFontSize = 64.sp;
double mLargeParaFontSize = 112.sp;

double mIconSize = 52.sp;

// desktop and tablet constants
double dSmallSpaceHeight = 10.h;
double dSmallSpaceWidth = 8.w;
double dLargeSpaceWidth = 16.w;
double dLargeSpaceHeight = 48.h;

double dSmallParaFontSize = 20.sp;
double dMediumParaFontSize = 32.sp;
double dLargeParaFontSize = 56.sp;

double dIconSize = 32.sp;

class HeroSection extends StatelessWidget {
  final Function(String section) onSectionSelected;
  const HeroSection({super.key, required this.onSectionSelected});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 600) {
          return HeroSectionDesktopTablet(onSectionSelected: onSectionSelected);
        } else {
          return HeroSectionDesktopTablet(onSectionSelected: onSectionSelected);
        }
      },
    );
  }
}

// Widget for Desktop/Tablet Layout
class HeroSectionDesktopTablet extends StatelessWidget {
  final Function(String section) onSectionSelected;
  const HeroSectionDesktopTablet({super.key, required this.onSectionSelected});

  @override
  Widget build(BuildContext context) {
    final ScreenType screenType = getScreenType(context);
    return Row(
      children: [
        Expanded(
          flex: screenType == ScreenType.mobile ? 2 : 1,
          child: _IntroSection(onSectionSelected: onSectionSelected),
        ),
        const Expanded(
          flex: 1,
          child: Center(child: CircularImage(isDesktop: true)),
        ),
      ],
    );
  }
}

class _IntroSection extends StatelessWidget {
  final Function(String section) onSectionSelected;
  const _IntroSection({required this.onSectionSelected});

  @override
  Widget build(BuildContext context) {
    final ScreenType screenType = getScreenType(context);
    List<String> welcome = getGreetingMessage().split(" ");

    // common
    double smallSpaceHeight =
        screenType == ScreenType.mobile ? mSmallSpaceHeight : dSmallSpaceHeight;
    double largeSpaceHeight =
        screenType == ScreenType.mobile ? mLargeSpaceHeight : dLargeSpaceHeight;

    double smallSpaceWidth =
        screenType == ScreenType.mobile ? mSmallSpaceWidth : dSmallSpaceWidth;
    double largeSpaceWidth =
        screenType == ScreenType.mobile ? mLargeSpaceWidth : dLargeSpaceWidth;

    double paraFontSize = screenType == ScreenType.mobile ? mSmallParaFontSize : dSmallParaFontSize;
    double headingFontSize = screenType == ScreenType.mobile ? mLargeParaFontSize : dLargeParaFontSize;
    double subHeadingFontSize = screenType == ScreenType.mobile ? mMediumParaFontSize : dMediumParaFontSize;

    double iconSize = screenType == ScreenType.mobile ? mIconSize : dIconSize;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomHeader(
          titleText: "${welcome.elementAt(0)} ",
          titleColor: Theme.of(context).primaryColor,
          titleLetterSpacing: 2.w,
          subtitleText: "${welcome.elementAt(1)} ${welcome.elementAt(2)}!",
          subtitleColor: Theme.of(context).colorScheme.onPrimary,
          subTitleLetterSpacing: 2.w,
          headingFontSize: subHeadingFontSize,
          alignment: Alignment.center,
        ),
        SizedBox(height: smallSpaceHeight),
        CustomHeader(
          titleText: "I'm ",
          titleColor: Theme.of(context).colorScheme.onPrimary,
          titleLetterSpacing: 2.w,
          subtitleText: 'Praveen Yadav',
          subtitleColor: Theme.of(context).primaryColor,
          subTitleLetterSpacing: 2.w,
          headingFontSize: headingFontSize,
          alignment: Alignment.center,
        ),
        SizedBox(height: smallSpaceHeight),
        Text(
          "Your aspiring Software or UI/UX developer",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary,
            fontSize: paraFontSize,
          ),
        ),
        SizedBox(height: largeSpaceHeight),
        Wrap(
          children: [
            CustomButton(
              onPressed: () async {
                const resumeUrl = 'https://example.com/resume.pdf';
                if (await canLaunchUrlString(resumeUrl)) {
                  await launchUrlString(resumeUrl);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Failed to download resume.')),
                  );
                }
              },
              label: "Download Resume",
              textStyle: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: paraFontSize,
              ),
              borderColor: Theme.of(context).colorScheme.onPrimary,
              borderWidth: 2,
              hoverBorderColor: Theme.of(context).primaryColor,
              clickBorderColor: Theme.of(context).primaryColor,
              hoverEffects: const [HoverEffect.borderColor],
              clickEffects: const [ClickEffect.borderColor],
            ),
            SizedBox(width: largeSpaceWidth),
            CustomButton(
              onPressed: () {
                onSectionSelected("Projects");
              },
              label: "See Projects",
              textStyle: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
                fontSize: paraFontSize,
              ),
              backgroundColor: Theme.of(context).primaryColor,
              hoverEffects: const [HoverEffect.scale],
            ),
          ],
        ),
        SizedBox(height: smallSpaceHeight),
        Wrap(
          children: [
            _buildSocialIconButton(
              icon: FontAwesomeIcons.linkedin,
              url: 'https://www.linkedin.com/in/pyapril1507',
              iconSize: iconSize,
            ),
            SizedBox(width: smallSpaceWidth),
            _buildSocialIconButton(
              icon: FontAwesomeIcons.github,
              url: 'https://www.github.com/pyapril15',
              iconSize: iconSize,
            ),
            SizedBox(width: smallSpaceWidth),
            _buildSocialIconButton(
                icon: FontAwesomeIcons.twitter,
                url: 'https://www.x.com/pyapril15',
                iconSize: iconSize),
            SizedBox(width: smallSpaceWidth),
            _buildSocialIconButton(
              icon: FontAwesomeIcons.instagram,
              url: 'https://www.instagram.com/__pyapril15.py__',
              iconSize: iconSize,
            ),
            SizedBox(width: smallSpaceWidth),
            _buildSocialIconButton(
              icon: FontAwesomeIcons.discord,
              url: 'https://www.discord.com/pyapril15',
              iconSize: iconSize,
            ),
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
    if (hour < 21) return "Hey Good Evening";
    return "Hey Good Night";
  }

  Widget _buildSocialIconButton({
    required IconData icon,
    required String url,
    required double iconSize,
  }) {
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

// CircularImage widget with responsive constraints
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
            errorBuilder: (context, error, stackTrace) => Image.asset(
              'assets/images/placeholder.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
