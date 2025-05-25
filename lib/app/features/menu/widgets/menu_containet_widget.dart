import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wasla_app/core/color_manager.dart';

class MenuContainerWidget extends StatelessWidget {
  const MenuContainerWidget({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      key: UniqueKey(),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 4.h
        ),
        decoration: BoxDecoration(
          color: ColorManager.menuGrayColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: child,
      ),
    );
  }
}
