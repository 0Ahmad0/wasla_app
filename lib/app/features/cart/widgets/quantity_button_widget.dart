import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/cart/controllers/cart_controller.dart';
import 'package:wasla_app/app/widgets/app_padding.dart';

import '../../../../core/color_manager.dart';

class QuantityButtonWidget extends GetView<CartController> {
  const QuantityButtonWidget(
      {super.key, required this.onLongPress, required this.icon});

  final VoidCallback onLongPress;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => onLongPress(),
      onTapCancel: () => controller.stopCounter(),
      onTapUp: (details) => controller.stopCounter(),
      child: AppPadding(
        hPadding: 8,
        vPadding: 4,
        child: Container(
          padding: EdgeInsets.all(10.sp),
          decoration: BoxDecoration(
            color: ColorManager.primaryColor,
            borderRadius: BorderRadius.circular(4.r)
          ),
          child: Icon(
            icon,
            color: ColorManager.whiteColor,
            size: 14.sp,
          ),
        ),
      ),
    );
  }
}
