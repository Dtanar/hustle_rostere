import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
class AppTheme {
  // Private constructor to prevent instantiation
  const AppTheme._();

  /// Light Theme

  static final light = FlexThemeData.light(
    scheme: FlexScheme.mandyRed,
    surfaceMode: FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog,
    blendLevel: 40,
    appBarStyle: FlexAppBarStyle.primary,
    appBarOpacity: 0.85,
    appBarElevation: 0.0,
    tabBarStyle: FlexTabBarStyle.forBackground,
    transparentStatusBar: true,
    tooltipsMatchBackground: true,
    swapColors: true,
    lightIsWhite: true,
    useMaterial3: true,
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    fontFamily: GoogleFonts.fingerPaint().fontFamily,

    subThemesData: const FlexSubThemesData(
      useTextTheme: true,
      fabUseShape: true,
      interactionEffects: true,
      bottomNavigationBarElevation: 0,
      bottomNavigationBarOpacity: 1,
      navigationBarOpacity: 1,
      navigationBarMutedUnselectedIcon: true,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      inputDecoratorUnfocusedHasBorder: true,
      blendOnColors: true,
      blendTextTheme: true,
      popupMenuOpacity: 0.85,
    ),
  );
}
