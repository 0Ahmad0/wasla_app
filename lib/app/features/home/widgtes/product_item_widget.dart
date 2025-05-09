import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/auth/views/forget_password_view.dart';
import 'package:wasla_app/app/features/home/controllers/home_controller.dart';
import 'package:wasla_app/app/features/home/model/product_model.dart';
import 'package:wasla_app/app/widgets/app_padding.dart';
import 'package:wasla_app/app/widgets/cached_network_image_widget.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/extension/space_ext.dart';
import 'package:wasla_app/core/routes/app_routes.dart';
import 'package:wasla_app/core/style_manager.dart';

class ProductItemWidget extends GetView<HomeController> {
  const ProductItemWidget({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(6.r),
          onTap: () {
            Get.toNamed(
              AppRoutes.productDetails,
              arguments: product,
            );
          },
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6.r),
                  child: CachedImageWidget(
                    imageUrl: product.imageUrl,
                  ),
                ),
              ),
              2.h.height,
              ListTile(
                contentPadding: EdgeInsets.zero,
                dense: true,
                visualDensity: VisualDensity.compact,
                minTileHeight: 14.h,
                minVerticalPadding: 0,
                title: Text(
                  product.name,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: getRegularStyle(
                    color: ColorManager.textPrimaryColor,
                    fontSize: 12,
                  ),
                ),
                trailing: RichText(
                    textDirection: TextDirection.ltr,
                    text: TextSpan(children: [
                      TextSpan(
                        text: '${controller.getCustomPrice(product.price)[0]}.',
                        style: getBoldStyle(
                          color: ColorManager.textPrimaryColor,
                          fontSize: 18,
                        ),
                      ),
                      TextSpan(
                        text: controller.getCustomPrice(product.price)[1],
                        style: getRegularStyle(
                          color: ColorManager.textPrimaryColor,
                        ),
                      ),
                      TextSpan(
                        text: ' \$',
                        style: getBoldStyle(
                          color: ColorManager.errorColor,
                          fontSize: 18,
                        ),
                      ),
                    ])),
              ),
              Row(
                children: [
                  Row(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        Icons.star,
                        color: ColorManager.ratingColor,
                        size: 14.sp,
                      ),
                    ),
                  ),
                  4.w.width,
                  Text(
                    '(${product.price.toStringAsFixed(0)})',
                    style: getLightStyle(
                        color: ColorManager.textSecondaryColor, fontSize: 12),
                  )
                ],
              )
            ],
          ),
        ),
        Obx(() {
          bool isFav = product.isFav.value;
          return IconButton(
            onPressed: () {
              product.isFav.value = !isFav;
            },
            icon: HeartBeat(
              key: Key(isFav.toString()),
              child: Icon(
                isFav ? Icons.favorite : Icons.favorite_outline,
                color:
                    isFav ? ColorManager.errorColor : ColorManager.whiteColor,
                size: 34.sp,
              ),
            ),
          );
        })
      ],
    );
  }
}
