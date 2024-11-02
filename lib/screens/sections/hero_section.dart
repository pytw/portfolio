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
double mLargeParaFontSize = 102.sp;

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
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: _buildDesktopTabletLayout(context),
    );
  }

  // Layout for desktop and tablet screens
  Widget _buildDesktopTabletLayout(BuildContext context) {
    final ScreenType screenType = getScreenType(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: screenType==ScreenType.mobile?2:1,
          child: _IntroSection(),
        ),
        SizedBox(width: 30.w),
        const Expanded(
          flex: 1,
          child: Center(
            child: _CircularImage(),
          ),
        ),
      ],
    );
  }
}

class _IntroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> welcome = _getGreetingMessage().split(" ");
    final ScreenType screenType = getScreenType(context);

    // common
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomHeader(
          titleText: "Hey ",
          titleColor: Theme.of(context).primaryColor,
          titleLetterSpacing: 2.w,
          subtitleText: "${welcome[0]} ${welcome[1]} !",
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
          subtitleText: "Praveen Yadav",
          subtitleColor: Theme.of(context).primaryColor,
          subTitleLetterSpacing: 2.w,
          headingFontSize: headingFontSize,
          alignment: Alignment.center,
        ),
        SizedBox(height: smallSpaceHeight),
        Text(
          "Aspiring Software & UI/UX Developer",
          style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary,
              fontSize: paraFontSize),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: largeSpaceHeight),
        _buildActionButtons(
            context, largeSpaceWidth, smallSpaceHeight, paraFontSize),
        SizedBox(height: smallSpaceHeight),
        _buildSocialIcons(smallSpaceWidth, iconSize),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context, double spacing,
      double runSpacing, double fontSize) {
    return Wrap(
      spacing: spacing,
      runSpacing: runSpacing,
      alignment: WrapAlignment.center,
      children: [
        CustomButton(
          onPressed: () => _showDownloadOptions(context),
          label: "Download Resume",
          textStyle: TextStyle(
              fontSize: fontSize,
              color: Theme.of(context).colorScheme.onPrimary),
          borderColor: Theme.of(context).colorScheme.onPrimary,
          borderWidth: 2,
        ),
        CustomButton(
          onPressed: () {
            // Add navigation to Projects
          },
          label: "See Projects",
          textStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ],
    );
  }

  Widget _buildSocialIcons(double spacing, double iconSize) {
    return Wrap(
      spacing: spacing,
      alignment: WrapAlignment.center,
      children: [
        _buildSocialIconButton(FontAwesomeIcons.linkedin,
            'https://www.linkedin.com/in/pyapril1507', iconSize),
        _buildSocialIconButton(FontAwesomeIcons.github,
            'https://www.github.com/pyapril15', iconSize),
        _buildSocialIconButton(
            FontAwesomeIcons.twitter, 'https://www.x.com/pyapril15', iconSize),
        _buildSocialIconButton(FontAwesomeIcons.instagram,
            'https://www.instagram.com/__pyapril15.py__', iconSize),
      ],
    );
  }

  Widget _buildSocialIconButton(IconData icon, String url, double iconSize) {
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

  String _getGreetingMessage() {
    final hour = DateTime.now().hour;
    if (hour < 12) return "Good Morning";
    if (hour < 17) return "Good Afternoon";
    return "Good Evening";
  }

  void _showDownloadOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView(
          padding: EdgeInsets.all(20.w),
          shrinkWrap: true,
          children: [
            _buildDownloadOption(context, "PDF"),
            _buildDownloadOption(context, "DOCX"),
            _buildDownloadOption(context, "Image"),
          ],
        );
      },
    );
  }

  Widget _buildDownloadOption(BuildContext context, String format) {
    return ListTile(
      title: Text("Download as $format"),
      onTap: () {
        Navigator.pop(context);
        // Call download functionality here
      },
    );
  }
}

class _CircularImage extends StatelessWidget {
  const _CircularImage();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          BoxConstraints(maxHeight: (ScreenUtil().screenHeight).h),
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
    );
  }
}
