import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/product_details/controllers/product_details_controller.dart';
import 'package:wasla_app/app/features/product_details/widgets/product_reveiw_item_widget.dart';
import 'package:wasla_app/app/widgets/app_bar_widget.dart';
import 'package:wasla_app/core/extension/space_ext.dart';
import 'package:wasla_app/core/strings_manager.dart';

import '../../../widgets/app_scaffold_widget.dart';

class ProductReviewsView extends GetView<ProductDetailsController> {
  const ProductReviewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const AppBarWidget(
        title: StringsManager.customerReviewsText,
      ),
      body: Obx(()=>ListView.separated(
        // reverse: true,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
        itemBuilder: (context, index) {
          final productReview = controller.productUsersReviews.reversed.toList()[index];
          return ProductReviewItemWidget(productReview: productReview,);
        },
        separatorBuilder: (_, __) => 8.h.height,
        itemCount: controller.productUsersReviews.length,
      )),
    );
  }
}
