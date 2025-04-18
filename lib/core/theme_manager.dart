import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wasla_app/core/extension/material_color_ext.dart';

import 'color_manager.dart';

class ThemeManager {
  static final _font = GoogleFonts.notoSansArabic();

  static final myTheme = ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              )
          ),
      minimumSize:  WidgetStatePropertyAll(
        Size(double.maxFinite, 30.h),
      ),

    )),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStatePropertyAll(ColorManager.secondaryColor.withOpacity(.1)),
        textStyle: WidgetStatePropertyAll(
          TextStyle(
            color: ColorManager.blackColor,
            fontFamily: _font.fontFamily,
          ),
        ),
      ),
    ),
    fontFamily: _font.fontFamily,
    primaryColor: ColorManager.primaryColor,
    primarySwatch: ColorManager.primaryColor.toMaterialColor(),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorManager.primaryColor,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: const WidgetStatePropertyAll(ColorManager.transparentColor),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),
    iconTheme: const IconThemeData(color: ColorManager.primaryColor),
    scaffoldBackgroundColor: ColorManager.whiteColor
  );
}
