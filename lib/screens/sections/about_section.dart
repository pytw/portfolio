import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio_website/widgets/custom_button.dart';
import 'package:portfolio_website/widgets/custom_header.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenUtil().screenWidth;

    return Padding(
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

class AboutText extends StatelessWidget {
  const AboutText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Hello, I'm Praveen Yadav, a dedicated undergraduate student with a profound interest in web development. Currently pursuing my Bachelor of Computer Applications (BCA) degree, my goal is to master both front-end and back-end technologies, aiming to become a versatile and skilled developer. I thrive on the creativity and problem-solving that web development offers. Let's connect and exchange ideas in the dynamic world of web development. I'm always open to new connections and exciting opportunities. Feel free to reach out, and let's embark on this journey together.",
      style: Theme.of(context).textTheme.bodyMedium,
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
