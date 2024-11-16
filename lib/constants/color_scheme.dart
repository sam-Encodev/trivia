import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

bool useMaterial3 = true;
const appBarBackground = Color.fromARGB(255, 0, 0, 0);
const scaffoldBackground = Color.fromARGB(255, 0, 0, 0);
const FlexScheme _scheme = FlexScheme.mandyRed;
final String? _fontFamily = GoogleFonts.sora().fontFamily;

const TextTheme _textTheme = TextTheme(
  displayLarge: TextStyle(fontSize: 57),
  displayMedium: TextStyle(fontSize: 45),
  displaySmall: TextStyle(fontSize: 36),
  headlineLarge: TextStyle(fontSize: 32),
  headlineMedium: TextStyle(fontSize: 28),
  headlineSmall: TextStyle(fontSize: 24),
  titleLarge: TextStyle(fontSize: 22),
  titleMedium: TextStyle(fontSize: 16),
  titleSmall: TextStyle(fontSize: 14),
  bodyLarge: TextStyle(fontSize: 16),
  bodyMedium: TextStyle(fontSize: 14),
  bodySmall: TextStyle(fontSize: 12),
  labelLarge: TextStyle(fontSize: 14, letterSpacing: 0.5),
  labelMedium: TextStyle(fontSize: 12),
  labelSmall: TextStyle(fontSize: 11),
);

sealed class Themer {
  // The defined light theme.
  static ThemeData light = FlexThemeData.light(
    scheme: _scheme,
    useMaterial3: useMaterial3,
    appBarBackground: appBarBackground,
    scaffoldBackground: scaffoldBackground,
    fontFamily: _fontFamily,
    textTheme: _textTheme,
    primaryTextTheme: _textTheme,
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      useM2StyleDividerInM3: true,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      alignedDropdown: true,
      navigationRailUseIndicator: true,
      navigationRailLabelType: NavigationRailLabelType.all,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );
  // The defined dark theme.
  static ThemeData dark = FlexThemeData.dark(
    scheme: _scheme,
    useMaterial3: useMaterial3,
    scaffoldBackground: scaffoldBackground,
    fontFamily: _fontFamily,
    textTheme: _textTheme,
    primaryTextTheme: _textTheme,
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      blendOnColors: true,
      useM2StyleDividerInM3: true,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      alignedDropdown: true,
      navigationRailUseIndicator: true,
      navigationRailLabelType: NavigationRailLabelType.all,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );
}
