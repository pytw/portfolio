import 'package:flutter/material.dart';
import 'package:portfolio_website/animations/custom_animation.dart';
import 'package:portfolio_website/constants/app_image.dart';
import 'package:portfolio_website/constants/app_size.dart';
import 'package:portfolio_website/constants/app_text.dart';
import 'package:portfolio_website/widgets/custom_header.dart';
import 'package:portfolio_website/widgets/simple_custom_button.dart';
import 'package:portfolio_website/widgets/effect.dart';

class AboutSection extends StatelessWidget {
  final GlobalKey aboutKey;

  const AboutSection(this.aboutKey, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSize.horizontalPadding,
        vertical: AppSize.verticalPadding,
      ),
      child: Column(
        key: aboutKey,
        children: [
          _buildAboutHeader(context),
          const SizedBox(height: (AppSize.spacing * 3)),
          _buildAboutContent(context),
          const SizedBox(height: AppSize.spacing),
          _buildAboutMeBtn(context),
        ],
      ),
    );
  }

  Widget _buildAboutContent(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= AppSize.screenBreakPoint) {
      return Row(
        children: [
          Flexible(child: _buildAboutMeText(context)),
          const SizedBox(width: (AppSize.spacing * 2)),
          Flexible(child: _buildAboutMeImage()),
        ],
      );
    } else {
      return Column(
        children: [
          _buildAboutMeImage(),
          const SizedBox(height: AppSize.spacing),
          _buildAboutMeText(context),
        ],
      );
    }
  }
}

Widget _buildAboutHeader(BuildContext context) {
  return CustomHeader(
    titleText: 'But wait . ',
    titleStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
    subtitleText: 'Who am I . . .',
    subtitleStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
          color: Theme.of(context).primaryColor,
        ),
  );
}

Widget _buildAboutMeImage() {
  return Semantics(
    label: 'Illustration representing personal development',
    child: CustomAnimation(
        begin: const Offset(0.1, 0),
        child: Image.asset(AppImage.aboutImage, fit: BoxFit.contain)),
  );
}

Widget _buildAboutMeText(BuildContext context) {
  return Semantics(
    label: 'About me section containing personal details',
    child: CustomAnimation(
      begin: const Offset(-0.1, 0),
      child: Text(
        AppText.aboutMeText,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
              letterSpacing: 0.8,
              height: 2.5,
            ),
      ),
    ),
  );
}

Widget _buildAboutMeBtn(BuildContext context) {
  return Semantics(
    label: 'Button to connect with me',
    child: Effect(
      scale: 1.1,
      builder: (isHovered, isClicked, __, ___) => SimpleCustomButton(
        label: "Connect with Me",
        textStyle: TextStyle(
          color: isClicked
              ? Theme.of(context).primaryColor
              : Theme.of(context).colorScheme.onPrimary,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        borderWidth: 1.5,
        borderColor: isHovered
            ? Theme.of(context).primaryColor
            : Theme.of(context).colorScheme.onPrimary,
        onPressed: () {},
      ),
    ),
  );
}
