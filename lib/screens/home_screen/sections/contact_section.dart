import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../theme/app_constant.dart';
import '../../../widgets/custom_header.dart';
import '../../../widgets/effect.dart';
import '../../../widgets/simple_custom_button.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildContactHeader(context),
        const SizedBox(height: (AppSize.spacing * 4)),
        _buildContactContent(context),
      ],
    );
  }

  Widget _buildContactHeader(BuildContext context) {
    return CustomHeader(
      titleText: "Let's ",
      titleStyle: Theme.of(context).textTheme.displaySmall?.copyWith(
            color: Theme.of(context).primaryColor,
          ),
      subtitleText: "get to know each other",
      subtitleStyle: Theme.of(context).textTheme.displaySmall?.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
    );
  }

  Widget _buildContactContent(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final isDesktop = screenWidth >= AppSize.layoutBuilderBreakPoint;
        return isDesktop
            ? Row(
                children: [
                  Flexible(child: _buildContactImage()),
                  const SizedBox(width: (AppSize.spacing * 3)),
                  Flexible(child: _buildContactDetail(context)),
                ],
              )
            : Column(
                children: [
                  _buildContactImage(),
                  const SizedBox(height: AppSize.spacing * 2),
                  _buildContactDetail(context),
                ],
              );
      },
    );
  }

  Widget _buildContactImage() {
    return Semantics(
        label: 'Illustration of connecting with others',
        child: Image.network(
          AppImage.contactImage,
          fit: BoxFit.contain,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(child: CircularProgressIndicator());
          },
          errorBuilder: (context, error, stackTrace) {
            return Icon(
              Icons.broken_image,
              color: Theme.of(context).colorScheme.onError,
            );
          },
        ));
  }

  Widget _buildContactDetail(BuildContext context) {
    return Column(
      children: [
        Text(
          "Get in Touch!",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
        const SizedBox(height: AppSize.spacing / 2),
        Semantics(
          label: AppText.introText,
          child: Text(
            AppText.introText,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                  letterSpacing: 0.5,
                  height: 2,
                ),
          ),
        ),
        Text(
          "Contact with Me:",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
        const SizedBox(height: AppSize.spacing / 2),
        Semantics(
          label: AppText.contactMeText,
          child: Text(
            AppText.contactMeText,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                  letterSpacing: 0.5,
                  height: 2,
                ),
          ),
        ),
        _buildEmailBtn(context),
        const SizedBox(height: AppSize.spacing),
        const Align(child: _BuildSocialButton()),
      ],
    );
  }

  Widget _buildEmailBtn(BuildContext context) {
    return Effect(
      clickScale: 1.05,
      builder: (isHovered, isClicked, __, ___) => SimpleCustomButton(
        backgroundColor: Colors.transparent,
        label: AppText.email,
        textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: isHovered
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).colorScheme.onPrimary,
              letterSpacing: 0.8,
            ),
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
      children: AppText.socialMedia.map((social) {
        return _buildSocialBtn(context, social.name, social.icon, social.url);
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
      builder: (isHovered, isClicked, scale, opacity) => SimpleCustomButton(
        backgroundColor: Colors.transparent,
        label: name,
        icon: Icon(icon),
        textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
              letterSpacing: 0.8,
            ),
        showUnderline: isHovered ? true : false,
        underlineColor: Theme.of(context).primaryColor,
        onPressed: () async {
          if (await canLaunchUrlString(url)) {
            await launchUrlString(url);
          }
        },
      ),
    );
  }
}
