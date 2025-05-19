import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as map;
import 'package:intl/date_symbol_data_local.dart';
import 'package:photo_manager/photo_manager.dart' as photoManager;
import 'package:wasla_app/app/features/settings/controllers/settings_controller.dart';
import 'package:wasla_app/core/const_manager.dart';
import 'package:wasla_app/core/strings_manager.dart';

import 'app/features/my_address/model/my_address_model.dart';
import 'app/widgets/app_bar_widget.dart';
import 'app/widgets/app_button_widget.dart';
import 'core/color_manager.dart';
import 'core/routes/app_pages.dart';
import 'core/routes/app_routes.dart';
import 'core/style_manager.dart';
import 'core/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    initializeDateFormatting(),
    photoManager.PhotoManager.setIgnorePermissionCheck(false), // مهم لـ iOS
    ScreenUtil.ensureScreenSize(),
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]),
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(SettingsController());
    return ScreenUtilInit(
        designSize: const Size(
          ConstManager.designWidth,
          ConstManager.designWidth,
        ),
        minTextAdapt: true,
        builder: (context, child) {
          return Obx(() => GetMaterialApp(
                locale: const Locale('ar'),
                title: StringsManager.appName,
                debugShowCheckedModeBanner: false,

                initialRoute: AppRoutes.splash,
                getPages: AppPages.pages,
                // unknownRoute: AppPages.pages.last,
                defaultTransition: Transition.rightToLeftWithFade,
                theme: ThemeManager.myTheme,
                darkTheme: ThemeManager.myTheme.copyWith(
                  brightness: Brightness.dark,
                  textTheme: GoogleFonts.tajawalTextTheme(),
                ),
                themeMode: themeController.isDarkMode.value
                    ? ThemeMode.dark
                    : ThemeMode.light,
              ));
        });
  }
}
