import 'package:flutter/material.dart';

/// Create class for static UI constants, allowing for
/// better memory management of global data

class ThemeConstants {
  static const TextStyle headline4Style = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.25,
    color: Colors.white,
  );
  static const TextStyle buttonStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.25,
    color: Colors.black,
  );
  static const TextStyle subtitle1Style = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.15,
  );
  static const TextStyle subtitle2Style = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
  );
  static const TextStyle bodyText2Style = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.25,
  );
  static const TextStyle captionStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.25,
  );
  //Store a static customTextTheme to be used throughout the app
  static TextTheme customTextTheme = const TextTheme(
    headline4: headline4Style,
    button: buttonStyle,
    subtitle1: subtitle1Style,
    subtitle2: subtitle2Style,
    bodyText2: bodyText2Style,
    caption: captionStyle,
  ).apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
  );
}
