import 'package:flutter/material.dart';

/// A reusable profile widget that displays an image and a name.
///
/// This widget allows customization of image size, name style, border,
/// shadow effects, background color, and interactions for better visual presentation.
///
/// The widget automatically handles image loading and can display a placeholder
/// image if the main image fails to load.
///
/// ## Example usage:
///

/// ProfileWidget(
///   imagePath: 'assets/profile.png',
///   name: 'John Doe',
///   size: 100,
///   onTap: () {
///     print('Profile tapped!');
///   },
/// )
///

///
/// ## Properties:
/// - imagePath: The path to the asset image.
/// - name: The name to display below the image.
/// - size: The size of the profile image. Default is 100.
/// - nameStyle: Custom text style for the name. If not provided, a default style is used.
/// - borderColor: The color of the border around the image. Default is white.
/// - borderWidth: The width of the border around the image. Default is 4.0.
/// - shadowColor: The color of the shadow around the image. Default is black with 54% opacity.
/// - shadowBlur: The blur radius of the shadow. Default is 10.0.
/// - backgroundColor: The background color of the widget. Default is transparent.
/// - onTap: Optional callback that is invoked when the widget is tapped.
/// - placeholderImage: The path to the placeholder image shown when the main image fails to load.
/// - borderRadius: The border radius for custom shapes. Default is a circular shape.
class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final String name;
  final double size;
  final TextStyle? nameStyle;
  final Color borderColor;
  final double borderWidth;
  final Color shadowColor;
  final double shadowBlur;
  final Color backgroundColor;
  final VoidCallback? onTap;
  final String? placeholderImage;
  final BorderRadiusGeometry? borderRadius; // Made nullable

  /// Creates a [ProfileWidget].
  ///
  /// Requires [imagePath] and [name] to be non-null.
  /// Other parameters can be customized as needed.
  const ProfileWidget({
    super.key,
    required this.imagePath,
    required this.name,
    this.size = 100,
    this.nameStyle,
    this.borderColor = Colors.white,
    this.borderWidth = 4.0,
    this.shadowColor = Colors.black54,
    this.shadowBlur = 10.0,
    this.backgroundColor = Colors.transparent,
    this.onTap,
    this.placeholderImage,
    this.borderRadius, // Allow null for borderRadius
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: backgroundColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildProfileImage(),
            const SizedBox(height: 8),
            _buildNameText(),
          ],
        ),
      ),
    );
  }

  /// Builds the profile image with optional border and shadow.
  Widget _buildProfileImage() {
    return Container(
      width: size + borderWidth * 2,
      height: size + borderWidth * 2,
      decoration: BoxDecoration(
        shape: borderRadius == null ? BoxShape.circle : BoxShape.rectangle, // Check for borderRadius
        color: borderColor,
        borderRadius: borderRadius, // Use borderRadius if provided
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: shadowBlur,
            spreadRadius: 1,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(size / 2), // Default to circular if null
        child: Image.asset(
          imagePath,
          width: size,
          height: size,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              placeholderImage ?? 'assets/placeholder.png',
              width: size,
              height: size,
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }

  /// Builds the text widget for the user's name.
  Widget _buildNameText() {
    return Text(
      name,
      style: nameStyle ??
          const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
    );
  }
}
