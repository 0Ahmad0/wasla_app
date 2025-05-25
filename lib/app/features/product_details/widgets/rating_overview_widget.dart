import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/product_details/widgets/bottom_sheet_add_your_rate_widget.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/dialogs/app_bottom_sheet.dart';
import 'package:wasla_app/core/extension/space_ext.dart';
import 'package:wasla_app/core/routes/app_routes.dart';
import 'package:wasla_app/core/style_manager.dart';

class RatingOverviewWidget extends StatelessWidget {
  final double averageRating;
  final int totalReviews;
  final Map<int, int> starCounts;

  const RatingOverviewWidget({
    super.key,
    required this.averageRating,
    required this.totalReviews,
    required this.starCounts,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          AppRoutes.productReviews,
          arguments: {}
        );
      },
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: averageRating.toStringAsFixed(1).replaceAll('.', ','),
                  style: getBoldStyle(
                      fontSize: 60, color: ColorManager.textPrimaryColor),
                ),
                TextSpan(
                  text: "/5",
                  style: getRegularStyle(
                    fontSize: 20,
                    color: ColorManager.notificationDateTimeGrayColor,
                  ),
                ),
              ])),
              4.h.height,
              InkWell(
                onTap: () {
                  AppBottomSheet(
                    widget: BottomSheetAddYourRateWidget(),
                  ).showAppBottomSheet(context, isScrollControlled: true);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                      color: ColorManager.primaryColor.withOpacity(.1),
                      borderRadius: BorderRadius.circular(4.r)),
                  child: Row(
                    children: [
                      Text(
                        "($totalReviews أضف رأيك)",
                        style: getRegularStyle(
                            color: ColorManager.notificationDateTimeGrayColor,
                            fontSize: 12),
                      ),
                      4.w.width,
                      Icon(
                        Icons.add_comment_outlined,
                        size: 18.sp,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          30.w.width,
          // --- Right side: star distribution ---
          Expanded(
            child: Column(
              children: List.generate(5, (index) {
                final star = 5 - index;
                final count = starCounts[star] ?? 0;
                final percent = totalReviews == 0 ? 0.0 : count / totalReviews;

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: ColorManager.ratingColor,
                        size: 16.sp,
                      ),
                      10.w.width,
                      Text(star.toString()),
                      10.w.width,
                      Expanded(
                        child: LinearProgressIndicator(
                          borderRadius: BorderRadius.circular(10.r),
                          value: percent,
                          minHeight: 3.h,
                          backgroundColor: ColorManager
                              .notificationDateTimeGrayColor
                              .withOpacity(.25),
                          color: ColorManager.primaryColor,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
