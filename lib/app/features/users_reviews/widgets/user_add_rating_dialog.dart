import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:wasla_app/app/features/users_reviews/controllers/users_reviews_controller.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/extension/space_ext.dart';

import '../../../../core/style_manager.dart';
import '../../../widgets/app_padding.dart';
import '../../../widgets/app_textfield_widget.dart';

class UserAddRatingDialog extends GetView<UsersReviewsController> {
  const UserAddRatingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorManager.transparentColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 10.h,
            ),
            decoration: BoxDecoration(
                color: ColorManager.whiteColor,
                borderRadius: BorderRadius.circular(14.r)),
            child: Obx(
              () => SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: Get.width / 1.75,
                      decoration: BoxDecoration(
                        color: ColorManager.primaryColor,
                      ),
                      child: HeartBeat(
                        key: Key(controller.rating.value.toString()),
                        child: Lottie.asset(
                          controller.getEmojiIcon(),
                        ),
                      ),
                    ),
                    AppPadding(
                      vPadding: 8,
                      child: Column(
                        children: [
                          20.h.height,
                          RatingBar.builder(
                            initialRating: controller.rating.value,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            itemCount: 5,
                            unratedColor: ColorManager.notificationDateTimeGrayColor,
                
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.w),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: ColorManager.ratingColor,
                            ),
                            onRatingUpdate: (rate) =>
                                controller.onRatingUpdate(rate),
                          ),
                          20.h.height,
                          Form(
                            key: controller.rateKey,
                            child: AppTextField(
                              controller: controller.reteTextController,
                              minLine: 1,
                              maxLine: 3,
                              textInputAction: TextInputAction.newline,
                              keyboardType: TextInputType.multiline,
                              hintText: 'رأيك يهمنا... لنصبح الأفضل معًا!',
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              if (controller.rateKey.currentState?.validate() ??
                                  false) {
                                Get.back();
                              }
                            },
                            child: Text(
                              'تقييم الآن',
                              style: getRegularStyle(
                                  color: ColorManager.primaryColor, fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
