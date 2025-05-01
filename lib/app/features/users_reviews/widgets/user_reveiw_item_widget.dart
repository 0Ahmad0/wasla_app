import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wasla_app/app/features/users_reviews/model/user_review_model.dart';
import 'package:wasla_app/core/assets_manager.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/extension/space_ext.dart';
import 'package:wasla_app/core/style_manager.dart';
import 'package:wasla_app/main.dart';

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
              CircleAvatar(
                radius: 30.sp,
                backgroundColor: ColorManager.secondaryColor.withOpacity(.25),
                child: userReview.userImage == null
                    ? SvgPicture.asset(AssetsManager.profileIcon)
                    : Image.asset(userReview.userImage!),
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
                      // color: Color(0xffFDCC0D),
                      // color: Color(0xffFFDF00),
                      ? const Color(0xffFF9529) // نجمة برتقالية
                      : ColorManager.notificationDateTimeGrayColor.withOpacity(.5), // نجمة رمادية
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
