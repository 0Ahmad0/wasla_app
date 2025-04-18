import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/style_manager.dart';

import '../../core/color_manager.dart';

class AppButtonWidget extends StatelessWidget {
  const AppButtonWidget(
      {super.key,
      required this.text,
      required this.onPressed,
      this.backgroundColor = ColorManager.primaryColor});

  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(
            color:  backgroundColor.withOpacity(.2),
            blurRadius: 30.sp,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child:
      ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor),
          onPressed: onPressed,
          child: Text(
            text,
            style: getRegularStyle(
                color: ColorManager.whiteColor, fontSize: 18.sp),
          )),
    );
  }
}
