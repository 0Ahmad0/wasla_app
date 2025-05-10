import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wasla_app/app/widgets/app_padding.dart';

import '../../../../core/color_manager.dart';

class QuantityButtonWidget extends StatelessWidget {
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
      onLongPress: onLongPress,
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
