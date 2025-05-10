import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wasla_app/core/color_manager.dart';

class FloatingButtonWidget extends StatelessWidget {
  const FloatingButtonWidget({
    super.key,
    this.onTap,
    required this.icon,
    this.isClickable = false,
    this.clickIcon,
    this.clickIconColor,
    this.isFav,
  });

  final VoidCallback? onTap;
  final IconData icon;
  final bool? isClickable;
  final RxBool? isFav;
  final IconData? clickIcon;
  final Color? clickIconColor;

  @override
  Widget build(BuildContext context) {
    return SlideInDown(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: 60.w,
          height: 22.h,
          decoration: BoxDecoration(
            color: ColorManager.primaryColor.withOpacity(.75),
            // borderRadius: BorderRadiusDirectional.horizontal(
            //   end: Radius.circular(
            //     14.r,
            //   ),
            // ),
          ),
          child: isClickable!
              ? Obx(()=>HeartBeat(
            key: Key(isFav.toString()),
            child: Icon(
              isFav!.value ? clickIcon : icon,
              color:
              isFav!.value ? ColorManager.errorColor : ColorManager.whiteColor,
            ),
          ))
              : Icon(
                  icon,
                  color: ColorManager.whiteColor,
                ),
        ),
      ),
    );
  }
}
