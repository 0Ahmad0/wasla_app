import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/product_details/controllers/product_details_controller.dart';
import 'package:wasla_app/app/features/product_details/widgets/quantity_button_widget.dart';

import '../../../../core/color_manager.dart';
import '../../../../core/style_manager.dart';
import '../../home/model/product_model.dart';

class QuantityAndTotalPriceWidget extends GetView<ProductDetailsController> {
  const QuantityAndTotalPriceWidget({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(() {
          final price = controller.getCustomPriceAsDouble(product.price);
          return TweenAnimationBuilder<double>(
            tween: Tween<double>(
              begin: 0,
              // أو إذا تريد الاحتفاظ بالقيمة القديمة استخدم متغير قديم
              end: price,
            ),
            duration: const Duration(milliseconds: 300),
            builder: (context, animatedPrice, child) {
              final parts = controller.getCustomPrice(animatedPrice);

              return RichText(
                textDirection: TextDirection.ltr,
                text: TextSpan(children: [
                  TextSpan(
                    text: '${parts[0]}.',
                    style: getBoldStyle(
                      color: ColorManager.textPrimaryColor,
                      fontSize: 34,
                    ),
                  ),
                  TextSpan(
                    text: parts[1],
                    style: getRegularStyle(
                      color: ColorManager.textPrimaryColor,
                      fontSize: 20,
                    ),
                  ),
                  TextSpan(
                    text: ' \$',
                    style: getBoldStyle(
                      color: ColorManager.errorColor,
                      fontSize: 26,
                    ),
                  ),
                ]),
              );
            },
          );
        }),
        Container(
          decoration: BoxDecoration(
              color: ColorManager.secondaryColor.withOpacity(.25),
              borderRadius: BorderRadius.circular(6.r)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              QuantityButtonWidget(
                onTap: controller.incrementProductQuantity,
                onLongPress: controller.startIncrementing,
                icon: Icons.add,
              ),
              Obx(
                    () => Text(
                  '${controller.productQuantity.value}',
                ),
              ),
              QuantityButtonWidget(
                onTap: controller.decrementProductQuantity,
                onLongPress: controller.startDecrementing,
                icon: Icons.remove,
              )
            ],
          ),
        ),
      ],
    );
  }
}
