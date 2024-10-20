import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website/theme/theme.dart';
import 'package:portfolio_website/widgets/social_button.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingLarge.w, vertical: AppSizes.paddingLarge.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Let's get to know each other better.",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(height: AppSizes.largeSpacing.h),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: SvgPicture.asset(
                  'assets/images/connect.svg', // Ensure this path is correct
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(width: AppSizes.largeSpacing.w),

              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingSmall.w, vertical: AppSizes.paddingSmall.h),
                      child: Text(
                        "Thank you for visiting! This is your direct line to reach me. Whether you have a project in mind, a question about web development, or just want to say hello, I'm here and eager to connect with you.",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(height: AppSizes.lineHeightExtraLarge.h, letterSpacing: AppSizes.letterSpacingLarge.w),
                      ),
                    ),
                    SizedBox(height: AppSizes.extraLargeSpacing.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                      child: Text(
                        "Reach me out:-",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: const Color(0xff9ca3af)),
                      ),
                    ),
                    SizedBox(height: AppSizes.smallSpacing.h),
                    // Email Button
                    SocialButton(
                      label: 'praveen885127@gmail.com',
                      icon: Icons.mail_outline,
                      onPressed: () {
                        launchUrlString('mailto:praveen885127@gmail.com');
                      },
                    ),
                    SizedBox(height: 50.h),

                    // Social Links as buttons
                    Wrap(
                      spacing: 20.w,
                      runSpacing: 10,
                      children: [
                        SocialButton(
                          label: 'Github',
                          icon: FontAwesomeIcons.github,
                          onPressed: () {
                            launchUrlString("https://www.github.com/pyapril15");
                          },
                        ),
                        SocialButton(
                          label: 'LinkedIn',
                          icon: FontAwesomeIcons.linkedin,
                          onPressed: () {
                            launchUrlString(
                                "https://www.linkedin.com/pyapril1507");
                          },
                        ),
                        SocialButton(
                          label: 'Twitter',
                          icon: FontAwesomeIcons.twitter,
                          onPressed: () {
                            launchUrlString(
                                "https://www.twitter.com/pyapril15");
                          },
                        ),
                        SocialButton(
                          label: 'Discord',
                          icon: FontAwesomeIcons.discord,
                          onPressed: () {
                            launchUrlString(
                                'https://www.discord.com/pyapril15');
                          },
                        ),
                        SocialButton(
                          label: 'Instagram',
                          icon: FontAwesomeIcons.instagram,
                          onPressed: () {
                            launchUrlString(
                                'https://www.instagram.com/__pyapril15.py__');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}