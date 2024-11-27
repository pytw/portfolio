import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/theme/app_text_theme.dart';
import 'app_constant.dart';

const appBarTheme = AppBarTheme(backgroundColor: AppColor.backgroundColor);

final scrollbarThemeData = ScrollbarThemeData(
  thumbColor: WidgetStateProperty.all(AppColor.primaryColor),
  thickness: WidgetStateProperty.all(AppSize.borderSize),
  radius: const Radius.circular(AppSize.borderSize),
);

ThemeData appThemeData(BuildContext context) {
  return ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColor.primaryColor,
    scaffoldBackgroundColor: AppColor.backgroundColor,
    appBarTheme: appBarTheme,
    fontFamily: GoogleFonts.roboto().fontFamily,
    scrollbarTheme: scrollbarThemeData,
    textTheme: AppTextTheme.getTextTheme(context),
    colorScheme: const ColorScheme(
      primary: AppColor.primaryColor,
      secondary: AppColor.secondaryColor,
      surface: AppColor.surfaceColor,
      error: AppColor.errorColor,
      onPrimary: AppColor.onPrimary,
      onSecondary: AppColor.onSecondary,
      onError: AppColor.onError,
      onSurface: AppColor.onBackground,
      brightness: Brightness.dark,
    ).copyWith(surface: AppColor.backgroundColor),
  );
}
