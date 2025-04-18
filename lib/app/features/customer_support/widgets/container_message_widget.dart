import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/customer_support/models/message_model.dart';
import 'package:wasla_app/app/features/customer_support/widgets/message_content_widget.dart';
import 'package:wasla_app/core/color_manager.dart';

class ContainerMessageWidget extends StatelessWidget {
  const ContainerMessageWidget({super.key, required this.message});
  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Row(
        mainAxisAlignment:
        message.isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(Get.context!).size.width * 0.8,
            ),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: message.isUser ? ColorManager.primaryColor: ColorManager.chatContainerColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: MessageContentWidget(message: message,),
            ),
          ),
        ],
      ),
    );
  }
}
