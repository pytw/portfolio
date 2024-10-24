import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Define Color Palette
class AppColors {
  static const Color primaryColor = Colors.blue;
  static const Color secondaryColor = Color(0xFF03DAC6);
  static const Color backgroundColor = Color(0xFF121212);
  static const Color surfaceColor = Color(0xFF1E1E1E);
  static const Color errorColor = Color(0xFFCF6679);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onSecondary = Color(0xff9ca3af);
  static const Color onBackground = Color(0xFFFFFFFF);
  static const Color onError = Color(0xFFFFFFFF);
}

// Define Sizes
class AppSizes {
  // fonSize
  static const double extraSmallFontSize = 12.0;
  static const double smallFontSize = 14.0;
  static const double extraMediumFontSize = 16.0;
  static const double mediumFontSize = 20.0;
  static const double largeFontSize = 24.0;
  static const double extraLargeFontSize = 28.0;

  static const double headingFontSize = 36.0;

  // padding
  static const double paddingExtraSmall = 4.0;
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingExtraLarge = 32.0;

  // spacing
  static const double smallSpaceBtwItems = 8.0;
  static const double mediumSpaceBtwItems = 16.0;
  static const double extraMediumSpaceBtwItems = 36.0;
  static const double largeSpaceBtwItems = 48.0;

  // border
  static const double borderSmall = 4.0;
  static const double borderMedium = 10.0;
  static const double borderLarge = 12.0;
  static const double borderExtraLarge = 20.0;

  // borderRadius
  static const double borderRadiusSmall = 4.0;
  static const double borderRadiusMedium = 10.0;
  static const double borderRadiusLarge = 12.0;
  static const double borderRadiusExtraLarge = 20.0;

  // iconSize
  static const double iconSizeSmall = 24.0;
  static const double iconSizeMedium = 28.0;
  static const double iconSizeLarge = 36.0;

  // letterSpacing
  static const double letterSpacingSmall = 0.5;
  static const double letterSpacingMedium = 1.0;
  static const double letterSpacingLarge = 1.2;
  static const double letterSpacingExtraLarge = 1.5;

  // lineHeight
  static const double lineHeightSmall = 1.2;
  static const double lineHeightMedium = 1.5;
  static const double lineHeightLarge = 3.5;
  static const double lineHeightExtraLarge = 4.5;
}

final scrollbarThemeData = ScrollbarThemeData(
  thumbColor: WidgetStateProperty.all(Colors.blue),
  thickness: WidgetStateProperty.all(AppSizes.borderSmall),
  radius: const Radius.circular(AppSizes.borderRadiusMedium),
);


ThemeData appTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    fontFamily: GoogleFonts.poppins().fontFamily,
    scrollbarTheme: scrollbarThemeData,
    colorScheme: const ColorScheme(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      surface: AppColors.surfaceColor,
      error: AppColors.errorColor,
      onPrimary: AppColors.onPrimary,
      onSecondary: AppColors.onSecondary,
      onError: AppColors.onError,
      onSurface: AppColors.onBackground,
      brightness: Brightness.dark,
    ).copyWith(surface: AppColors.backgroundColor),
  );
}
