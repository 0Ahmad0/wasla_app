import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/customer_support/models/message_model.dart';
import 'package:wasla_app/app/features/customer_support/widgets/message_content_widget.dart';
import 'package:wasla_app/core/color_manager.dart';

class ContainerMessageWidget extends StatelessWidget {
  const ContainerMessageWidget({super.key, required this.message});

  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
      message.isUser ? AlignmentDirectional.centerEnd : AlignmentDirectional
          .centerStart,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: ConstrainedBox(
        constraints: BoxConstraints(
        maxWidth: MediaQuery.of(Get.context!).size.width * 0.8,
              ),
              child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: message.isUser ? ColorManager.primaryColor : ColorManager
              .chatContainerColor,
          borderRadius: BorderRadiusDirectional.only(
            topEnd: message.isUser?Radius.zero:Radius.circular(16.r),
            topStart: message.isUser?Radius.circular(16.r):Radius.zero,
            bottomEnd: Radius.circular(16.r),
            bottomStart: Radius.circular(16.r),
          ),
        ),
        child: MessageContentWidget(message: message,),
              ),
            )
    ,
    )
    ,
    );
  }
}
