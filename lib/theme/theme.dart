import 'package:flutter/material.dart';

/// Theme constants used throughout the app
class ThemeConstants {
  // Private constructor prevents instantiation
  ThemeConstants._();

  // ==================== COLORS ====================
  static const Color seedColor = Colors.blue;

  // ==================== BORDER RADIUS ====================
  static const double borderRadiusSmall = 8.0;
  static const double borderRadiusMedium = 12.0;
  static const double borderRadiusLarge = 16.0;
  static const double borderRadiusXLarge = 20.0;

  // ==================== SPACING ====================
  static const double spacingXSmall = 4.0;
  static const double spacingSmall = 8.0;
  static const double spacingMedium = 16.0;
  static const double spacingLarge = 24.0;
  static const double spacingXLarge = 32.0;

  // ==================== ELEVATION ====================
  static const double elevationLow = 2.0;
  static const double elevationMedium = 4.0;
  static const double elevationHigh = 8.0;

  // ==================== ICON SIZES ====================
  static const double iconSizeSmall = 16.0;
  static const double iconSizeMedium = 24.0;
  static const double iconSizeLarge = 32.0;
  static const double iconSizeXLarge = 48.0;

  // ==================== PADDING ====================
  static const EdgeInsets paddingSmall = EdgeInsets.all(8.0);
  static const EdgeInsets paddingMedium = EdgeInsets.all(16.0);
  static const EdgeInsets paddingLarge = EdgeInsets.all(24.0);
  static const EdgeInsets cardPadding = EdgeInsets.all(16.0);
  static const EdgeInsets screenPadding = EdgeInsets.all(16.0);

  // ==================== BORDER RADIUS OBJECTS ====================
  static BorderRadius get borderRadiusSmallValue =>
      BorderRadius.circular(borderRadiusSmall);
  static BorderRadius get borderRadiusMediumValue =>
      BorderRadius.circular(borderRadiusMedium);
  static BorderRadius get borderRadiusLargeValue =>
      BorderRadius.circular(borderRadiusLarge);
  static BorderRadius get borderRadiusXLargeValue =>
      BorderRadius.circular(borderRadiusXLarge);

  // ==================== ANIMATION DURATIONS ====================
  static const Duration animationFast = Duration(milliseconds: 150);
  static const Duration animationNormal = Duration(milliseconds: 300);
  static const Duration animationSlow = Duration(milliseconds: 500);

  // ==================== SNACKBAR DURATIONS ====================
  static const Duration snackBarShort = Duration(seconds: 2);
  static const Duration snackBarMedium = Duration(seconds: 4);
  static const Duration snackBarLong = Duration(seconds: 6);
}
