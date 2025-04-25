import 'dart:io';
import 'dart:math';

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
import 'package:wasla_app/core/routes/app_routes.dart';
import 'package:wasla_app/core/style_manager.dart';

import '../enum/media_type.dart';
import '../enum/message_type.dart';
import '../models/media_item_model.dart';
import '../views/media_viewer_view.dart';

class MessageContentWidget extends GetView<CustomerSupportController> {
  const MessageContentWidget({super.key, required this.message});

  final MessageModel message;

  Color _getContentColor() {
    return message.isUser ? ColorManager.whiteColor : ColorManager.primaryColor;
  }

  void _openMediaViewer(List<MediaItemModel> mediaItems, int initialIndex) {
    Get.toNamed(
      AppRoutes.mediaViewer,
      arguments: {
        'mediaItems': mediaItems,
        'initialIndex': initialIndex,
      },
    );
  }

  Widget _buildMediaMessage(List<MediaItemModel> mediaItems) {
    return GestureDetector(
      onTap: () => _openMediaViewer(mediaItems, 0),
      // افتح المعاينة عند الضغط على أي جزء
      child: Column(
        children: [
          _buildMediaGrid(mediaItems),
          const SizedBox(height: 8),
          Text(
            '${mediaItems.length} وسائط',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  Widget _buildMediaGrid(List<MediaItemModel> mediaItems) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${mediaItems.length} وسائط',
          style: getLightStyle(fontSize: 12, color: ColorManager.whiteColor),
        ),
        8.h.height,
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 4.sp,
            crossAxisSpacing: 4.sp,
          ),
          itemCount: min(mediaItems.length, 4),
          itemBuilder: (context, index) {
            if (index == 3 && mediaItems.length > 4) {
              return GestureDetector(
                onTap: () => _openMediaViewer(mediaItems, index),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    _buildSingleMedia(mediaItems[index]),
                    Container(
                      color: ColorManager.blackColor.withOpacity(.5),
                    ),
                    Text('+${mediaItems.length - 3}',
                        style: getRegularStyle(
                            fontSize: 24, color: _getContentColor())),
                  ],
                ),
              );
            }

            return _buildSingleMedia(mediaItems[index]);
          },
        ),
      ],
    );
  }

  Widget _buildVideoThumbnail(MediaItemModel media) {
    return media.thumbnailPath != null
        ? Image.file(
            File(media.thumbnailPath!),
            width: 300.sp,
            height: 300.sp,
            fit: BoxFit.cover,
          )
        : Container(color: ColorManager.blackColor.withOpacity(.25));
  }

  Widget _buildSingleMedia(MediaItemModel media) {
    return GestureDetector(
      onTap: () => _openMediaViewer([media], 0),
      child: Stack(
        children: [
          media.type == MediaType.image
              ? Image.file(
                  File(media.filePath),
                  width: 300.sp,
                  height: 300.sp,
                  fit: BoxFit.cover,
                )
              : _buildVideoThumbnail(media),
          if (media.type == MediaType.video) ...[
            Positioned.fill(
              child: Container(
                color: ColorManager.blackColor.withOpacity(.3),
              ),
            ),
            const PositionedDirectional(
              bottom: 0,
              top: 0,
              start: 0,
              end: 0,
              child: Icon(
                Icons.play_circle_filled,
                color: Colors.white,
                size: 50,
              ),
            ),
            PositionedDirectional(
              bottom: 8,
              start: 8,
              child: Container(
                padding: EdgeInsets.all(4.sp),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  media.duration ?? '',
                  style: getLightStyle(
                      color: ColorManager.whiteColor, fontSize: 12),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTextMessage() {
    return Text(
      message.content,
      style: getRegularStyle(
        fontSize: 16,
        color: message.isUser
            ? ColorManager.whiteColor
            : ColorManager.primaryColor,
      ).copyWith(height: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (message.type) {
      case MessageType.text:
        return _buildTextMessage();

      case MessageType.image:
        return _buildSingleMedia(message.mediaItems!.first);

      case MessageType.video:
        return _buildSingleMedia(message.mediaItems!.first);

      case MessageType.mediaGroup:
        return _buildMediaGrid(message.mediaItems!);

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
                        : _getContentColor(),
                  )),
              2.h.height,
              Row(
                children: [
                  GestureDetector(
                    child: Icon(
                      isCurrentMessagePlaying ? Icons.pause : Icons.play_arrow,
                      color: _getContentColor(),
                    ),
                    onTap: () => controller.togglePlayPause(
                      message.filePath!,
                      message.id,
                    ),
                  ),
                  Obx(
                    () => Expanded(
                      child: controller.currentlyPlayingId.value == message.id
                          ? Slider(
                              activeColor:
                                  ColorManager.notificationProgressColor,
                              value: controller.playbackPosition.value,
                              min: 0,
                              max: controller.playbackDuration.value > 0
                                  ? controller.playbackDuration.value
                                  : 1,
                              onChanged: (value) {
                                controller.seekToPosition(value);
                              },
                            )
                          : Slider(
                              activeColor: ColorManager.secondaryColor,
                              value: 0,
                              min: 0,
                              max: 1,
                              onChanged: (value) {},
                            ),
                    ),
                  ),
                  Obx(
                    () => FittedBox(
                      child: Text(
                        controller.currentlyPlayingId.value == message.id
                            ? '${controller.formatDuration(controller.playbackPosition.value)} / ${controller.formatDuration(controller.playbackDuration.value)}'
                            : '${message.duration}',
                        style: getLightStyle(
                          fontSize: 10,
                          color: _getContentColor(),
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
            width: 50.sp,
            height: 50.sp,
            padding: EdgeInsets.all(14.sp),
            decoration: BoxDecoration(
                color: ColorManager.chatContainerDownloadIconColor,
                borderRadius: BorderRadius.circular(8.r)),
            child: SvgPicture.asset(AssetsManager.chatDocDownloadIcon),
          ),
          title: Text(
            message.content,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: getRegularStyle(
              fontSize: 14,
              color: _getContentColor(),
            ),
          ),
          subtitle: Text(
            controller.getFileSize(message.filePath!),
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.end,
            style: getLightStyle(
              fontSize: 10,
              color: _getContentColor(),
            ).copyWith(height: 2),
          ),
        );
    }
  }
}
