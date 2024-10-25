import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_website/theme/theme.dart';

class Layout extends StatelessWidget {
  final Widget header;
  final Widget body;
  final Widget footer;

  const Layout({
    super.key,
    this.header = const SizedBox.shrink(),
    this.body = const SizedBox.shrink(),
    this.footer = const SizedBox.shrink(),
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppSizes.paddingMedium.w,
              vertical: AppSizes.paddingMedium.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              header,
              SizedBox(height: AppSizes.paddingSmall.h),
              body,
              SizedBox(height: AppSizes.paddingSmall.h),
              footer,
            ],
          ),
        );
      },
    );
  }
}
