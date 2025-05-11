import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/product_details/controllers/product_details_controller.dart';
import 'package:wasla_app/app/widgets/app_button_widget.dart';
import 'package:wasla_app/app/widgets/app_padding.dart';
import 'package:wasla_app/core/assets_manager.dart';
import 'package:wasla_app/core/extension/space_ext.dart';

import '../../../../core/color_manager.dart';
import '../../../../core/strings_manager.dart';
import '../../../../core/style_manager.dart';
import '../../../widgets/app_textfield_widget.dart';
import '../../users_reviews/model/user_review_model.dart';

class BottomSheetAddYourRateWidget extends GetView<ProductDetailsController> {
  const BottomSheetAddYourRateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          dense: true,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.close,
            ),
          ),
          title: const Text(
            'أضف تعليق ورأي',
          ),
        ),
        const Divider(
          thickness: .5,
        ),
        AppPadding(
          vPadding: 8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                dense: true,
                leading: CircleAvatar(
                  backgroundImage: AssetImage(AssetsManager.appIcon),
                ),
                title: Text('أحمد الحريري'),
                subtitle: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: 'الطلب رقم',
                          style: getRegularStyle(
                              color: ColorManager.textPrimaryColor)),
                      TextSpan(
                        text: '  #FG1250H',
                        style: getMediumStyle(
                          color: ColorManager.primaryColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              10.h.height,
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
                onRatingUpdate: (rate) => controller.onRatingUpdate(rate),
              ),
              10.h.height,
              Form(
                key: controller.rateKey,
                child: AppTextField(
                  controller: controller.reteTextController,
                  minLine: 2,
                  maxLine: 3,
                  textInputAction: TextInputAction.newline,
                  keyboardType: TextInputType.multiline,
                  hintText: 'رأيك يهمنا... لنصبح الأفضل معًا!',
                ),
              ),
              10.h.height,
              AppButtonWidget(
                text: 'تقييم الآن',
                onPressed: () {
                  if (controller.rateKey.currentState?.validate() ?? false) {
                    final review = UserReviewModel(
                        name: 'مستخدم جديد',
                        review: controller.reteTextController.text,
                        rating: int.parse(
                          controller.rating.value.toStringAsFixed(0),
                        ));
                    // controller.addReview(review);
                    Get.back();
                  }
                },
              )
            ],
          ),
        )
      ],
    );
  }
}
