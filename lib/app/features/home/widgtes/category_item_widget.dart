import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/home/controllers/home_controller.dart';
import 'package:wasla_app/app/widgets/cached_network_image_widget.dart';
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
        builder: (context)=>Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(
            controller.isCurrentCategoryIndex(index) ? 12.r : 100.r,
          ),
          onTap: () => controller.changeCategoryIndex(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: ColorManager.secondaryColor.withOpacity(.25),
              borderRadius: BorderRadius.circular(
                  controller.isCurrentCategoryIndex(index) ? 100.r : 8.r),
            ),
            child: CachedImageWidget(
              imageUrl: imageURL,
              width: 70.sp,
              height: 70.sp,
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
