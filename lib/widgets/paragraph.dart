import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WParagraph extends StatelessWidget {
  final String text;
  final int maxLines;
  final TextAlign textAlign;
  final Color? textColor;
  final double fontSize;
  final TextOverflow overflow;

  const WParagraph({
    super.key,
    required this.text,
    this.maxLines = 5,
    this.textAlign = TextAlign.start,
    this.textColor,
    this.fontSize = 16, // Default font size
    this.overflow = TextOverflow.fade, // Default overflow behavior
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(
          text,
          textAlign: textAlign,
          style: TextStyle(
            fontSize: fontSize.sp, // Use ScreenUtil for responsive size
            color: textColor ?? Theme.of(context).textTheme.bodyLarge?.color,
          ),
          overflow: overflow,
          maxLines: maxLines,
        ),
      ],
    );
  }
}
