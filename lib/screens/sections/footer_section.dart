import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_website/theme/theme.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingMedium.w, vertical: AppSizes.paddingMedium.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '\u00A9 2024 Praveen Yadav. All rights reserved.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(height: AppSizes.mediumSpaceBtwItems.h),
          Text(
            'Made with Flutter',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }
}
