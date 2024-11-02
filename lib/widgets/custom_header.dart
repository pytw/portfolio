import 'package:flutter/material.dart';

/// A reusable widget that displays a header consisting of two customizable
/// pieces of text, each with configurable styles such as color, font size,
/// letter spacing, and word spacing.
///
/// [CustomHeader] allows for a title and subtitle with different styles
/// and can be reused across different screens in your application. It
/// provides flexibility to control the content and styling via parameters.
///
/// Parameters:
/// - [titleText]: The main text (title) to display in the header.
/// - [subtitleText]: The secondary text (subtitle) to display next to the title.
/// - [titleStyle]: The [TextStyle] for the title text. Defaults to bold white text.
/// - [subtitleStyle]: The [TextStyle] for the subtitle text. Defaults to bold blue text.
/// - [alignment]: Alignment of the text. Defaults to `Alignment.topLeft`.
///
/// Example usage:
/// ```dart
/// CustomHeader(
///   titleText: 'But wait.. ',
///   subtitleText: 'Who am I...',
///   titleStyle: TextStyle(color: Colors.white, fontSize: 24, letterSpacing: 2, wordSpacing: 4),
///   subtitleStyle: TextStyle(color: Colors.blue, fontSize: 24, letterSpacing: 2, wordSpacing: 4),
///   alignment: Alignment.topLeft,
/// )
/// ```
class CustomHeader extends StatelessWidget {
  /// The main text (title) to be displayed in the header.
  final String titleText;

  /// The secondary text (subtitle) to be displayed after the title.
  final String subtitleText;

  /// The style for the title text. Defaults to bold white text.
  final TextStyle titleStyle;

  /// The style for the subtitle text. Defaults to bold blue text.
  final TextStyle subtitleStyle;

  /// The alignment of the text in the header. Defaults to `Alignment.topLeft`.
  final AlignmentGeometry alignment;

  /// Constructor for [CustomHeader] widget. Requires [titleText] and [subtitleText]
  /// to be provided. Optional parameters include [titleStyle] and [subtitleStyle].
  const CustomHeader({
    super.key,
    required this.titleText,
    required this.subtitleText,
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
    this.alignment = Alignment.topLeft,
  })  : titleStyle = titleStyle ??
            const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 0,
              wordSpacing: 0,
            ),
        subtitleStyle = subtitleStyle ??
            const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
              letterSpacing: 0,
              wordSpacing: 0,
            );

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: titleText,
              style: titleStyle,
            ),
            TextSpan(
              text: subtitleText,
              style: subtitleStyle,
            ),
          ],
        ),
      ),
    );
  }
}
