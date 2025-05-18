import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wasla_app/app/features/about/views/about_view.dart';
import 'package:wasla_app/core/color_manager.dart';

class SwipeItemWidget extends StatelessWidget {
  const SwipeItemWidget({
    super.key,
    required this.color,
    required this.icon,
    this.iconColor = ColorManager.whiteColor,
    this.alignment = AlignmentDirectional.center,
  });

  final Color color;
  final Color? iconColor;
  final IconData icon;
  final AlignmentDirectional? alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      color: color,
      child: Icon(icon, color: iconColor),
    );
  }
}
