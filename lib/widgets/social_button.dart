import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_website/theme/theme.dart';

class SocialButton extends StatefulWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  const SocialButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppSizes.paddingSmall.w,
          vertical: AppSizes.paddingSmall.h),
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            _isHovering = true;
          });
        },
        onExit: (_) {
          setState(() {
            _isHovering = false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: _isHovering
                    ? Theme.of(context).primaryColor
                    : Colors.transparent,
                width: AppSizes.borderSmall.h,
              ),
            ),
          ),
          child: ElevatedButton.icon(
            onPressed: widget.onPressed,
            style: ButtonStyle(
              overlayColor: WidgetStateProperty.all<Color>(Colors.transparent),
              backgroundColor: WidgetStateProperty.all<Color>(
                  Colors.transparent), // Transparent background
              padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(
                  horizontal: AppSizes.paddingSmall.w,
                  vertical: AppSizes.paddingSmall.h)),
              shadowColor: WidgetStateProperty.all<Color>(
                  Colors.transparent), // No shadow
            ),
            icon: Icon(
              widget.icon,
              size: _isHovering? AppSizes.iconSizeMedium: AppSizes.iconSizeSmall, // Increase icon size on hover
              color: _isHovering? Theme.of(context).primaryColor: Theme.of(context).colorScheme.onPrimary, // Change color on hover
            ),
            label: Text(
              widget.label,
              style: TextStyle(
                fontSize: _isHovering?AppSizes.extraMediumFontSize:AppSizes.smallFontSize, // Increase text size on hover
                color: _isHovering?Theme.of(context).primaryColor:Theme.of(context).colorScheme.onPrimary, // Change text color on hover
              ),
            ),
          ),
        ),
      ),
    );
  }
}
