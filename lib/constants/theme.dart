import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_size.dart';

class AppColors {
  static const Color primaryColor = Color(0xff2196f3);
  static const Color secondaryColor = Color(0xFF03DAC6);
  static const Color backgroundColor = Color(0xFF121212);
  static const Color surfaceColor = Color(0xFF1E1E1E);
  static const Color errorColor = Color(0xFFCF6679);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onSecondary = Color(0xff9ca3af);
  static const Color onBackground = Color(0xFFFFFFFF);
  static const Color onError = Color(0xFFFFFFFF);
}

const appBarTheme = AppBarTheme(backgroundColor: AppColors.backgroundColor);

final scrollbarThemeData = ScrollbarThemeData(
  thumbColor: WidgetStateProperty.all(AppColors.primaryColor),
  thickness: WidgetStateProperty.all(AppSize.borderSize),
  radius: const Radius.circular(AppSize.borderSize),
);

ThemeData appTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    appBarTheme: appBarTheme,
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
