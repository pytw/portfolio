import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website/theme/theme.dart';
import 'package:portfolio_website/widgets/custom_button.dart';
import 'package:portfolio_website/widgets/custom_header.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HeroSection extends StatelessWidget {
  final Function(String section) onSectionSelected;
  const HeroSection({super.key, required this.onSectionSelected});

  @override
  Widget build(BuildContext context) {
    List<String> welcome = getGreetingMessage().split(" ");

    double mediumHeadingFontSize = AppSizes.headingFontSize.sp;
    double headingFontSize = 64.sp;

    double largeSpaceHeight = AppSizes.largeSpaceBtwItems.h;
    double mediumSpaceWidth = AppSizes.mediumSpaceBtwItems.w;
    double smallSpaceWidth = AppSizes.smallSpaceBtwItems.w;
    double smallSpaceHeight = AppSizes.smallSpaceBtwItems.h;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
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
                  children: [
                    CustomHeader(
                      titleText: "${welcome.elementAt(0)} ",
                      titleColor: Theme.of(context).primaryColor,
                      titleLetterSpacing: 2.w,
                      subtitleText:
                          "${welcome.elementAt(1)} ${welcome.elementAt(2)}!",
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
                          textStyle: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary),
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
                          textStyle: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                          backgroundColor: Theme.of(context).primaryColor,
                          hoverEffects: const [HoverEffect.scale],
                        ),
                      ],
                    ),
                    SizedBox(height: smallSpaceHeight),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            launchUrlString(
                                'https://www.linkedin.com/in/pyapril1507');
                          },
                          icon: const Icon(FontAwesomeIcons.linkedin),
                        ),
                        SizedBox(width: smallSpaceWidth),
                        IconButton(
                          onPressed: () {
                            launchUrlString('https://www.github.com/pyapril15');
                          },
                          icon: const Icon(FontAwesomeIcons.github),
                        ),
                        SizedBox(width: smallSpaceWidth),
                        IconButton(
                          onPressed: () {
                            launchUrlString('https://www.x.com/pyapril15');
                          },
                          icon: const Icon(FontAwesomeIcons.twitter),
                        ),
                        SizedBox(width: smallSpaceWidth),
                        IconButton(
                          onPressed: () {
                            launchUrlString(
                                'https://www.instagram.com/__pyapril15.py__');
                          },
                          icon: const Icon(FontAwesomeIcons.instagram),
                        ),
                        SizedBox(width: smallSpaceWidth),
                        IconButton(
                          onPressed: () {
                            launchUrlString(
                                'https://www.discord.com/pyapril15');
                          },
                          icon: const Icon(FontAwesomeIcons.discord),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Right side: Circular Image with Decoration
            const Expanded(
              child: Center(child: CircularImage()),
            ),
          ],
        );
      },
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
        color: Colors.white, // Background color behind the image
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: AppSizes.borderRadiusMedium,
            spreadRadius: 2,
            offset: Offset(0, 5), // Shadow position
          ),
        ],
      ),
      child: FittedBox(
        child: ClipOval(
          child: Image.asset(
            'assets/images/pyapril15.png', // Replace with your image path
            fit: BoxFit.cover, // Ensure the image covers the circle
          ),
        ),
      ),
    );
  }
}
