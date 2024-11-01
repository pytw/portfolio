import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double horizontalPadding = screenWidth > 800 ? 80.0 : 20.0;
    double maxContentWidth = screenWidth > 600 ? 1200 : double.infinity;

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 40),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxContentWidth),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 20),
            _ContactContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Let's get to know each other",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Theme.of(context).primaryColor,
              ),
        ),
        Text(
          'Get in touch for collaborations or just a friendly hello!',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
      ],
    );
  }
}

class _ContactContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return screenWidth > 600
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(flex: 1, child: _ContactImage()),
              const SizedBox(width: 40),
              Flexible(flex: 1, child: _ContactDetails()),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ContactImage(),
              const SizedBox(height: 20),
              _ContactDetails(),
            ],
          );
  }
}

class _ContactImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: SvgPicture.asset(
        'assets/images/connect.svg',
        fit: BoxFit.contain,
      ),
    );
  }
}

class _ContactDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Thank you for visiting! Feel free to reach out whether you have a project in mind or just want to say hi. Let's connect!",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                height: 1.5,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
        ),
        const SizedBox(height: 20),
        Text(
          "Contact me:",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 10),
        _EmailButton(),
        const SizedBox(height: 20),
        _SocialLinks(),
      ],
    );
  }
}

class _EmailButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => launchUrlString('mailto:praveen885127@gmail.com'),
      icon: Icon(FontAwesomeIcons.envelope,
          color: Theme.of(context).primaryColor),
      label: Text(
        'praveen885127@gmail.com',
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}

class _SocialLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: 16,
      runSpacing: 10,
      children: [
        _SocialButton(
          label: 'GitHub',
          icon: FontAwesomeIcons.github,
          url: 'https://www.github.com/pyapril15',
        ),
        _SocialButton(
          label: 'LinkedIn',
          icon: FontAwesomeIcons.linkedin,
          url: 'https://www.linkedin.com/in/pyapril15',
        ),
        _SocialButton(
          label: 'Twitter',
          icon: FontAwesomeIcons.twitter,
          url: 'https://www.twitter.com/pyapril15',
        ),
        _SocialButton(
          label: 'Discord',
          icon: FontAwesomeIcons.discord,
          url: 'https://www.discord.com/pyapril15',
        ),
        _SocialButton(
          label: 'Instagram',
          icon: FontAwesomeIcons.instagram,
          url: 'https://www.instagram.com/__pyapril15.py__',
        ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final String url;

  const _SocialButton({
    required this.label,
    required this.icon,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => launchUrlString(url),
      icon: Icon(icon, color: Theme.of(context).primaryColor),
      label:
          Text(label, style: TextStyle(color: Theme.of(context).primaryColor)),
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      ),
    );
  }
}
