import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'color_manager.dart';


class FontWeightManager {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight bold = FontWeight.w700;
}

class FontSize {
  static const double s12 = 12.0;
  static const double s14 = 14.0;
  static const double s16 = 16.0;
  static const double s18 = 18.0;
  static const double s20 = 20.0;
  static const double s24 = 24.0;
  static const double s30 = 30.0;
}

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontSize: fontSize.sp,
    fontWeight: fontWeight,
    color: color,
  );
}

// Regular style
TextStyle getRegularStyle({
  double fontSize = FontSize.s14,
  Color color = ColorManager.blackColor,
}) {
  return _getTextStyle(
    fontSize.sp,
    FontWeightManager.regular,
    color,
  );
}

// Medium style
TextStyle getMediumStyle({
  double fontSize = FontSize.s14,
  Color color = ColorManager.blackColor,
}) {
  return _getTextStyle(
    fontSize.sp,
    FontWeightManager.medium,
    color,
  );
}

// Bold style
TextStyle getBoldStyle({
  double fontSize = FontSize.s16,
  Color color = ColorManager.blackColor,
}) {
  return _getTextStyle(
    fontSize.sp,
    FontWeightManager.bold,
    color,
  );
}

// Light style
TextStyle getLightStyle({
  double fontSize = FontSize.s14,
  Color color = ColorManager.blackColor,
}) {
  return _getTextStyle(
    fontSize.sp,
    FontWeightManager.light,
    color,
  );
}
