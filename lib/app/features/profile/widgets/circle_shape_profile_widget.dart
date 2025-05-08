import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/extension/space_ext.dart';
import 'package:wasla_app/core/style_manager.dart';

class CircleShapeProfileWidget extends StatelessWidget {
  const CircleShapeProfileWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(100.r),
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(18.sp),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: ColorManager.notificationDateTimeGrayColor,
                    width: .8)),
            child: Icon(icon),
          ),
        ),
        4.h.height,
        Text(
          title,
          style: getBoldStyle(color: ColorManager.textSecondaryColor),
        )
      ],
    );
  }
}
