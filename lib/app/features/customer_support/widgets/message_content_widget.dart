import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/auth/views/forget_password_view.dart';
import 'package:wasla_app/app/features/customer_support/controllers/customer_support_controller.dart';
import 'package:wasla_app/app/features/customer_support/models/message_model.dart';
import 'package:wasla_app/core/assets_manager.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/extension/space_ext.dart';
import 'package:wasla_app/core/style_manager.dart';

import '../enum/message_type.dart';

class MessageContentWidget extends GetView<CustomerSupportController> {
  const MessageContentWidget({super.key, required this.message});

  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    switch (message.type) {
      case MessageType.text:
        return Text(
          message.content,
          style: getRegularStyle(
            fontSize: 16,
            color: message.isUser
                ? ColorManager.whiteColor
                : ColorManager.primaryColor,
          ).copyWith(height: 2),
        );
      case MessageType.image:
        return Image.file(
          File(message.filePath!),
          width: 280.w,
          height: 300.w,
          fit: BoxFit.cover,
        );
      case MessageType.audio:
        return Obx(() {
          final bool isCurrentMessagePlaying =
              controller.currentlyPlayingId.value == message.id &&
                  controller.isPlaying.value;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('رسالة صوتية',
                  style: getRegularStyle(
                    fontSize: 14,
                    color: isCurrentMessagePlaying
                        ? ColorManager.hintTextColor
                        : ColorManager.whiteColor,
                  )),
              2.h.height,
              Row(
                children: [
                  GestureDetector(
                    key: Key(message.id),
                    child: Icon(
                      isCurrentMessagePlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                      color: ColorManager.whiteColor,
                    ),
                    onTap: () => controller.togglePlayPause(
                      message.filePath!,
                      message.id,
                    ),
                  ),
                  Obx(
                        () => Expanded(
                      child: Slider(
                        activeColor: ColorManager.notificationProgressColor,
                        value: controller.playbackPosition.value,
                        min: 0,
                        max: controller.playbackDuration.value > 0
                            ? controller.playbackDuration.value
                            : 1,
                        onChanged: (value) {
                          controller.seekToPosition(value);
                        },
                      ),
                    ),
                  ),
                  Visibility(
                    visible: controller.currentlyPlayingId.value == message.id,
                    child: Obx(
                          () => FittedBox(
                        child: Text(
                          controller.currentlyPlayingId.value == message.id
                              ? '${controller.formatDuration(controller.playbackPosition.value)} / ${controller.formatDuration(controller.playbackDuration.value)}'
                              : '${controller.getAudioDuration(message.filePath!)}',
                          style: getLightStyle(
                            fontSize: 12,
                            color: ColorManager.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  )

                ],
              ),
            ],
          );
        });

      case MessageType.file:
        return ListTile(
          leading: Container(
            decoration: BoxDecoration(
                color: ColorManager.chatContainerDownloadIconColor,
                borderRadius: BorderRadius.circular(8.r)),
            child: SvgPicture.asset(
              AssetsManager.chatDocDownloadIcon,
            ),
          ),
          title: Text(
            message.content,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style:
                getRegularStyle(fontSize: 14, color: ColorManager.whiteColor),
          ),
          subtitle: Text(
            controller.getFileSize(message.filePath!),
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.end,
            style: getLightStyle(
              fontSize: 10,
              color: ColorManager.whiteColor,
            ).copyWith(height: 2),
          ),
        );
    }
  }
}
