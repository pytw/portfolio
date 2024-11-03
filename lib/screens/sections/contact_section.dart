import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website/widgets/custom_button.dart';
import 'package:portfolio_website/widgets/custom_header.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  // Constants
  static const double horizontalPadding = 16.0;
  static const double verticalPadding = 16.0;
  static const double spacing = 8.0;
  static const double iconSize = 24.0;
  static const double largeScreenBreakpoint = 1200.0;
  static const double mediumScreenBreakpoint = 800.0;

  // Text Constants
  static const String contactImage = 'assets/images/connect.png';
  static const String email = 'praveen885127@gmail.com';
  static const String githubUrl = 'https://www.github.com/pyapril15';
  static const String linkedinUrl = 'https://www.linkedin.com/in/pyapril15';
  static const String twitterUrl = 'https://www.twitter.com/pyapril15';
  static const String discordUrl = 'https://www.discord.com/pyapril15';
  static const String instagramUrl =
      'https://www.instagram.com/__pyapril15.py__';

  static const String introText = """
    I’m excited to connect with you! Whether you have a project in mind, questions about web development, or just want to chat, I’m here to help. Feel free to reach out via email or find me on social media platforms like Instagram, Twitter, and LinkedIn. Your ideas matter, and I can’t wait to hear them!
  """;

  static const String contactMeText = """
    For collaboration, insights, or tech discussions, don’t hesitate to reach out through my GitHub or Discord. I value every conversation and look forward to building something amazing together. Let’s transform your vision into reality—one message at a time!
  """;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: horizontalPadding, vertical: verticalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _BuildHeader(),
          const SizedBox(height: (spacing * 3)),
          _buildContactContent(screenWidth),
        ],
      ),
    );
  }

  Widget _buildContactContent(double screenWidth) {
    if (screenWidth >= largeScreenBreakpoint) {
      // Large screen layout with row alignment
      return const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(child: _ContactDetails()),
          SizedBox(width: (spacing * 2)),
          Flexible(child: _ContactImage()),
        ],
      );
    } else if (screenWidth >= mediumScreenBreakpoint) {
      // Medium screen layout with column alignment
      return const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(child: _ContactDetails()),
          SizedBox(height: spacing),
          Flexible(child: _ContactImage()),
        ],
      );
    } else {
      // Small screen layout with column alignment
      return const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _ContactImage(),
          SizedBox(height: spacing),
          _ContactDetails(),
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
}

class _ContactImage extends StatelessWidget {
  const _ContactImage();

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Illustration of connecting with others',
      child: Image.asset(ContactSection.contactImage, fit: BoxFit.contain),
    );
  }
}

class _ContactDetails extends StatelessWidget {
  const _ContactDetails();

  static const double spacing = ContactSection.spacing;

  @override
  Widget build(BuildContext context) {
    return Column(
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
        const SizedBox(height: spacing * 2),
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
        const SizedBox(height: spacing),
        _EmailButton(),
        const SizedBox(height: spacing * 2),
        _SocialLinks(),
      ],
    );
  }
}

class _EmailButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Email me at ${ContactSection.email}',
      child: CustomButton(
        label: ContactSection.email,
        icon: FontAwesomeIcons.mailchimp,
        iconSize: ContactSection.iconSize,
        iconColor: Theme.of(context).primaryColor,
        hoverLabelColor: Theme.of(context).primaryColor,
        hoverUnderlineColor: Theme.of(context).primaryColor,
        hoverEffects: const [
          HoverEffect.labelColor,
          HoverEffect.underline,
        ],
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
}

class _SocialLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: ContactSection.spacing * 2,
      runSpacing: ContactSection.spacing,
      children: [
        _SocialButton(
          label: 'GitHub',
          icon: FontAwesomeIcons.github,
          url: ContactSection.githubUrl,
        ),
        _SocialButton(
          label: 'LinkedIn',
          icon: FontAwesomeIcons.linkedin,
          url: ContactSection.linkedinUrl,
        ),
        _SocialButton(
          label: 'Twitter',
          icon: FontAwesomeIcons.twitter,
          url: ContactSection.twitterUrl,
        ),
        _SocialButton(
          label: 'Discord',
          icon: FontAwesomeIcons.discord,
          url: ContactSection.discordUrl,
        ),
        _SocialButton(
          label: 'Instagram',
          icon: FontAwesomeIcons.instagram,
          url: ContactSection.instagramUrl,
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
    return Semantics(
      label: 'Visit my $label profile',
      child: CustomButton(
        onPressed: () async {
          if (await canLaunchUrlString(url)) {
            await launchUrlString(url);
          } else {
            if (!context.mounted) return;
            _showErrorDialog(context, 'Could not launch $label link.');
          }
        },
        label: label,
        icon: icon,
        hoverBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
        hoverUnderlineColor: Theme.of(context).primaryColor,
        hoverLabelColor: Theme.of(context).primaryColor,
        hoverIconColor: Theme.of(context).primaryColor,
        iconSize: ContactSection.iconSize,
        hoverEffects: const [
          HoverEffect.backgroundColor,
          HoverEffect.underline,
          HoverEffect.labelColor,
          HoverEffect.iconColor,
          HoverEffect.scale,
        ],
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
