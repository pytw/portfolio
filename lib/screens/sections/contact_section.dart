import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website/animations/custom_animation.dart';
import 'package:portfolio_website/constants/app_image.dart';
import 'package:portfolio_website/constants/app_size.dart';
import 'package:portfolio_website/constants/app_text.dart';
import 'package:portfolio_website/widgets/simple_custom_button.dart';
import 'package:portfolio_website/widgets/custom_header.dart';
import 'package:portfolio_website/widgets/effect.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactSection extends StatelessWidget {
  final GlobalKey contactKey;

  const ContactSection(this.contactKey, {super.key});

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
        horizontal: AppSize.horizontalPadding,
        vertical: AppSize.verticalPadding,
      ),
      child: Column(
        key: contactKey,
        children: [
          _buildContactHeader(context),
          const SizedBox(height: (AppSize.spacing * 3)),
          _buildContactContent(context),
        ],
      ),
    );
  }

  Widget _buildContactContent(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= AppSize.screenBreakPoint) {
      return Row(
        children: [
          Flexible(child: _buildContactImage()),
          const SizedBox(width: (AppSize.spacing * 2)),
          Flexible(child: _buildContactDetail(context)),
        ],
      );
    } else {
      return Column(
        children: [
          _buildContactImage(),
          const SizedBox(height: AppSize.spacing),
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
    child: CustomAnimation(
      begin: const Offset(-0.1, 0),
      child: Image.asset(AppImage.contactImage, fit: BoxFit.contain),
    ),
  );
}

Widget _buildContactDetail(BuildContext context) {
  return CustomAnimation(
    begin: const Offset(0.1, 0),
    child: Column(
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
          label: AppText.introText,
          child: Text(
            AppText.introText,
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
          label: AppText.contactMeText,
          child: Text(
            AppText.contactMeText,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                  letterSpacing: 0.8,
                  height: 2.5,
                ),
          ),
        ),
        _buildEmailBtn(context),
        const SizedBox(height: AppSize.spacing),
        const Align(child: _BuildSocialButton()),
      ],
    ),
  );
}

Widget _buildEmailBtn(BuildContext context) {
  return Effect(
    clickScale: 1.05,
    builder: (isHovered, isClicked, __, ___) => SimpleCustomButton(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      label: AppText.email,
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
        const emailUrl = 'mailto:${AppText.email}';
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
      spacing: AppSize.spacing * 2,
      runSpacing: AppSize.spacing,
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
      builder: (isHovered, isClicked, scale, opacity) => Tooltip(
        message: name,
        child: SimpleCustomButton(
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
