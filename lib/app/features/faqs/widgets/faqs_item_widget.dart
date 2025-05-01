import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/auth/views/forget_password_view.dart';
import 'package:wasla_app/app/features/faqs/controllers/faqs_controller.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/extension/space_ext.dart';
import 'package:wasla_app/core/style_manager.dart';

class FAQsItemWidget extends StatelessWidget {
  const FAQsItemWidget({
    super.key,
    required this.question,
    required this.answer,
    required this.index,
  });

  final String question;
  final String answer;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: index ==0,
      backgroundColor: ColorManager.secondaryColor.withOpacity(.2),
      collapsedBackgroundColor: ColorManager.chatContainerColor,
      iconColor: ColorManager.primaryColor,
      collapsedIconColor: ColorManager.textSecondaryColor,
      childrenPadding: EdgeInsets.symmetric(
        horizontal: 24.w,
      ),
      tilePadding: EdgeInsets.symmetric(
        horizontal: 24.w,
      ),
      shape:  RoundedRectangleBorder(
          side: BorderSide(
        color: ColorManager.secondaryColor,
        width: .4,
      )),
      title: Row(
        children: [
          CircleAvatar(
            radius: 14.sp,
            backgroundColor: ColorManager.primaryColor,
            child: Text(
              '${index + 1}',
              style: getLightStyle(
                color: ColorManager.whiteColor,
              ),
            ),
          ),
          16.w.width,
          Flexible(
            child: Text(
              question,
              style: getMediumStyle(
                color: ColorManager.primaryColor,
                fontSize: 18,
              ),
            ),
          )
        ],
      ),
      children: [
        Text(
          answer,
          style: getRegularStyle(
            color: ColorManager.textPrimaryColor,
          ),
        )
      ],
    );
  }
}
