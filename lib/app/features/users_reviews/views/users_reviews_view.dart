import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/auth/views/forget_password_view.dart';
import 'package:wasla_app/app/features/users_reviews/controllers/users_reviews_controller.dart';
import 'package:wasla_app/app/features/users_reviews/widgets/user_reveiw_item_widget.dart';
import 'package:wasla_app/app/widgets/app_bar_widget.dart';
import 'package:wasla_app/core/extension/space_ext.dart';
import 'package:wasla_app/core/strings_manager.dart';

class UsersReviewsView extends GetView<UsersReviewsController> {
  const UsersReviewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: StringsManager.usersReviewsText,
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
        itemBuilder: (context, index) {
          final userReview = controller.userReviews[index];
          return UserReviewItemWidget(userReview: userReview,);
        },
        separatorBuilder: (_, __) => 8.h.height,
        itemCount: controller.userReviews.length,
      ),
    );
  }
}
