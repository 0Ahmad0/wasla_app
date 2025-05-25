import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wasla_app/core/color_manager.dart';

class AuthSquareWidget extends StatelessWidget {
  const AuthSquareWidget({super.key, required this.icon});

  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      width: 100.w,
      height: 100.w,
      decoration: BoxDecoration(
        color: ColorManager.secondaryColor.withOpacity(.25),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Image.asset(
        icon,
        width: 70.w,
        height: 70.w,
      ),
    );
  }
}
