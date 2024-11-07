import 'package:flutter/material.dart';
import 'package:portfolio_website/widgets/custom_button.dart';
import 'package:portfolio_website/widgets/custom_header.dart';

class AboutSection extends StatelessWidget {
  final GlobalKey aboutKey;
  const AboutSection(this.aboutKey, {super.key});

  // Constants for padding, spacing, and breakpoints
  static const double horizontalPadding = 16.0;
  static const double verticalPadding = 16.0;
  static const double spacing = 8.0;
  static const double largeScreenBreakpoint = 1200.0;
  static const double mediumScreenBreakpoint = 800.0;

  static const String aboutImage = "assets/images/about-me.png";
  static const String aboutMeText = """
        Hello! I’m Praveen Yadav, an enthusiastic undergraduate currently pursuing my Bachelor of Computer Applications (BCA). My passion lies in software development, where I strive to master both front-end and back-end technologies. I am driven by a love for coding and a desire to create innovative solutions that address real-world challenges.
        \nI thrive in collaborative environments, where exchanging ideas and learning from others fuels my creativity and problem-solving skills. I’m always eager to explore new technologies and refine my abilities, as I believe in the power of continuous growth in this ever-evolving field.
        """;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: Column(
        key: aboutKey,
        children: [
          const _BuildHeader(),
          const SizedBox(height: (spacing * 3)), // Adjusted spacing
          _buildAboutContent(screenWidth, context),
          const SizedBox(height: spacing), // Spacing between content and button
          const _ConnectButton(),
        ],
      ),
    );
  }

  Widget _buildAboutContent(double screenWidth, BuildContext context) {
    if (screenWidth >= largeScreenBreakpoint) {
      // Large screen layout with row alignment
      return const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(child: _AboutText()),
          SizedBox(width: (spacing * 2)),
          Flexible(
            child: _AboutImage(),
          ),
        ],
      );
    } else if (screenWidth >= mediumScreenBreakpoint) {
      // Medium screen layout with column alignment
      return const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(child: _AboutImage()),
          SizedBox(height: spacing),
          Flexible(child: _AboutText()),
        ],
      );
    } else {
      // Small screen layout with column alignment
      return const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _AboutImage(),
          SizedBox(height: spacing),
          _AboutText(),
        ],
      );
    }
  }
}

class _BuildHeader extends StatelessWidget {
  const _BuildHeader();

  @override
  Widget build(BuildContext context) {
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
}

class _AboutText extends StatelessWidget {
  const _AboutText();

  @override
  Widget build(BuildContext context) {
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
}

class _AboutImage extends StatelessWidget {
  const _AboutImage();

  @override
  Widget build(BuildContext context) {
    return Semantics(
        label: 'Illustration representing personal development',
        child: Image.asset(AboutSection.aboutImage, fit: BoxFit.contain));
  }
}

class _ConnectButton extends StatelessWidget {
  const _ConnectButton();

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Button to connect with me',
      child: CustomButton(
        label: "Connect with Me",
        borderColor: Theme.of(context).colorScheme.onPrimary,
        clickBorderColor: Theme.of(context).primaryColor,
        hoverLabelColor: Theme.of(context).primaryColor,
        hoverEffects: const [
          HoverEffect.labelColor,
        ],
        clickEffects: const [
          ClickEffect.borderColor,
        ],
        onPressed: () {
          // Implement your connection logic here
        },
      ),
    );
  }
}
