import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/widgets/app_bar_widget.dart';
import 'package:wasla_app/app/widgets/app_padding.dart';
import 'package:wasla_app/app/widgets/cached_network_image_widget.dart';
import 'package:wasla_app/core/color_manager.dart';

import '../../home/model/product_model.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductModel product = Get.arguments as ProductModel;
    return Scaffold(
      appBar: AppBarWidget(
        title: product.name,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                CachedImageWidget(
                  imageUrl: product.imageUrl,
                  width: Get.width,
                  height: 150.h,
                ),
                PositionedDirectional(
                  child: AppPadding(
                    hPadding: 0,
                    vPadding: 10,
                    child: Row(
                      children: List.generate(
                        4,
                        (index) => Flexible(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 8.w),
                            height: 100.sp,
                            decoration: BoxDecoration(
                              color:
                                  ColorManager.secondaryColor.withOpacity(.25),
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                color: ColorManager.primaryColor,
                                width: 2
                              )
                            ),
                            child: CachedImageWidget(
                              imageUrl: product.imageUrl,
                              clipRadius: 8.r,
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
        ],
      ),
    );
  }
}
