import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                              style: getRegularStyle(color: ColorManager.textSecondaryColor),
                              trimCollapsedText: 'عرض المزيد...',
                              trimExpandedText: ' عرض أقل...',
                              moreStyle: getBoldStyle(
                                color: ColorManager.primaryColor
                              ),
                              lessStyle: getBoldStyle(),
                            ),
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
