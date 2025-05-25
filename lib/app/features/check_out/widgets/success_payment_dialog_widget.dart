import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:wasla_app/app/widgets/app_button_widget.dart';
import 'package:wasla_app/core/assets_manager.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/extension/space_ext.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/style_manager.dart';
import '../../../widgets/app_padding.dart';

class SuccessPaymentDialogWidget extends StatelessWidget {
  const SuccessPaymentDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AppPadding(
        hPadding: 12,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Material(
                color: ColorManager.whiteColor,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      8.h.height,
                      Lottie.asset(
                        AssetsManager.successPaymentIMG,
                        width: 300.sp,
                        height: 300.sp
                      ),
                      8.h.height,
                      Text(
                        'شكرًا لطلبك🫶',
                        textAlign: TextAlign.center,
                        style: getBoldStyle(color: ColorManager.primaryColor),
                      ).fadeIn(),
                      2.h.height,
                      AppPadding(
                        vPadding: 0,
                        child: Text(
                          'يمكنك متابعة حالة طلبك بسهولة من الصفحة الرئيسية للاطلاع على آخر التحديثات😎',
                          textAlign: TextAlign.center,
                          style: getLightStyle(
                            color: ColorManager.textSecondaryColor,
                          ),
                        ).fadeIn(),
                      ),
                      10.h.height,
                      AppPadding(
                        vPadding: 0,
                        child: AppButtonWidget(
                          text: 'العودة للصفحة الرئيسية',
                          onPressed: () => Get.offAllNamed(AppRoutes.navbar),
                        ).fadeInUp(),
                      ),
                      10.h.height,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
