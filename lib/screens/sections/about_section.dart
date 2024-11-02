import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio_website/widgets/custom_button.dart';
import 'package:portfolio_website/widgets/custom_header.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  // Constants for padding, spacing, and breakpoints
  static const double horizontalPadding = 16.0;
  static const double verticalPadding = 16.0;
  static const double spacing = 8.0;
  static const double largeScreenBreakpoint = 1200.0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenUtil().screenWidth;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: Column(
        children: [
          const _BuilderHeader(),
          const SizedBox(height: spacing * 3), // Adjusted spacing
          _buildAboutContent(screenWidth),
          const SizedBox(height: spacing), // Spacing between content and button
          const _ConnectButton(),
        ],
      ),
    );
  }

  Widget _buildAboutContent(double screenWidth) {
    if (screenWidth >= largeScreenBreakpoint) {
      // Layout for large screens (desktop)
      return const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(flex: 1, child: _AboutText()),
          SizedBox(width: spacing * 2), // Adjusted spacing between columns
          Flexible(flex: 1, child: _AboutImage()),
        ],
      );
    } else {
      // Layout for medium and small screens (tablet and mobile)
      return const Column(
        children: [
          _AboutText(),
          SizedBox(height: spacing), // Spacing between text and image
          _AboutImage(),
        ],
      );
    }
  }
}

class _BuilderHeader extends StatelessWidget {
  const _BuilderHeader();

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
    return Text(
      """
      Hello! I’m Praveen Yadav, an enthusiastic undergraduate currently pursuing my Bachelor of Computer Applications (BCA). My passion lies in software development, where I strive to master both front-end and back-end technologies. I am driven by a love for coding and a desire to create innovative solutions that address real-world challenges.
      \nI thrive in collaborative environments, where exchanging ideas and learning from others fuels my creativity and problem-solving skills. I’m always eager to explore new technologies and refine my abilities, as I believe in the power of continuous growth in this ever-evolving field.
      \nIf you're interested in connecting or discussing exciting opportunities in software development, I would love to hear from you! Let’s inspire each other and make a meaningful impact in this dynamic industry together. Feel free to reach out!
      """,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSecondary,
            letterSpacing: 1,
            height: 2,
          ),
    );
  }
}

class _AboutImage extends StatelessWidget {
  const _AboutImage();

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/images/about-me.svg');
  }
}

class _ConnectButton extends StatelessWidget {
  const _ConnectButton();

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      label: "Connect with Me",
      borderColor: Theme.of(context).colorScheme.onPrimary,
      clickBorderColor: Theme.of(context).primaryColor,
      hoverLabelColor: Theme.of(context).primaryColor,
      hoverEffects: const [
        HoverEffect.labelColor
      ],
      clickEffects: const [
        ClickEffect.borderColor
      ],
      onPressed: () {
        // Implement your connection logic here
      },
    );
  }
}
