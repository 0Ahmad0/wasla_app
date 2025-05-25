import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/home/controllers/home_controller.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/extension/space_ext.dart';
import 'package:wasla_app/core/style_manager.dart';

class CategoryItemWidget extends GetView<HomeController> {
  const CategoryItemWidget({
    super.key,
    required this.imageURL,
    required this.name,
    required this.index,
  });

  final String imageURL;
  final String name;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (context) => Column(
              children: [
                InkWell(
                  splashColor: ColorManager.transparentColor,
                  borderRadius: BorderRadius.circular(
                    controller.isCurrentCategoryIndex(index) ?  100.r: 8.r,
                  ),
                  onTap: () => controller.changeCategoryIndex(index),
                  child: AnimatedContainer(
                    width: 70.sp,
                    height: 70.sp,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(22.sp),
                    duration: const Duration(milliseconds: 300),
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: controller.isCurrentCategoryIndex(index)
                            ? ColorManager.secondaryColor
                            : ColorManager.transparentColor,
                      ),
                      color: controller.isCurrentCategoryIndex(index)
                          ? ColorManager.transparentColor
                          : ColorManager.secondaryColor.withOpacity(.1),
                      borderRadius: BorderRadius.circular(
                          controller.isCurrentCategoryIndex(index)
                              ? 100.r
                              : 8.r),
                    ),
                    // CachedImageWidget(
                    // imageUrl: imageURL,
                    // width: 70.sp,
                    // height: 70.sp,
                    // )
                    child: SvgPicture.network(
                      imageURL,
                      width: 28.sp,
                      height: 28.sp,
                      colorFilter: ColorFilter.mode(
                        controller.isCurrentCategoryIndex(index)
                            ? ColorManager.primaryColor
                            : ColorManager.notificationDateTimeGrayColor,
                        BlendMode.srcIn,
                      ),
                      placeholderBuilder: (context) => SizedBox(
                        width: 28.sp,
                        height: 28.sp,
                        child: Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              controller.isCurrentCategoryIndex(index)
                                  ? ColorManager.primaryColor
                                  : ColorManager.notificationProgressColor,
                            ),
                          ),
                        ),
                      ),
                      errorBuilder: (context, error, stackTrace) => Icon(
                        Icons.broken_image,
                        color: Colors.redAccent,
                        size: 24.sp,
                      ),

                    ),
                  ),
                ),
                4.h.height,
                FittedBox(
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: getLightStyle(
                      color: ColorManager.textPrimaryColor,
                    ),
                  ),
                )
              ],
            ));
  }
}
