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
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        )),
        minimumSize: WidgetStatePropertyAll(
          Size(double.maxFinite, 30.h),
        ),
      )),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          overlayColor: WidgetStatePropertyAll(
              ColorManager.secondaryColor.withOpacity(.1)),
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
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r))),
      checkboxTheme: CheckboxThemeData(
        fillColor: const WidgetStatePropertyAll(ColorManager.transparentColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      iconTheme:  IconThemeData(color: ColorManager.primaryColor),
      radioTheme:  RadioThemeData(
        fillColor: WidgetStatePropertyAll(ColorManager.primaryColor),
      ),
      listTileTheme: ListTileThemeData(
        contentPadding: EdgeInsetsDirectional.only(start: 24.w, end: 10.w),
      ),
      switchTheme: SwitchThemeData(
        // trackColor: WidgetStatePropertyAll(ColorManager.primaryColor),
        thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return ColorManager.primaryColor; // لون الكرة عند التفعيل
          }
          if(states.contains(WidgetState.disabled)){
            return ColorManager.chatContainerColor; // لون الكرة عند التفعيل
          }
          return ColorManager.notificationDateTimeGrayColor; // لون الكرة عند عدم التفعيل
        }),
        trackColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return ColorManager.secondaryColor.withOpacity(0.5); // لون المسار عند التفعيل
          }
          return ColorManager.chatContainerColor; // لون الكرة عند عدم التفعيل
          // لون المسار عند عدم التفعيل
        }),
      ),
      scaffoldBackgroundColor: ColorManager.whiteColor);
}
