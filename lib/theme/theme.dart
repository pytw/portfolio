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
  static const Color onSecondary = Color(0xFF000000);
  static const Color onBackground = Color(0xFFFFFFFF);
  static const Color onError = Color(0xFFFFFFFF);
}

// Define Sizes
class AppSizes {
  static const double paddingExtraSmall = 4.0;
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingExtraLarge = 32.0;

  static const double smallSpacing = 8.0;
  static const double mediumSpacing = 16.0;
  static const double largeSpacing = 24.0;
  static const double extraLargeSpacing = 50.0;

  static const double borderRadiusSmall = 4.0;
  static const double borderRadiusMedium = 10.0;
  static const double borderRadiusLarge = 12.0;
  static const double borderRadiusExtraLarge = 20.0;

  static const double iconSizeSmall = 24.0;
  static const double iconSizeMedium = 36.0;
  static const double iconSizeLarge = 48.0;

  static const double letterSpacingSmall = 0.5;
  static const double letterSpacingMedium = 1.0;
  static const double letterSpacingLarge = 1.2;
  static const double letterSpacingExtraLarge = 1.5;

  static const double lineHeightSmall = 1.2;
  static const double lineHeightMedium = 1.5;
  static const double lineHeightLarge = 1.8;
  static const double lineHeightExtraLarge = 4.5;
}

// Define Text Styles
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

  static TextStyle headline3 = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w500,
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

  static TextStyle bodyText3 = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.onBackground.withOpacity(0.5),
  );

  static TextStyle buttonText = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.onPrimary,
  );

  static TextStyle caption = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.onBackground.withOpacity(0.5),
  );
}

// InputDecoration Theme
final inputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: AppColors.surfaceColor,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(AppSizes.borderRadiusMedium),
    borderSide: const BorderSide(color: AppColors.primaryColor),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(AppSizes.borderRadiusMedium),
    borderSide: const BorderSide(color: AppColors.secondaryColor),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(AppSizes.borderRadiusMedium),
    borderSide: const BorderSide(color: AppColors.primaryColor, width: 2),
  ),
  hintStyle: GoogleFonts.poppins(color: AppColors.onBackground.withOpacity(0.5)),
);

// Button Themes
final elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingMedium, vertical: AppSizes.paddingSmall),
    textStyle: AppTextStyles.buttonText,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSizes.borderRadiusLarge),
    ),
  ).copyWith(
    elevation: ButtonStyleButton.allOrNull(5),
    shadowColor: WidgetStateProperty.all(AppColors.primaryColor.withOpacity(0.2)),
  ),
);

final outlinedButtonTheme = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    foregroundColor: AppColors.primaryColor,
    side: const BorderSide(color: AppColors.primaryColor),
    padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingMedium, vertical: AppSizes.paddingSmall),
    textStyle: AppTextStyles.buttonText,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSizes.borderRadiusMedium),
    ),
  ).copyWith(
    elevation: ButtonStyleButton.allOrNull(0),
  ),
);

final textButtonTheme = TextButtonThemeData(
  style: TextButton.styleFrom(
    foregroundColor: AppColors.primaryColor,
    padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingMedium, vertical: AppSizes.paddingSmall),
    textStyle: AppTextStyles.buttonText,
  ).copyWith(
    elevation: ButtonStyleButton.allOrNull(0),
  ),
);

// AppBar Theme
final appBarTheme = AppBarTheme(
  backgroundColor: AppColors.surfaceColor,
  elevation: 0,
  titleTextStyle: AppTextStyles.headline1,
);

// Card Theme
final cardTheme = CardTheme(
  color: AppColors.surfaceColor,
  shadowColor: AppColors.primaryColor.withOpacity(0.2),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(AppSizes.borderRadiusLarge),
  ),
);

// Snack bar Theme
final snackBarTheme = SnackBarThemeData(
  backgroundColor: AppColors.primaryColor,
  contentTextStyle: AppTextStyles.bodyText2.copyWith(color: AppColors.onPrimary),
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
    outlinedButtonTheme: outlinedButtonTheme,
    textButtonTheme: textButtonTheme,
    appBarTheme: appBarTheme,
    textTheme: TextTheme(
      headlineLarge: AppTextStyles.headline1,
      headlineMedium: AppTextStyles.headline2,
      headlineSmall: AppTextStyles.headline3,
      bodyLarge: AppTextStyles.bodyText1,
      bodyMedium: AppTextStyles.bodyText2,
      bodySmall: AppTextStyles.bodyText3,
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
    snackBarTheme: snackBarTheme,
  );
}
