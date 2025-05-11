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
            () => ZoomIn(
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
            child: AppPadding(
              hPadding: 0,
              vPadding: 8,
              child: Row(
                children: List.generate(
                  controller.otherImagesProduct.length,
                  (index) => Obx(() {
                    final bool isActive =
                        controller.activeSubImageProductIndex.value == index;
                    final imageItem = controller.otherImagesProduct[index];
                    return Expanded(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8.r),
                        onTap: () =>
                            controller.changeActiveSubImageProductIndex(index),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          margin: EdgeInsets.symmetric(
                            horizontal: 8.w,
                          ),
                          decoration: BoxDecoration(
                            color: ColorManager.secondaryColor.withOpacity(.25),
                            borderRadius: BorderRadius.circular(8.r),
                            border: isActive
                                ? Border.all(
                                    color: ColorManager.primaryColor, width: 2)
                                : null,
                          ),
                          child: CachedImageWidget(
                            imageUrl: imageItem,
                            clipRadius: isActive ? 8.r : 0,
                            width: 100.w,
                            height: 80.w,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
