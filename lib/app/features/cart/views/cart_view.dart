import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/cart/controllers/cart_controller.dart';
import 'package:wasla_app/app/features/cart/widgets/cart_item_widget.dart';
import 'package:wasla_app/app/features/cart/widgets/success_complete_order_dialog_widget.dart';
import 'package:wasla_app/app/widgets/app_bar_widget.dart';
import 'package:wasla_app/app/widgets/app_button_widget.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/dialogs/app_bottom_sheet.dart';
import 'package:wasla_app/core/dialogs/app_dialog.dart';
import 'package:wasla_app/core/extension/space_ext.dart';
import 'package:wasla_app/core/strings_manager.dart';
import 'package:wasla_app/core/style_manager.dart';


class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: StringsManager.cartText,
      ),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<CartController>(
                init: CartController(),
                builder: (context) => ListView.separated(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      separatorBuilder: (_, __) => 8.h.height,
                      itemBuilder: (context, index) {
                        final product = controller.allProducts[index];
                        return CartItemWidget(
                          product: product,
                        );
                      },
                      itemCount: controller.allProducts.length,
                    )),
          ),
          Obx(() {
            final currentTotal = controller.cartTotalPrice;
            final tween = Tween<double>(
              begin: 0,
              end: currentTotal,
            );

            return TweenAnimationBuilder<double>(
              tween: tween,
              duration: const Duration(milliseconds: 500),
              builder: (context, value, child) {
                final parts = controller.getCustomPrice(value);

                return Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: ColorManager.whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: ColorManager.blackColor.withOpacity(.1),
                        blurRadius: 8.sp
                      )
                    ]
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text('المجموع الكلي : ',style: getMediumStyle(
                              fontSize: 18
                            ),),
                          ),
                          Text.rich(
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.ltr,
                            TextSpan(children: [
                              TextSpan(
                                text: '${parts[0]}.',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    color: Colors.black),
                              ),
                              TextSpan(
                                text: parts[1],
                                style: const TextStyle(fontSize: 18, color: Colors.black),
                              ),
                              const TextSpan(
                                text: ' \$',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.red),
                              ),
                            ]),
                          ),
                        ],
                      ),
                      8.h.height,
                      AppButtonWidget(
                        text: 'إتمام الطلب',
                         onPressed: () {
                          AppDialog(
                            widget:const SuccessCompleteOrderDialogWidget()
                          ).showAppDialog(context);
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          })
        ],
      ),
    );
  }
}
