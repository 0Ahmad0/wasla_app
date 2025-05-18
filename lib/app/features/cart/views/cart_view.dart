import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/cart/controllers/cart_controller.dart';
import 'package:wasla_app/app/features/cart/widgets/cart_item_widget.dart';
import 'package:wasla_app/app/widgets/app_bar_widget.dart';
import 'package:wasla_app/app/widgets/app_button_widget.dart';
import 'package:wasla_app/core/extension/space_ext.dart';
import 'package:wasla_app/core/strings_manager.dart';

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
                builder: (context)=>ListView.separated(
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
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text.rich(
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.ltr,
                        TextSpan(children: [
                          TextSpan(
                            text: 'المجموع الكلي:\n',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black),
                          ),
                          TextSpan(
                            text: '${parts[0]}.',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.black),
                          ),
                          TextSpan(
                            text: parts[1],
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                          TextSpan(
                            text: ' \$',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.red),
                          ),
                        ]),
                      ),
                      const SizedBox(height: 8),
                      AppButtonWidget(
                        text: 'إتمام الطلب',
                        onPressed: () {
                          // تنفيذ الطلب هنا
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
