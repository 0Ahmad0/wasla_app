import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/color_manager.dart';
import '../../../widgets/app_padding.dart';
import '../../../widgets/cached_network_image_widget.dart';
import '../../home/model/product_model.dart';
import '../controllers/product_details_controller.dart';

class ShowProductImageWidget extends GetView<ProductDetailsController> {
  const ShowProductImageWidget({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return AppPadding(
      vPadding: 8,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Obx(
            () => FadeIn(
              key: Key(controller.activeSubImageProductIndex.value.toString()),
              child: CachedImageWidget(
                clipRadius: 12.r,
                imageUrl: controller.activeSubImageProductIndex.value == -1
                    ? product.imageUrl
                    : controller.otherImagesProduct[
                        controller.activeSubImageProductIndex.value],
                width: Get.width,
                height: 130.h,
              ),
            ),
          ),
          PositionedDirectional(
            end: 10.w,
            bottom: 0,
            top: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                controller.otherImagesProduct.length,
                (index) => Obx(() {
                  final bool isActive =
                      controller.activeSubImageProductIndex.value == index;
                  final imageItem = controller.otherImagesProduct[index];
                  return ZoomIn(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8.r),
                      onTap: () =>
                          controller.changeActiveSubImageProductIndex(index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        margin: EdgeInsets.symmetric(
                          vertical: 2.h
                        ),
                        decoration: BoxDecoration(
                          color: ColorManager.secondaryColor.withOpacity(.25),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: CachedImageWidget(
                          imageUrl: imageItem,
                          clipRadius: isActive ? 8.r : 0,
                          width: 50.w,
                          height: 50.w,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
