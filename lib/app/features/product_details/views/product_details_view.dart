import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/auth/views/forget_password_view.dart';
import 'package:wasla_app/app/features/product_details/controllers/product_details_controller.dart';
import 'package:wasla_app/app/features/product_details/widgets/floating_button_widget.dart';
import 'package:wasla_app/app/features/product_details/widgets/quantity_button_widget.dart';
import 'package:wasla_app/app/widgets/app_bar_widget.dart';
import 'package:wasla_app/app/widgets/app_button_widget.dart';
import 'package:wasla_app/app/widgets/app_padding.dart';
import 'package:wasla_app/app/widgets/cached_network_image_widget.dart';
import 'package:wasla_app/core/assets_manager.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/extension/space_ext.dart';
import 'package:wasla_app/core/style_manager.dart';
import 'package:wasla_app/core/utils/share_helper.dart';

import '../../home/model/product_model.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductModel product = Get.arguments as ProductModel;
    return Scaffold(
      appBar: AppBarWidget(
        title: product.name,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: AppPadding(
                        vPadding: 8,
                        child: Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children: [
                            CachedImageWidget(
                              clipRadius: 12.r,
                              imageUrl: product.imageUrl,
                              width: Get.width,
                              height: 150.h,
                            ),
                            PositionedDirectional(
                              child: AppPadding(
                                hPadding: 0,
                                vPadding: 8,
                                child: Row(
                                  children: List.generate(
                                    4,
                                        (index) =>
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 8.w),
                                            decoration: BoxDecoration(
                                                color: ColorManager
                                                    .secondaryColor
                                                    .withOpacity(.25),
                                                borderRadius:
                                                BorderRadius.circular(8.r),
                                                border: Border.all(
                                                    color:
                                                    ColorManager.primaryColor,
                                                    width: 2)),
                                            child: CachedImageWidget(
                                              imageUrl: product.imageUrl,
                                              clipRadius: 8.r,
                                              width: 100.w,
                                              height: 80.w,
                                            ),
                                          ),
                                        ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            maxLines: 3,
                            style: getBoldStyle(
                                fontSize: 18,
                                color: ColorManager.textPrimaryColor),
                          ),
                          4.h.height,
                          Text(
                            product.name * 30,
                            style: getRegularStyle(
                                color: ColorManager.textSecondaryColor),
                          ),
                          4.h.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(() {
                                final price = controller.getCustomPriceAsDouble(product.price);

                                return TweenAnimationBuilder<double>(
                                  tween: Tween<double>(
                                    begin: 0, // أو إذا تريد الاحتفاظ بالقيمة القديمة استخدم متغير قديم
                                    end: price,
                                  ),
                                  duration: const Duration(milliseconds: 200),
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
                                    color: ColorManager.secondaryColor
                                        .withOpacity(.25),
                                    borderRadius: BorderRadius.circular(6.r)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    QuantityButtonWidget(
                                      onTap: controller
                                          .incrementProductQuantity,
                                      onLongPress: controller.startIncrementing,
                                      icon: Icons.add,
                                    ),
                                    Obx(
                                          () =>
                                          Text(
                                            '${controller.productQuantity
                                                .value}',
                                          ),
                                    ),
                                    QuantityButtonWidget(
                                      onTap: controller
                                          .decrementProductQuantity,
                                      onLongPress: controller.startDecrementing,
                                      icon: Icons.remove,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              AppPadding(
                vPadding: 10,
                child: AppButtonWidget(
                  text: 'إضافة إلى السلة',
                  onPressed: () {},
                ),
              )
            ],
          ),
          PositionedDirectional(
            top: 40.h,
            child: FloatingButtonWidget(
              icon: Icons.ios_share,
              onTap: () {
                ShareHelper.shareAppWithImage(
                    url: AssetsManager.coverShapeIconIMG);
              },
            ),
          ),
          PositionedDirectional(
            top: 66.h,
            child: FloatingButtonWidget(
              icon: Icons.bookmark_outline,
              isClickable: true,
              isFav: product.isFav,
              clickIcon: Icons.bookmark,
              onTap: () {
                product.isFav.value = !product.isFav.value;
              },
            ),
          ),
        ],
      ),
    );
  }
}
