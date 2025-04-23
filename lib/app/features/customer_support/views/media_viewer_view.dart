import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../enum/media_type.dart';
import '../models/media_item_model.dart';

class MediaViewerView extends StatefulWidget {
  final List<MediaItemModel> mediaItems;
  final int initialIndex;

  const MediaViewerView({
    super.key,
    required this.mediaItems,
    required this.initialIndex,
  });

  @override
  _MediaViewerPageState createState() => _MediaViewerPageState();
}

class _MediaViewerPageState extends State<MediaViewerView> {
  late PageController _pageController;
  late int _currentIndex;
  final Map<String, ChewieController> _videoControllers = {};

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
    _initializeCurrentVideo();
  }

  void _initializeCurrentVideo() {
    final currentMedia = widget.mediaItems[_currentIndex];
    if (currentMedia.type == MediaType.video) {
      _initVideoController(currentMedia);
    }
  }

  void _initVideoController(MediaItemModel media) {
    if (_videoControllers.containsKey(media.filePath)) return;

    final videoController = VideoPlayerController.file(File(media.filePath));
    final chewieController = ChewieController(
      videoPlayerController: videoController,
      autoPlay: true,
      looping: true,
      showControls: true,
    );

    _videoControllers[media.filePath] = chewieController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          // إيقاف الفيديو السابق
          _videoControllers.values.forEach((c) => c.pause());

          setState(() => _currentIndex = index);

          // تشغيل الفيديو الجديد إذا كان موجوداً
          final newMedia = widget.mediaItems[index];
          if (newMedia.type == MediaType.video) {
            _initVideoController(newMedia);
            _videoControllers[newMedia.filePath]?.play();
          }
        },
        itemBuilder: (context, index) {
          final media = widget.mediaItems[index];
          if (media.type == MediaType.video) {
            return Chewie(
              controller: _videoControllers[media.filePath]!,
            );
          } else {
            return InteractiveViewer(
                child: Image.file(
              File(media.filePath),
            ));
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _videoControllers.values.forEach((c) {
      c.videoPlayerController.dispose();
      c.dispose();
    });
    super.dispose();
  }
}
