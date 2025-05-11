import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/style_manager.dart';

class MenuItemWidget extends StatelessWidget {
  const MenuItemWidget(
      {super.key,
      required this.title,
      required this.icon,
      this.route,
      this.onTap});

  final String title;
  final String icon;
  final String? route;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: () {
        if (onTap != null) {
          onTap!();
        } else {
          Get.toNamed(route!);
        }
      },
      leading: CircleAvatar(
        backgroundColor: ColorManager.whiteColor,
        child: SvgPicture.asset(
          icon,
          width: 18.sp,
          height: 18.sp,

        ),
      ),
      title: Text(
        title,
        style:
            getRegularStyle(fontSize: 18, color: ColorManager.textPrimaryColor),
      ),
      trailing: Icon(
        Get.locale!.languageCode == 'ar'?Icons.keyboard_arrow_left:Icons.keyboard_arrow_right,
        color: ColorManager.menuArrowColor,
        size: 22.sp,
      ),
    );
  }
}
