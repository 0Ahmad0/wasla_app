import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:wasla_app/app/features/coupons/controllers/coupons_controller.dart';
import 'package:wasla_app/app/widgets/app_padding.dart';
import 'package:wasla_app/core/assets_manager.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/extension/space_ext.dart';
import 'package:wasla_app/core/style_manager.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../widgets/app_button_widget.dart';

class SuccessAppliedCouponDialogWidget extends GetView<CouponsController> {
  const SuccessAppliedCouponDialogWidget({super.key, required this.discount});

  final int discount;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 14.w,
                ),
                decoration: BoxDecoration(
                    color: ColorManager.whiteColor,
                    borderRadius: BorderRadius.circular(12.r)),
                child: AppPadding(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        AssetsManager.giftIMG,

                      ),
                      10.h.height,
                      Text.rich(
                        textAlign: TextAlign.center,
                        style:
                            getRegularStyle(color: ColorManager.textPrimaryColor)
                                .copyWith(height: 2),
                        TextSpan(children: [
                          TextSpan(
                            text: 'تهانينا لقد حصلت على خصم',
                            style: getRegularStyle(
                                fontSize: 20,
                                color: ColorManager.textPrimaryColor),
                          ),
                          TextSpan(
                            text: '\n${discount}%',
                            style: getBoldStyle(
                              fontSize: 40,
                              color: ColorManager.errorColor,
                            ),
                          ),

                        ]),
                      ),
                      AppButtonWidget(
                        text: 'العودة لصفحة الدفع',
                        onPressed: () => Get.back(),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional.center,
                child: ConfettiWidget(
                  confettiController: controller.confettiController,
                  blastDirectionality: BlastDirectionality.explosive,
                  emissionFrequency: 0.01,
                  // نادر
                  numberOfParticles: 80,
                  // كثير في نفس اللحظة
                  gravity: 0.4,
                  shouldLoop: false,
                  colors: Colors.accents,
                ),
              ),
              PositionedDirectional(
                start: 20.w,
                top: 4.h,
                child: IconButton.outlined(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.close,
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}
