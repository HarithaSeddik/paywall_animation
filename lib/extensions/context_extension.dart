import 'package:flutter/widgets.dart';

/// Why have this extension? in order to get more accurate UI components
/// on all screens, we want to give heights and width as multipliers of the
/// Figma UI design phone screen size, and one of the best ways to access this
/// is through extending the BuildContext library

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;
  double get figmaScreenHeight => 812; //pixels
  double get figmaScreenWidth => 375; //pixels

  //returns height as a custom multiplier ratio of available screen height
  double customHeight(double multiplier) {
    return mediaQuery.size.height * multiplier;
  }

  //returns height as a multiplier ratio of available height based on current Figma screen
  double dynamicHeight(double inputHeight) {
    return mediaQuery.size.height * (inputHeight / figmaScreenHeight);
  }

  //returns width as a multiplier ratio of available screen width
  double customWidth(double multiplier) {
    return mediaQuery.size.width * multiplier;
  }

  //returns width as a multiplier ratio of available width based on current Figma screen
  double dynamicWidth(double inputWidth) {
    return mediaQuery.size.width * (inputWidth / figmaScreenWidth);
  }
}
