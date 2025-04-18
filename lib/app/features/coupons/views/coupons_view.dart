import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/coupons/controllers/coupons_controller.dart';
import 'package:wasla_app/app/widgets/app_bar_widget.dart';
import 'package:wasla_app/app/widgets/app_padding.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/const_manager.dart';
import 'package:wasla_app/core/extension/space_ext.dart';
import 'package:wasla_app/core/strings_manager.dart';
import 'package:wasla_app/core/style_manager.dart';

import '../../../widgets/backbutton_widget.dart';
import '../widgets/coupon_item_widget.dart';

class CouponsView extends GetView<CouponsController> {
  const CouponsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: StringsManager.couponsText,
        leading: BackButtonWidget(),
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
              scrollDirection: Axis.horizontal,
              itemCount: controller.gradientColorsList.length,
              itemBuilder: (context, index) => CouponItemWidget(
                discount: (index + 1) * 4 + 10,
                gradientColors: controller.gradientColorsList[index],
              ),
              separatorBuilder: (_, __) => 40.w.width,
            ),
          ),
          Expanded(
            child: AppPadding(
              vPadding: 10,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.w,
                  vertical: 10.h
                ),
                decoration: BoxDecoration(
                  color: ColorManager.menuGrayColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringsManager.discountCouponText,
                      style: getBoldStyle(
                          color: ColorManager.textPrimaryColor, fontSize: 22),
                    ),
                    8.h.height,
                    Text(
                      """احصل على خصم 10% عند استعمال هذا الكوبون صالح لجميع المواقع حصولك على هذا الكوبون يعني أنك زبون مميز بالنسبة لنا😁""",
                      style: getRegularStyle(
                          color: ColorManager.textSecondaryColor, fontSize: 18),
                    ),
                    const Spacer(),
                    Text.rich(
                      TextSpan(children: [
                        TextSpan(
                            text: StringsManager.endDateCouponText,
                            style: getBoldStyle(
                                fontSize: 22,
                                color: ColorManager.textPrimaryColor
                            )
                        ),
                        TextSpan(
                            text: '2025 / 5 / 25',
                            style: getBoldStyle(
                                color: ColorManager.hintTextColor,
                                fontSize: 18
                            )
                        ),
                      ]),
                    )
                  ],
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}
