import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wasla_app/app/features/home/model/product_model.dart';
import 'package:wasla_app/app/widgets/app_padding.dart';
import 'package:wasla_app/app/widgets/cached_network_image_widget.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/style_manager.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorManager.secondaryColor
        ),
        borderRadius: BorderRadius.circular(
            8.r
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: CachedImageWidget(
              imageUrl: product.imageUrl,
            ),
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: AppPadding(
              hPadding: 4,
              vPadding: 4,
              child: Text(
                product.name,
                textAlign: TextAlign.start,
                maxLines: 2,
                style: getRegularStyle(
                    color: ColorManager.textPrimaryColor,
                    fontSize: 14
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 8.w,
                  vertical: 2.h
              ),
              decoration: BoxDecoration(
                  color: ColorManager.secondaryColor,
                  borderRadius: BorderRadius.circular(4.r)
              ),
              child: Text(
                '${product.price} \$',
                maxLines: 2,
                style: getRegularStyle(
                  color: ColorManager.errorColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
