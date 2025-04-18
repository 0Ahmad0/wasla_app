import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/auth/views/forget_password_view.dart';
import 'package:wasla_app/app/features/home/widgte/custom_home_appbar.dart';
import 'package:wasla_app/app/widgets/app_padding.dart';
import 'package:wasla_app/core/assets_manager.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/extension/space_ext.dart';
import 'package:wasla_app/core/strings_manager.dart';
import 'package:wasla_app/core/style_manager.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_shopping_cart, color: ColorManager.whiteColor),
      ),
      appBar: CustomHomeAppbar(
        height: 150,
        childW: AppPadding(
          vPadding: 0,
          hPadding: 16,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      10.h.height,
                      Text(
                        StringsManager.welcomeText,
                        style: getMediumStyle(
                            color: ColorManager.whiteColor, fontSize: 16),
                      ),
                      4.h.height,
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width / 1.5,
                        child: Text(
                          'أحمد الحريري 😎',
                          maxLines: 1,
                          style: getBoldStyle(
                              fontSize: 22, color: ColorManager.whiteColor),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 26.sp,
                        backgroundImage: AssetImage(
                          'assets/images/img.png',
                        ),
                      ),
                      10.w.width,
                      Icon(
                        Icons.notifications,
                        color: ColorManager.whiteColor,
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
