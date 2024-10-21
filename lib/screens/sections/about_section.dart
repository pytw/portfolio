import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website/animations/slide_in_animation.dart';
import 'package:portfolio_website/theme/theme.dart';
import 'package:portfolio_website/widgets/custom_button.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppSizes.paddingLarge.w,
          vertical: AppSizes.paddingLarge.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('But wait.. Who am I...',
              style: Theme.of(context).textTheme.headlineMedium),
          SizedBox(height: AppSizes.largeSpaceBtwItems.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: CustomAnimation(
                  animationType: AnimationType.scale,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                          "Hello, I'm Praveen Yadav, a dedicated undergraduate student with a profound interest in web development. Currently pursuing my Bachelor of Computer Applications (BCA) degree, my goal is to master both front-end and back-end technologies, aiming to become a versatile and skilled developer. I thrive on the creativity and problem-solving that web development offers. Let's connect and exchange ideas in the dynamic world of web development. I'm always open to new connections and exciting opportunities. Feel free to reach out, and let's embark on this journey together.",
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              height: AppSizes.lineHeightLarge.h,
                              letterSpacing: AppSizes.letterSpacingLarge.w,
                              color: Theme.of(context).colorScheme.onSecondary)),
                      SizedBox(height: AppSizes.largeSpaceBtwItems.h),
                      CustomButton(
                        onPressed: () {},
                        label: "Connect with me",
                        icon: FontAwesomeIcons.link,
                        iconFirst: false,
                        iconSize: AppSizes.iconSizeSmall,
                        textStyle: Theme.of(context).textTheme.bodyLarge
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(width: AppSizes.largeSpaceBtwItems.w),
              Expanded(
                flex: 1,
                child: CustomAnimation(
                  animationType: AnimationType.fade,
                  child: SvgPicture.asset(
                    'assets/images/about-me.svg', // Ensure this path is correct
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}