import 'package:flutter/material.dart';
import 'package:portfolio_website/constants/app_image.dart';
import 'package:portfolio_website/constants/app_size.dart';
import 'package:portfolio_website/constants/app_text.dart';
import 'package:portfolio_website/widgets/custom_header.dart';
import 'package:portfolio_website/widgets/simple_custom_button.dart';
import 'package:portfolio_website/widgets/effect.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildAboutHeader(context),
        const SizedBox(height: AppSize.spacing * 4),
        _buildAboutContent(context),
        const SizedBox(height: AppSize.spacing),
        _buildAboutMeBtn(context),
      ],
    );
  }

  Widget _buildAboutHeader(BuildContext context) {
    final theme = Theme.of(context);
    return CustomHeader(
      titleText: 'But wait . ',
      titleStyle: theme.textTheme.displaySmall?.copyWith(
        color: theme.colorScheme.onPrimary,
      ),
      subtitleText: 'Who am I . . .',
      subtitleStyle: theme.textTheme.displaySmall?.copyWith(
        color: theme.primaryColor,
      ),
    );
  }

  Widget _buildAboutContent(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final isDesktop = screenWidth >= AppSize.screenBreakPoint;

        return isDesktop
            ? Row(
                children: [
                  Flexible(child: _buildAboutMeText(context)),
                  const SizedBox(width: AppSize.spacing * 3),
                  Flexible(child: _buildAboutMeImage()),
                ],
              )
            : Column(
                children: [
                  _buildAboutMeImage(),
                  const SizedBox(height: AppSize.spacing),
                  _buildAboutMeText(context),
                ],
              );
      },
    );
  }

  Widget _buildAboutMeImage() {
    return Semantics(
      label: 'Illustration about personal development',
      child: Image.asset(
        AppImage.aboutImage,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.broken_image),
      ),
    );
  }

  Widget _buildAboutMeText(BuildContext context) {
    final theme = Theme.of(context);
    return Semantics(
      label: 'About me section containing personal details',
      child: Text(
        AppText.aboutMeText,
        style: theme.textTheme.bodyLarge?.copyWith(
          color: theme.colorScheme.onSecondary,
        ),
      ),
    );
  }

  Widget _buildAboutMeBtn(BuildContext context) {
    final theme = Theme.of(context);
    return Semantics(
      label: 'Button to connect with me',
      child: Effect(
        scale: 1.1,
        builder: (isHovered, isClicked, __, ___) => SimpleCustomButton(
          label: "Connect with Me",
          textStyle: TextStyle(
            color: isClicked ? theme.primaryColor : theme.colorScheme.onPrimary,
          ),
          backgroundColor: theme.scaffoldBackgroundColor,
          borderWidth: 1.5,
          borderColor:
              isHovered ? theme.primaryColor : theme.colorScheme.onPrimary,
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Feature coming soon!')),
            );
          },
        ),
      ),
    );
  }
}
