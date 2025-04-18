import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wasla_app/core/const_manager.dart';
import 'package:wasla_app/core/strings_manager.dart';

import 'core/routes/app_pages.dart';
import 'core/routes/app_routes.dart';
import 'core/theme_manager.dart';

void main() async{
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(ConstManager.designWidth, ConstManager.designWidth),
      minTextAdapt: true,
      builder: (context,child) {
        return GetMaterialApp(
          locale: const Locale('ar'),
          title: StringsManager.appName,
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.splash,
          getPages: AppPages.pages,
          unknownRoute: AppPages.pages.last,
          defaultTransition: Transition.fade,
          theme: ThemeManager.myTheme,

        );
      }
    );
  }
}
