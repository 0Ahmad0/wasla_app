import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/auth/views/forget_password_view.dart';
import 'package:wasla_app/app/features/users_reviews/controllers/users_reviews_controller.dart';
import 'package:wasla_app/app/features/users_reviews/widgets/user_reveiw_item_widget.dart';
import 'package:wasla_app/app/widgets/app_bar_widget.dart';
import 'package:wasla_app/core/dialogs/app_dialog.dart';
import 'package:wasla_app/core/extension/space_ext.dart';
import 'package:wasla_app/core/strings_manager.dart';

import '../../../../core/color_manager.dart';
import '../../../../core/style_manager.dart';
import '../widgets/user_add_rating_dialog.dart';

class UsersReviewsView extends GetView<UsersReviewsController> {
  const UsersReviewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => AppDialog(
            widget: UserAddRatingDialog()
          ).showAppDialog(context),
          icon:  Icon(
            Icons.add_reaction,
            color: ColorManager.whiteColor,
          ),
          label: Text(
            StringsManager.addNewReviewText,
            style: getRegularStyle(
              color: ColorManager.whiteColor,
            ),
          )),

      appBar: const AppBarWidget(
        title: StringsManager.usersReviewsText,
      ),
      body: Obx(()=>ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
        itemBuilder: (context, index) {
          final userReview = controller.userReviews[index];
          return UserReviewItemWidget(userReview: userReview,);
        },
        separatorBuilder: (_, __) => 8.h.height,
        itemCount: controller.userReviews.length,
      )),
    );
  }
}
