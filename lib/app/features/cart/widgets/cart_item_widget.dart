import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/cart/controllers/cart_controller.dart';
import 'package:wasla_app/app/features/cart/widgets/swipe_item_widget.dart';
import 'package:wasla_app/app/features/home/model/product_model.dart';
import 'package:wasla_app/app/widgets/cached_network_image_widget.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/dialogs/app_dialog.dart';
import 'package:wasla_app/core/extension/space_ext.dart';

import '../../../../core/style_manager.dart';
import 'delete_product_from_cart_dialog_widget.dart';
import 'quantity_button_widget.dart';

class CartItemWidget extends GetView<CartController> {
  const CartItemWidget({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(product.id),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd ||
            direction == DismissDirection.endToStart) {
          {
            final confirmed = AppDialog(
              widget: const DeleteProductFromCartDialog(),
            ).showAppDialog(context);
            return confirmed;
          }
        }
      },
      onDismissed: (_) {
        controller.removeProduct(product.id);
        Get.snackbar("تم الحذف", "تم حذف العنصر بنجاح");
      },
      background: const SwipeItemWidget(
        color: ColorManager.errorColor,
        icon: Icons.delete,
        alignment: AlignmentDirectional.centerStart,
      ),
      secondaryBackground: const SwipeItemWidget(
        color: ColorManager.errorColor,
        icon: Icons.delete,
        alignment: AlignmentDirectional.centerEnd,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
        margin: EdgeInsets.symmetric(
          horizontal: 12.w,
        ),
        decoration: BoxDecoration(
          color: ColorManager.chatContainerColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            CachedImageWidget(
              imageUrl: product.imageUrl,
              clipRadius: 10.r,
              height: 110.sp,
              width: 100.sp,
            ),
            8.w.width,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name),
                  Text(
                    product.name * 30,
                    maxLines: 2,
                    style: getLightStyle(),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            8.w.width,
            Obx(() {
              final quantity = controller.getQuantity(product.id);
              return Container(
                decoration: BoxDecoration(
                  color: ColorManager.secondaryColor.withOpacity(.25),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Column(
                  children: [
                    QuantityButtonWidget(
                      onLongPress: () =>
                          controller.startIncrementing(product.id),
                      icon: Icons.add,
                    ),
                    Text('$quantity'),
                    QuantityButtonWidget(
                      onLongPress: () =>
                          controller.startDecrementing(product.id),
                      icon: Icons.remove,
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
