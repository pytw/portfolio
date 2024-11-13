import 'package:flutter/material.dart';
import 'package:portfolio_website/widgets/custom_header.dart';
import 'package:portfolio_website/widgets/simple_custom_button.dart';
import 'package:portfolio_website/widgets/effect.dart';

class AboutSection extends StatelessWidget {
  final GlobalKey aboutKey;

  const AboutSection(this.aboutKey, {super.key});

  static const double horizontalPadding = 16.0;
  static const double verticalPadding = 16.0;
  static const double spacing = 8.0;
  static const double screenBreakPoint = 800.0;

  static const String aboutImage = "assets/images/about-me.png";
  static const String aboutMeText = """
        Hello! I’m Praveen Yadav, an enthusiastic undergraduate currently pursuing my Bachelor of Computer Applications (BCA). My passion lies in software development, where I strive to master both front-end and back-end technologies. I am driven by a love for coding and a desire to create innovative solutions that address real-world challenges.
        \nI thrive in collaborative environments, where exchanging ideas and learning from others fuels my creativity and problem-solving skills. I’m always eager to explore new technologies and refine my abilities, as I believe in the power of continuous growth in this ever-evolving field.
        """;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: Column(
        key: aboutKey,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildAboutHeader(context),
          const SizedBox(height: (spacing * 3)),
          _buildAboutContent(context),
          const SizedBox(height: spacing),
          _buildAboutMeBtn(context),
        ],
      ),
    );
  }

  Widget _buildAboutContent(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= screenBreakPoint) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(child: _buildAboutMeText(context)),
          const SizedBox(width: (spacing * 2)),
          Flexible(child: _buildAboutMeImage()),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildAboutMeImage(),
          const SizedBox(height: spacing),
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
      child: Image.asset(AboutSection.aboutImage, fit: BoxFit.contain));
}

Widget _buildAboutMeText(BuildContext context) {
  return Semantics(
    label: 'About me section containing personal details',
    child: Text(
      AboutSection.aboutMeText,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSecondary,
            letterSpacing: 0.8,
            height: 2.5,
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
