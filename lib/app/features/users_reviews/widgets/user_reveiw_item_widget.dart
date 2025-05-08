import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wasla_app/app/features/users_reviews/model/user_review_model.dart';
import 'package:wasla_app/app/widgets/app_padding.dart';
import 'package:wasla_app/core/assets_manager.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/extension/space_ext.dart';
import 'package:wasla_app/core/style_manager.dart';
class UserReviewItemWidget extends StatelessWidget {
  const UserReviewItemWidget({super.key, required this.userReview});

  final UserReviewModel userReview;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
          color: ColorManager.chatContainerColor,
          borderRadius: BorderRadius.circular(14.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                width: 60.sp,
                height: 60.sp,
                decoration: BoxDecoration(
                  color: ColorManager.secondaryColor.withOpacity(.25),
                  shape: BoxShape.circle,
                ),
                child: userReview.userImage == null
                    ? AppPadding(
                        hPadding: 6,
                        vPadding: 6,
                        child: SvgPicture.asset(
                          AssetsManager.profileIcon,
                        ),
                      )
                    : Image.asset(
                        width: 60.sp,
                        height: 60.sp,
                        userReview.userImage!,
                        fit: BoxFit.cover,
                      ),
              ),
              16.w.width,
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userReview.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: getRegularStyle(
                        fontSize: 16,
                        color: ColorManager.textPrimaryColor,
                      ),
                    ),
                    4.h.height,
                    Text(
                      userReview.review,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: getLightStyle(
                        color: ColorManager.textSecondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          4.h.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: List.generate(
              5,
              (index) => Container(
                width: 20.sp,
                height: 20.sp,
                margin: EdgeInsets.symmetric(horizontal: 2.w),
                decoration: ShapeDecoration(
                  color: index < (userReview.rating ?? 0)
                      ? ColorManager.ratingColor // نجمة برتقالية
                      : ColorManager.notificationDateTimeGrayColor
                          .withOpacity(.5), // نجمة رمادية
                  shape: const StarBorder(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}




