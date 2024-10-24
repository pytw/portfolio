import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website/animations/slide_in_animation.dart';
import 'package:portfolio_website/theme/theme.dart';
import 'package:portfolio_website/widgets/custom_button.dart';
import 'package:portfolio_website/widgets/custom_header.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.paddingLarge.w,
        vertical: AppSizes.paddingLarge.h,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double bodyFontSize = AppSizes.mediumFontSize.sp;
          double headingFontSize = AppSizes.headingFontSize.sp;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHeader(
                titleText: "Let's get ",
                titleColor: Theme.of(context).primaryColor,
                subtitleText: 'to know each other better.',
                subtitleColor: Theme.of(context).colorScheme.onPrimary,
                headingFontSize: headingFontSize,
              ),
              SizedBox(height: AppSizes.largeSpaceBtwItems.h),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 1,
                      child: CustomAnimation(
                        animationType: AnimationType.scale,
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: SvgPicture.asset(
                            'assets/images/connect.svg', // Ensure this path is correct
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: AppSizes.largeSpaceBtwItems.w),
                    Expanded(
                      flex: 1,
                      child: CustomAnimation(
                        animationType: AnimationType.fade,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppSizes.paddingSmall.w,
                                vertical: AppSizes.paddingSmall.h,
                              ),
                              child: Text(
                                "Thank you for visiting! This is your direct line to reach me. Whether you have a project in mind, a question about web development, or just want to say hello, I'm here and eager to connect with you.",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      height: AppSizes.lineHeightExtraLarge.h,
                                      letterSpacing:
                                          AppSizes.letterSpacingMedium.w,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary,
                                      fontSize: bodyFontSize,
                                    ),
                              ),
                            ),
                            SizedBox(height: AppSizes.largeSpaceBtwItems.h),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppSizes.paddingSmall.w,
                                vertical: AppSizes.paddingSmall.h,
                              ),
                              child: Text(
                                "Reach me out:-",
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary,
                                    ),
                              ),
                            ),
                            SizedBox(height: AppSizes.smallSpaceBtwItems.h),
                            CustomButton(
                              label: 'praveen885127@gmail.com',
                              icon: FontAwesomeIcons.mailchimp,
                              iconSize: AppSizes.iconSizeSmall,
                              iconColor: Theme.of(context).primaryColor,
                              hoverLabelColor: Theme.of(context).primaryColor,
                              hoverUnderlineColor:
                                  Theme.of(context).primaryColor,
                              hoverEffects: const [
                                HoverEffect.labelColor,
                                HoverEffect.underline,
                              ],
                              onPressed: () {
                                launchUrlString(
                                  'mailto:praveen885127@gmail.com',
                                );
                              },
                            ),
                            SizedBox(height: AppSizes.largeSpaceBtwItems.h),
                            Wrap(
                              spacing: AppSizes.mediumSpaceBtwItems.w,
                              runSpacing: AppSizes.mediumSpaceBtwItems.h,
                              alignment: WrapAlignment.start,
                              children: [
                                _buildSocialButton(
                                  context: context,
                                  label: 'GitHub',
                                  icon: FontAwesomeIcons.github,
                                  url: 'https://www.github.com/pyapril15',
                                ),
                                _buildSocialButton(
                                  context: context,
                                  label: 'LinkedIn',
                                  icon: FontAwesomeIcons.linkedin,
                                  url: 'https://www.linkedin.com/in/pyapril15',
                                ),
                                _buildSocialButton(
                                  context: context,
                                  label: 'Twitter',
                                  icon: FontAwesomeIcons.twitter,
                                  url: 'https://www.twitter.com/pyapril15',
                                ),
                                _buildSocialButton(
                                  context: context,
                                  label: 'Discord',
                                  icon: FontAwesomeIcons.discord,
                                  url: 'https://www.discord.com/pyapril15',
                                ),
                                _buildSocialButton(
                                  context: context,
                                  label: 'Instagram',
                                  icon: FontAwesomeIcons.instagram,
                                  url:
                                      'https://www.instagram.com/__pyapril15.py__',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  CustomButton _buildSocialButton({
    required BuildContext context,
    required String label,
    required IconData icon,
    required String url,
  }) {
    return CustomButton(
      onPressed: () { launchUrlString(url);},
      label: label,
      icon: icon,
      hoverBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
      hoverUnderlineColor: Theme.of(context).primaryColor,
      hoverLabelColor: Theme.of(context).primaryColor,
      hoverIconColor: Theme.of(context).primaryColor,
      iconSize: AppSizes.iconSizeSmall,
      hoverEffects: const [
        HoverEffect.backgroundColor,
        HoverEffect.underline,
        HoverEffect.labelColor,
        HoverEffect.iconColor,
        HoverEffect.scale,
      ],
    );
  }
}
