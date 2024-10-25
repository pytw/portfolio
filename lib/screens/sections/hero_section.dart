import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website/theme/theme.dart';
import 'package:portfolio_website/widgets/custom_button.dart';
import 'package:portfolio_website/widgets/custom_header.dart';
import 'package:portfolio_website/helpers/responsive_helper.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HeroSection extends StatelessWidget {
  final Function(String section) onSectionSelected;
  const HeroSection({super.key, required this.onSectionSelected});

  get welcome => getGreetingMessage().split(" ");
  get mediumHeadingFontSize => AppSizes.headingFontSize.sp;
  get headingFontSize => 64.sp;
  double get smallSpaceWidth => AppSizes.smallSpaceBtwItems.w;

  @override
  Widget build(BuildContext context) {
    double largeSpaceHeight = AppSizes.largeSpaceBtwItems.h;
    double mediumSpaceWidth = AppSizes.mediumSpaceBtwItems.w;
    double smallSpaceHeight = AppSizes.smallSpaceBtwItems.h;

    // Check screen type
    final screenType = getScreenType(context);

    return screenType == ScreenType.mobile
        ? Column(
      children: buildHeroContent(
        context,
        smallSpaceHeight,
        mediumSpaceWidth,
        largeSpaceHeight,
        screenType,
      ),
    )
        : Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.paddingMedium.w,
              vertical: AppSizes.paddingMedium.h,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: buildHeroContent(
                context,
                smallSpaceHeight,
                mediumSpaceWidth,
                largeSpaceHeight,
                screenType,
              ),
            ),
          ),
        ),
        const Expanded(
          child: Center(child: CircularImage()),
        ),
      ],
    );
  }

  List<Widget> buildHeroContent(BuildContext context, double smallSpaceHeight,
      double mediumSpaceWidth, double largeSpaceHeight, ScreenType screenType) {
    return [
      CustomHeader(
        titleText: "${welcome.elementAt(0)} ",
        titleColor: Theme.of(context).primaryColor,
        titleLetterSpacing: 2.w,
        subtitleText: "${welcome.elementAt(1)} ${welcome.elementAt(2)}!",
        subtitleColor: Theme.of(context).colorScheme.onPrimary,
        subTitleLetterSpacing: 2.w,
        headingFontSize: mediumHeadingFontSize,
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
      ),
      SizedBox(height: smallSpaceHeight),
      Text(
        "Your aspiring Software or UI/UX developer",
        style: TextStyle(
          color: Theme.of(context).colorScheme.onSecondary,
          fontSize: AppSizes.mediumFontSize.sp,
        ),
      ),
      SizedBox(height: largeSpaceHeight),
      Row(
        children: [
          CustomButton(
            onPressed: () {},
            label: "Download Resume",
            textStyle: AppStyles.linkButtonStyle,
            borderColor: Theme.of(context).colorScheme.onPrimary,
            borderWidth: 2,
            hoverBorderColor: Theme.of(context).primaryColor,
            clickBorderColor: Theme.of(context).primaryColor,
            hoverEffects: const [HoverEffect.borderColor],
            clickEffects: const [ClickEffect.borderColor],
          ),
          SizedBox(width: mediumSpaceWidth),
          CustomButton(
            onPressed: () {
              onSectionSelected("Projects");
            },
            label: "See Projects",
            textStyle: AppStyles.primaryButtonStyle,
            backgroundColor: Theme.of(context).primaryColor,
            hoverEffects: const [HoverEffect.scale],
          ),
        ],
      ),
      SizedBox(height: smallSpaceHeight),
      buildSocialIcons(context, smallSpaceWidth),
    ];
  }

  Widget buildSocialIcons(BuildContext context, double smallSpaceWidth) {
    return Row(
      children: [
        IconButton(
          onPressed: () => _launchUrl('https://www.linkedin.com/in/pyapril1507'),
          icon: const Icon(FontAwesomeIcons.linkedin),
        ),
        SizedBox(width: smallSpaceWidth),
        IconButton(
          onPressed: () => _launchUrl('https://www.github.com/pyapril15'),
          icon: const Icon(FontAwesomeIcons.github),
        ),
        SizedBox(width: smallSpaceWidth),
        IconButton(
          onPressed: () => _launchUrl('https://www.x.com/pyapril15'),
          icon: const Icon(FontAwesomeIcons.twitter),
        ),
        SizedBox(width: smallSpaceWidth),
        IconButton(
          onPressed: () => _launchUrl('https://www.instagram.com/__pyapril15.py__'),
          icon: const Icon(FontAwesomeIcons.instagram),
        ),
        SizedBox(width: smallSpaceWidth),
        IconButton(
          onPressed: () => _launchUrl('https://www.discord.com/pyapril15'),
          icon: const Icon(FontAwesomeIcons.discord),
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

  void _launchUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    }
  }
}

class CircularImage extends StatelessWidget {
  const CircularImage({super.key});

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
            errorBuilder: (context, error, stackTrace) =>
                Icon(Icons.error, size: 64.sp),
          ),
        ),
      ),
    );
  }
}
