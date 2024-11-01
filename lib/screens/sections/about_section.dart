import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio_website/widgets/custom_button.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              const Header(),
              const SizedBox(height: 20),
              _buildAboutContent(screenWidth),
              const SizedBox(height: 20),
              const _ConnectButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAboutContent(double screenWidth) {
    return screenWidth > 800
        ? const Row(
            children: [
              Expanded(flex: 1, child: AboutText()),
              SizedBox(width: 20),
              Expanded(flex: 1, child: AboutImage()),
            ],
          )
        : const Column(
            children: [
              AboutText(),
              SizedBox(height: 20),
              AboutImage(),
            ],
          );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "About Me",
      style: Theme.of(context).textTheme.headlineMedium,
      textAlign: TextAlign.center,
    );
  }
}

class AboutText extends StatelessWidget {
  const AboutText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "I am a dedicated undergraduate with an interest in full-stack development.",
      style: Theme.of(context).textTheme.bodyLarge,
      textAlign: TextAlign.center,
    );
  }
}

class AboutImage extends StatelessWidget {
  const AboutImage({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: SvgPicture.asset('assets/images/about-me.svg'),
    );
  }
}

class _ConnectButton extends StatelessWidget {
  const _ConnectButton();

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      label: "Connect with Me",
      onPressed: () {},
    );
  }
}
