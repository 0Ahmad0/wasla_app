import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:wasla_app/app/features/auth/views/forget_password_view.dart';
import 'package:wasla_app/app/features/product_details/controllers/product_details_controller.dart';
import 'package:wasla_app/app/features/product_details/widgets/floating_button_widget.dart';
import 'package:wasla_app/app/features/product_details/widgets/quantity_button_widget.dart';
import 'package:wasla_app/app/features/product_details/widgets/rating_overview_widget.dart';
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
import '../widgets/quantity_and_total_price_widget.dart';
import '../widgets/show_product_image_widget.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductModel product = controller.product!;
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
                    // SliverToBoxAdapter(
                    //   child: AppPadding(
                    //     vPadding: 0,
                    //     child: Row(
                    //       children: [
                    //         FloatingButtonWidget(
                    //           icon: Icons.ios_share,
                    //           onTap: () {
                    //             ShareHelper.shareImageFromUrl(
                    //                 imageUrl: product.imageUrl, shareText: product.name);
                    //           },
                    //         ),
                    //         8.w.width,
                    //         FloatingButtonWidget(
                    //           icon: Icons.bookmark_outline,
                    //           isClickable: true,
                    //           isFav: product.isFav,
                    //           clickIcon: Icons.bookmark,
                    //           onTap: () {
                    //             product.isFav.value = !product.isFav.value;
                    //           },
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),

                    SliverToBoxAdapter(
                      child: ShowProductImageWidget(
                        product: product,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: AppPadding(
                        vPadding: 0,
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
                            ReadMoreText(
                              product.name * 30,
                              trimMode: TrimMode.Line,
                              trimLines: 4,
                              style: getRegularStyle(
                                  color: ColorManager.textSecondaryColor),
                              trimCollapsedText: 'عرض المزيد...',
                              trimExpandedText: ' عرض أقل...',
                              moreStyle: getBoldStyle(
                                  color: ColorManager.primaryColor),
                              lessStyle: getBoldStyle(),
                            ),
                            4.h.height,
                            Text(
                              'القياسات',
                              style: getBoldStyle(
                                  fontSize: 18,
                                  color: ColorManager.textPrimaryColor),
                            ),
                            4.h.height,
                            Row(
                              children: List.generate(
                                  controller.sizesProductList.length, (index) {
                                final item = controller.sizesProductList[index];
                                return Obx(() {
                                  final isSelected =
                                      controller.sizeSelected.value == index;
                                  return InkWell(
                                    overlayColor: const WidgetStatePropertyAll(
                                        ColorManager.transparentColor),
                                    onTap: () {
                                      controller.sizeSelected.value = index;
                                    },
                                    borderRadius: BorderRadius.circular(4.r),
                                    child: AnimatedContainer(
                                      margin: REdgeInsetsDirectional.only(
                                        end: 12.w,
                                      ),
                                      alignment: AlignmentDirectional.center,
                                      width: 40.w,
                                      height: 40.w,
                                      padding: EdgeInsets.all(10.sp),
                                      duration: const Duration(
                                        milliseconds: 400,
                                      ),
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? ColorManager.primaryColor
                                            : ColorManager.whiteColor,
                                        borderRadius:
                                            BorderRadius.circular(4.r),
                                        border: !isSelected
                                            ? Border.all(
                                                color: ColorManager
                                                    .notificationDateTimeGrayColor,
                                                width: .5,
                                              )
                                            : null,
                                      ),
                                      child: FittedBox(
                                        child: Text(
                                          item,
                                          style: getRegularStyle(
                                            color: isSelected
                                                ? ColorManager.whiteColor
                                                : ColorManager.textPrimaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                });
                              }),
                            ),
                            8.h.height,
                            Text(
                              'الألوان',
                              style: getBoldStyle(
                                  fontSize: 18,
                                  color: ColorManager.textPrimaryColor),
                            ),
                            4.h.height,
                            Row(
                              children: List.generate(
                                  controller.colorProductList.length, (index) {
                                final item = controller.colorProductList[index];
                                return Obx(() {
                                  final isSelected =
                                      controller.colorSelected.value == index;
                                  return InkWell(
                                    overlayColor: const WidgetStatePropertyAll(
                                        ColorManager.transparentColor),
                                    onTap: () {
                                      controller.colorSelected.value = index;
                                    },
                                    borderRadius: BorderRadius.circular(4.r),
                                    child: AnimatedContainer(
                                      margin: REdgeInsetsDirectional.only(
                                        end: 12.w,
                                      ),
                                      alignment: AlignmentDirectional.center,
                                      padding: EdgeInsets.all(4.sp),
                                      duration: const Duration(
                                        milliseconds: 400,
                                      ),
                                      decoration: BoxDecoration(
                                        color: ColorManager.whiteColor,
                                        shape: BoxShape.circle,
                                        border: isSelected
                                            ? Border.all(
                                                color: ColorManager
                                                    .notificationDateTimeGrayColor,
                                                width: .5,
                                              )
                                            : null,
                                      ),
                                      child: CircleAvatar(
                                        radius: 16.r,
                                        backgroundColor: item,
                                      ),
                                    ),
                                  );
                                });
                              }),
                            ),
                            4.h.height,
                            const FractionallySizedBox(
                              widthFactor: 1.5,
                              child: Divider(
                                thickness: .5,
                              ),
                            ),
                            2.h.height,
                            QuantityAndTotalPriceWidget(
                              product: product,
                            ),
                            2.h.height,
                            const FractionallySizedBox(
                              widthFactor: 1.5,
                              child: Divider(
                                thickness: .5,
                              ),
                            ),
                            Text(
                              "التقييمات والآراء",
                              style: getBoldStyle(
                                  color: ColorManager.textSecondaryColor,
                                  fontSize: 20),
                            ),
                            const RatingOverviewWidget(
                                averageRating: 4.0,
                                totalReviews: 25,
                                starCounts: {
                                  5: 40,
                                  4: 5,
                                  3: 0,
                                  2: 1,
                                  1: 0,
                                })
                          ],
                        ),
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
                ShareHelper.shareImageFromUrl(
                    imageUrl: product.imageUrl, shareText: product.name);
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
