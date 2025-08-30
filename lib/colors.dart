import 'package:flutter/material.dart';

class AppColorConst {
  AppColorConst._privateConstructor();

  static final AppColorConst _instance = AppColorConst._privateConstructor();

  factory AppColorConst() {
    return _instance;
  }

  // Three custom shades of primary color
  static const Color primary = Color(0xFF4B3A2F);
  static const Color secondary = Color(0xFFD5B295);
  static const Color secondaryLight = Color(0xFFEBCFB8); //border
  static const Color primaryDark = Color(0xFF454545);
  static const Color errorColor = Color(0xFFb90000);
  static const Color blueColor = Color(0xFF1983FC);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color transparent = Colors.transparent;
  static const Color scaffoldBackgroundColor = Color(0xFFFEF6F2);
  // extra colors
  static const Color gradient1 = Color(0xFFFFF7F3);
  static const Color gradient2 = Color(0xFFF8E1D4);

  //shimmer colors
  static Color shimmerBaseColor = Colors.grey[300]!;
  static Color shimmerHighlightColor = Colors.grey[100]!;

  //text colors
  static const Color textColor = Color(0xFF212121);

  //other colors
  static const Color budgetCardSliderColor = Color(0xFFA48E82);

  static const Color redColor = Color(0xFFFF0000);

  //grey colors
  static const Color greyColor = Color(0xFFCCCCCC);
  static const Color greyColor2 = Color(0xFF8CA0AB);
  static const Color greyColor3 = Color(0xFF666666);
}
