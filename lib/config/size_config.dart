import 'package:flutter/material.dart';

class SizeConfig {
  MediaQueryData? _mediaQueryData;
  double? screenWidth;
  double? screenHeight;
  Size? defaultSize;
  Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData!.size.height;
    screenWidth = _mediaQueryData!.size.width;
    orientation = _mediaQueryData!.orientation;
    defaultSize = _mediaQueryData!.size;
  }
}

// Get the proportionate height as per screen size
double proportionalSizeHeight(double inputHeight) {
  double screenHeight = SizeConfig().screenHeight!;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double proportionalSizeWidth(double inputWidth) {
  double screenWidth = SizeConfig().screenWidth!;
  // 375 is the layout width that designer use
  return inputWidth <= 12
      ? inputWidth
      : screenWidth < 400
          ? inputWidth - 3
          : inputWidth;
}
