import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/color_manager.dart';
import '../../../widgets/backbutton_widget.dart';
import '../controllers/media_viewer_controller.dart';
import '../enum/media_type.dart';

class MediaViewerView extends GetView<MediaViewerController> {
  const MediaViewerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(8.sp),
          child: const BackButtonWidget(),
        ),
        backgroundColor: ColorManager.blackColor,
      ),
      backgroundColor: ColorManager.blackColor,
      body: Obx(() => PageView.builder(
        controller: controller.pageController,
        onPageChanged: controller.onPageChanged,
        itemCount: controller.mediaItems.length,
        itemBuilder: (context, index) {
          final media = controller.mediaItems[index];
          if (media.type == MediaType.video) {
            final chewieController = controller.videoControllers[media.filePath];


            return Stack(
              alignment: AlignmentDirectional.center,
              children: [
                AspectRatio(
                  aspectRatio: chewieController?.videoPlayerController.value.aspectRatio ?? 1,
                  child: VideoPlayer(chewieController!.videoPlayerController),
                ),
                Chewie(controller: chewieController),
              ],
            );
          } else {
            return Image.file(
              File(media.filePath),
              fit: BoxFit.contain,
            );
          }
        },
      )),
    );
  }
}
