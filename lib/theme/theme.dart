import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Define Color Palette (remains the same)
class AppColors {
  static const Color primaryColor = Color(0xFF6200EA);
  static const Color secondaryColor = Color(0xFF03DAC6);
  static const Color backgroundColor = Color(0xFF121212);
  static const Color surfaceColor = Color(0xFF1E1E1E);
  static const Color errorColor = Color(0xFFCF6679);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onSecondary = Color(0xFF000000);
  static const Color onBackground = Color(0xFFFFFFFF);
  static const Color onError = Color(0xFFFFFFFF);
}

// Define Text Styles using Google Fonts
class AppTextStyles {
  static TextStyle headline1 = GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.onBackground,
  );

  static TextStyle headline2 = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.onBackground,
  );

  static TextStyle bodyText1 = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.onBackground,
  );

  static TextStyle bodyText2 = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.onBackground.withOpacity(0.7),
  );
}

// InputDecoration Theme (remains the same)
final inputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: AppColors.surfaceColor,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: AppColors.primaryColor),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: AppColors.secondaryColor),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: AppColors.primaryColor, width: 2),
  ),
  hintStyle: GoogleFonts.poppins(color: AppColors.onBackground.withOpacity(0.5)),
);

// Button Theme (remains the same)
final buttonTheme = ButtonThemeData(
  buttonColor: AppColors.primaryColor,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
  ),
  textTheme: ButtonTextTheme.primary,
);

// Elevated Button Theme (remains the same)
final elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    textStyle: AppTextStyles.bodyText1.copyWith(color: AppColors.onPrimary),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
);

// AppBar Theme (remains the same)
final appBarTheme = AppBarTheme(
  backgroundColor: AppColors.surfaceColor,
  elevation: 0,
  titleTextStyle: AppTextStyles.headline1,
);

// Card Theme (remains the same)
final cardTheme = CardTheme(
  color: AppColors.surfaceColor,
  shadowColor: AppColors.primaryColor.withOpacity(0.2),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
  ),
);

// Define the Overall Theme Data
ThemeData appTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    cardTheme: cardTheme,
    inputDecorationTheme: inputDecorationTheme,
    elevatedButtonTheme: elevatedButtonTheme,
    buttonTheme: buttonTheme,
    appBarTheme: appBarTheme,
    textTheme: TextTheme(
      displayLarge: AppTextStyles.headline1,
      displayMedium: AppTextStyles.headline2,
      bodyLarge: AppTextStyles.bodyText1,
      bodyMedium: AppTextStyles.bodyText2,
    ),
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
