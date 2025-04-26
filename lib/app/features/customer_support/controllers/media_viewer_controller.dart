import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../enum/media_type.dart';
import '../models/media_item_model.dart';

class MediaViewerController extends GetxController {
  late final List<MediaItemModel> mediaItems;
  late final int initialIndex;

  late PageController pageController;
  final RxInt currentIndex = 0.obs;
  final Map<String, ChewieController> videoControllers = {};

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map<String, dynamic>;
    mediaItems = args['mediaItems'];
    initialIndex = args['initialIndex'];

    currentIndex.value = initialIndex;
    pageController = PageController(initialPage: initialIndex);
    _initializeCurrentVideo();
  }

  void _initializeCurrentVideo() {
    final currentMedia = mediaItems[currentIndex.value];
    if (currentMedia.type == MediaType.video) {
      _initVideoController(currentMedia);
    }
  }

  void _initVideoController(MediaItemModel media) async {
    if (videoControllers.containsKey(media.filePath)) return;

    final videoController = VideoPlayerController.file(File(media.filePath));
    await videoController.initialize();
    final chewieController = ChewieController(
      videoPlayerController: videoController,
      autoPlay: true,
      looping: false,
      showControls: true,
      zoomAndPan: true,
      aspectRatio: videoController.value.aspectRatio,
      draggableProgressBar: true,
    );

    videoControllers[media.filePath] = chewieController;
    update();
  }

  void onPageChanged(int index) {
    for (var c in videoControllers.values) {
      c.pause();
    }

    currentIndex.value = index;
    final newMedia = mediaItems[index];
    if (newMedia.type == MediaType.video) {
      _initVideoController(newMedia);
      videoControllers[newMedia.filePath]?.play();
    }
    update();
  }

  @override
  void onClose() {
    pageController.dispose();
    for (var c in videoControllers.values) {
      c.videoPlayerController.dispose();
      c.dispose();
    }
    super.onClose();
  }
}
