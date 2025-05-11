import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/product_details/controllers/product_details_controller.dart';
import 'package:wasla_app/app/widgets/app_padding.dart';

import '../../../../core/color_manager.dart';

class QuantityButtonWidget extends GetView<ProductDetailsController> {
  const QuantityButtonWidget(
      {super.key,
      required this.onTap,
      required this.onLongPress,
      required this.icon});

  final VoidCallback onTap;
  final VoidCallback onLongPress;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onTapDown: (details)=> onLongPress(),
      onTapCancel: ()=> controller.stopCounter(),
      onTapUp: (details)=> controller.stopCounter(),
      child: AppPadding(
        hPadding: 8,
        vPadding: 4,
        child: CircleAvatar(
          radius: 18.sp,
          backgroundColor: ColorManager.primaryColor,
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
