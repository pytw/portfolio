import 'package:flutter/material.dart';

/// A reusable widget that displays a header consisting of two customizable
/// pieces of text, each with configurable styles such as color, font size,
/// and alignment.
///
/// [CustomHeader] allows for a title and subtitle with different colors
/// and can be reused across different screens in your application. It
/// provides flexibility to control the content and styling via parameters.
///
/// Parameters:
/// - [titleText]: The main text (title) to display in the header.
/// - [subtitleText]: The secondary text (subtitle) to display next to the title.
/// - [titleColor]: Color of the title text. Defaults to `Colors.white`.
/// - [subtitleColor]: Color of the subtitle text. Defaults to `Colors.blue`.
/// - [headingFontSize]: Font size to be used for both the title and subtitle text.
/// - [alignment]: Alignment of the text. Defaults to `TextAlign.left`.
///
/// Example usage:
/// ```dart
/// CustomHeader(
///   titleText: 'But wait.. ',
///   subtitleText: 'Who am I...',
///   titleColor: Colors.white,
///   subtitleColor: Colors.blue,
///   headingFontSize: 24.sp, // Uses ScreenUtil for responsive sizing
///   alignment: TextAlign.left,
/// )
/// ```
class CustomHeader extends StatelessWidget {
  /// The main text (title) to be displayed in the header.
  final String titleText;

  /// The secondary text (subtitle) to be displayed after the title.
  final String subtitleText;

  /// The color of the title text. Defaults to `Colors.white`.
  final Color titleColor;

  /// The color of the subtitle text. Defaults to `Colors.blue`.
  final Color subtitleColor;

  /// The font size for both the title and subtitle text. This must be provided by the user.
  final double headingFontSize;

  /// The alignment of the text in the header. Defaults to `TextAlign.left`.
  final TextAlign textAlign;

  final AlignmentGeometry alignment;
  final double? titleLetterSpacing;
  final double? subTitleLetterSpacing;

  /// Constructor for [CustomHeader] widget. Requires [titleText], [subtitleText],
  /// and [headingFontSize] to be provided.
  ///
  /// Optional parameters include [titleColor], [subtitleColor], and [alignment].
  const CustomHeader({
    super.key,
    required this.titleText,
    required this.subtitleText,
    this.titleColor = Colors.white,
    this.subtitleColor = Colors.blue,
    required this.headingFontSize,
    this.alignment = Alignment.topLeft,
    this.textAlign = TextAlign.left,
    this.titleLetterSpacing,
    this.subTitleLetterSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: RichText(
        textAlign: textAlign,
        text: TextSpan(
          children: [
            TextSpan(
              text: titleText,
              style: TextStyle(
                fontSize: headingFontSize,
                fontWeight: FontWeight.bold,
                color: titleColor,
                letterSpacing: titleLetterSpacing,
              ),
            ),
            TextSpan(
              text: subtitleText,
              style: TextStyle(
                fontSize: headingFontSize,
                fontWeight: FontWeight.bold,
                color: subtitleColor,
                letterSpacing: subTitleLetterSpacing,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
