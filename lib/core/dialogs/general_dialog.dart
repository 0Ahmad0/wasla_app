import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/auth/views/forget_password_view.dart';
import 'package:wasla_app/core/assets_manager.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/extension/space_ext.dart';
import 'package:wasla_app/core/routes/app_routes.dart';
import 'package:wasla_app/core/strings_manager.dart';
import 'package:wasla_app/core/style_manager.dart';

class GeneralAppDialog extends StatelessWidget {
  const GeneralAppDialog({
    super.key,
    required this.title,
    this.okText = 'نعم',
    this.cancelText = 'إلغاء',
    this.cancelOnTap,
    this.okOnTap,
    this.generalColor = ColorManager.primaryColor,
    this.cancelColor = ColorManager.textSecondaryColor,
    this.okColor = ColorManager.primaryColor,
    this.iconColor = ColorManager.whiteColor,
    this.icon = AssetsManager.menuLogoutIcon,
  });

  final String title;
  final String? okText;
  final String? icon;
  final String? cancelText;
  final VoidCallback? cancelOnTap;
  final VoidCallback? okOnTap;
  final Color? generalColor;
  final Color? cancelColor;
  final Color? okColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorManager.transparentColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: ColorManager.whiteColor,
              borderRadius: BorderRadius.circular(
                6.r,
              ),
            ),
            child: Column(
              children: [
                10.h.height,
                Tada(
                  delay: const Duration(milliseconds: 600),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ZoomInDown(
                        child: SvgPicture.asset(
                          AssetsManager.shapeDialogStarsIMG,
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            generalColor!,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      SvgPicture.asset(
                        AssetsManager.coverShapeIconIMG,
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          generalColor!,
                          BlendMode.srcIn,
                        ),
                      ),
                      SvgPicture.asset(
                        icon!,
                        fit: BoxFit.cover,
                        width: 30.sp,
                        height: 30.sp,
                        colorFilter: ColorFilter.mode(
                          iconColor!,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                ),
                10.h.height,
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: getMediumStyle(
                      color: ColorManager.textPrimaryColor, fontSize: 18),
                ),
                6.h.height,
                Row(
                  children: [
                    TextButton(
                        onPressed: okOnTap ?? () => Get.back(),
                        child: Text(
                          okText ?? '',
                          style: getRegularStyle(
                              color: generalColor ?? okColor!, fontSize: 18),
                        )),
                    TextButton(
                      onPressed: cancelOnTap ?? () => Get.back(),
                      child: Text(
                        cancelText ?? '',
                        style: getRegularStyle(
                          color: cancelColor!,
                            fontSize: 18

                        ),
                      ),
                    )
                  ],
                ),
                4.h.height,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
