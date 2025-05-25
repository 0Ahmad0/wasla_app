import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wasla_app/core/color_manager.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (Navigator.canPop(context)) {
          Get.back();
        }
      },

      child: Container(
        alignment: Alignment.center,
        width: 46.w,
        height: 46.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
                color: ColorManager.borderBackButtonColor.withOpacity(.15))),
        child: Icon(
          Icons.arrow_back_ios_rounded,
          color: ColorManager.whiteColor,
          size: 24.sp,
        ),
      ),
    );
  }
}
