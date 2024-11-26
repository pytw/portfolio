import 'package:flutter/material.dart';

class AppTextTheme {
  // Scales font size dynamically based on TextScale
  static double getResponsiveFontSize(BuildContext context, double baseSize) {
    final textScale = MediaQuery.textScalerOf(context);
    return textScale.scale(baseSize);
  }

  // Generate a responsive TextTheme
  static TextTheme getTextTheme(BuildContext context) {
    return TextTheme(
      displayLarge: TextStyle(
        fontSize: getResponsiveFontSize(context, 32), // Large app title
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        fontSize: getResponsiveFontSize(context, 28), // Screen title
        fontWeight: FontWeight.bold,
      ),
      displaySmall: TextStyle(
        fontSize: getResponsiveFontSize(context, 24), // Section header
        fontWeight: FontWeight.w600,
        color: Colors.yellow
      ),
      headlineLarge: TextStyle(
        fontSize: getResponsiveFontSize(context, 22), // Page sub-header
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: TextStyle(
        fontSize: getResponsiveFontSize(context, 20), // Card title
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        fontSize: getResponsiveFontSize(context, 18), // Minor title
        fontWeight: FontWeight.w500,
      ),
      titleLarge: TextStyle(
        fontSize: getResponsiveFontSize(context, 16), // App bar/dialog title
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        fontSize: getResponsiveFontSize(context, 14), // Section description
        fontWeight: FontWeight.w400,
      ),
      titleSmall: TextStyle(
        fontSize: getResponsiveFontSize(context, 12), // Form label
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: TextStyle(
        fontSize: getResponsiveFontSize(context, 14), // Main content text
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: TextStyle(
        fontSize: getResponsiveFontSize(context, 12), // Secondary content text
        fontWeight: FontWeight.normal,
      ),
      bodySmall: TextStyle(
        fontSize: getResponsiveFontSize(context, 10), // Captions
        fontWeight: FontWeight.normal,
      ),
      labelLarge: TextStyle(
        fontSize: getResponsiveFontSize(context, 14), // Button text
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      labelMedium: TextStyle(
        fontSize: getResponsiveFontSize(context, 12), // Chip text
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        fontSize: getResponsiveFontSize(context, 10), // Timestamp/label
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
      ),
    );
  }
}
