// lib/helpers/responsive_helper.dart
import 'package:flutter/material.dart';

enum ScreenType { mobile, tablet, desktop }

const double mobileBreakpoint = 600.0;
const double tabletBreakpoint = 1200.0;

ScreenType getScreenType(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  if (width < mobileBreakpoint) return ScreenType.mobile;
  if (width < tabletBreakpoint) return ScreenType.tablet;
  return ScreenType.desktop;
}

bool isMobile(BuildContext context) =>
    getScreenType(context) == ScreenType.mobile;
bool isTablet(BuildContext context) =>
    getScreenType(context) == ScreenType.tablet;
bool isDesktop(BuildContext context) =>
    getScreenType(context) == ScreenType.desktop;
