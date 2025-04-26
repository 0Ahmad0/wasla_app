import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/auth/views/forget_password_view.dart';
import 'package:wasla_app/app/features/auth/views/otp_view.dart';
import 'package:wasla_app/app/features/faqs/controllers/faqs_controller.dart';
import 'package:wasla_app/app/features/faqs/widgets/faqs_item_widget.dart';
import 'package:wasla_app/app/widgets/app_bar_widget.dart';
import 'package:wasla_app/app/widgets/backbutton_widget.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/strings_manager.dart';
class FAQsView extends GetView<FAQsController> {
  const FAQsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.chatContainerColor,
      appBar: const AppBarWidget(
        title: StringsManager.faqsText,
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(
          vertical: 10.h,
        ),
        itemCount: controller.faqsList.length,
        itemBuilder: (context, index) {
          final faq = controller.faqsList[index];
          return FAQsItemWidget(
            question: faq.question,
            answer: faq.answer,
            index: index,
          );
        },
      ),
    );
  }
}
