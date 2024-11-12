import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website/widgets/df.dart';
import 'package:portfolio_website/widgets/custom_header.dart';
import 'package:portfolio_website/widgets/effect.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactSection extends StatelessWidget {
  final GlobalKey contactKey;

  const ContactSection(this.contactKey, {super.key});

  // Constants
  static const double horizontalPadding = 16.0;
  static const double verticalPadding = 16.0;
  static const double spacing = 8.0;
  static const double iconSize = 24.0;
  static const double screenBreakPoint = 800.0;

  // Text Constants
  static const String contactImage = 'assets/images/connect.png';
  static const String email = 'praveen885127@gmail.com';

  static const String introText = """
I’m excited to connect with you! Whether you have a project in mind, questions about web development, or just want to chat, I’m here to help. Feel free to reach out via email or find me on social media platforms like Instagram, Twitter, and LinkedIn.
  """;

  static const String contactMeText = """
For collaboration, insights, or tech discussions, don’t hesitate to reach out through my GitHub or Discord. I value every conversation and look forward to building something amazing together.
  """;

  static const List<Map<String, dynamic>> socialMedia = [
    {
      'name': 'Github',
      'icon': FontAwesomeIcons.github,
      'url': 'https://www.github.com/pyapril15',
    },
    {
      'name': 'LinkedIn',
      'icon': FontAwesomeIcons.linkedin,
      'url': 'https://www.linkedin.com/in/pyapril1507',
    },
    {
      'name': 'Twitter',
      'icon': FontAwesomeIcons.linkedin,
      'url': 'https://www.twitter.com/pyapril15',
    },
    {
      'name': 'Discord',
      'icon': FontAwesomeIcons.linkedin,
      'url': 'https://www.discord.com/pyapril15',
    },
    {
      'name': 'Instagram',
      'icon': FontAwesomeIcons.instagram,
      'url': 'https://www.instagram.com/__pyapril15.py__',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: Column(
        key: contactKey,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildContactHeader(context),
          const SizedBox(height: (spacing * 3)),
          _buildContactContent(context),
        ],
      ),
    );
  }

  Widget _buildContactContent(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= screenBreakPoint) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(child: _buildContactImage()),
          const SizedBox(width: (spacing * 2)),
          Flexible(child: _buildContactDetail(context)),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildContactImage(),
          const SizedBox(height: spacing),
          _buildContactDetail(context),
        ],
      );
    }
  }
}

Widget _buildContactHeader(BuildContext context) {
  return CustomHeader(
    titleText: "Let's ",
    titleStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
          color: Theme.of(context).primaryColor,
        ),
    subtitleText: "get to know each other",
    subtitleStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
  );
}

Widget _buildContactImage() {
  return Semantics(
    label: 'Illustration of connecting with others',
    child: Image.asset(ContactSection.contactImage, fit: BoxFit.contain),
  );
}

Widget _buildContactDetail(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Get in Touch!",
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
            ),
      ),
      Semantics(
        label: ContactSection.introText,
        child: Text(
          ContactSection.introText,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
                letterSpacing: 0.8,
                height: 2.5,
              ),
        ),
      ),
      Text(
        "Contact with Me:",
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
            ),
      ),
      Semantics(
        label: ContactSection.contactMeText,
        child: Text(
          ContactSection.contactMeText,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
                letterSpacing: 0.8,
                height: 2.5,
              ),
        ),
      ),
      _buildEmailBtn(context),
      const SizedBox(height: ContactSection.spacing),
      const Align(child: _BuildSocialButton()),
    ],
  );
}

Widget _buildEmailBtn(BuildContext context) {
  return Effect(
    clickScale: 1.05,
    builder: (isHovered, isClicked, __, ___) => CustomButton(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      label: ContactSection.email,
      textStyle: TextStyle(
          color: isHovered
              ? Theme.of(context).primaryColor
              : Theme.of(context).colorScheme.onPrimary),
      icon: Icon(
        FontAwesomeIcons.mailchimp,
        color: Theme.of(context).primaryColor,
      ),
      showUnderline: isHovered ? true : false,
      underlineColor: Theme.of(context).primaryColor,
      onPressed: () async {
        const emailUrl = 'mailto:${ContactSection.email}';
        if (await canLaunchUrlString(emailUrl)) {
          await launchUrlString(emailUrl);
        } else {
          if (!context.mounted) return;
          _showErrorDialog(context, 'Could not launch email client.');
        }
      },
    ),
  );
}

class _BuildSocialButton extends StatelessWidget {
  const _BuildSocialButton();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: ContactSection.spacing * 2,
      runSpacing: ContactSection.spacing,
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.spaceEvenly,
      children: ContactSection.socialMedia.map((social) {
        return _buildSocialBtn(
          context,
          social['name'],
          social['icon'],
          social['url'],
        );
      }).toList(),
    );
  }

  Widget _buildSocialBtn(
    BuildContext context,
    String name,
    IconData icon,
    String url,
  ) {
    return Effect(
      scale: 1.1,
      rotationAngle: 0.3,
      builder: (isHovered, isClicked, scale, opacity) => Tooltip(
        message: name,
        child: CustomButton(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          label: name,
          icon: Icon(icon),
          showUnderline: isHovered ? true : false,
          underlineColor: Theme.of(context).primaryColor,
          onPressed: () async {
            if (await canLaunchUrlString(url)) {
              await launchUrlString(url);
            }
          },
        ),
      ),
    );
  }
}

void _showErrorDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
