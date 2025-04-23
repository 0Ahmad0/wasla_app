import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wasla_app/app/features/customer_support/models/message_model.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import '../enum/media_type.dart';
import '../enum/message_type.dart';
import 'package:just_audio/just_audio.dart';

import '../models/media_item_model.dart';

class CustomerSupportController extends GetxController {
  final FlutterSoundPlayer audioPlayer = FlutterSoundPlayer();
  final RxList<MessageModel> messages = <MessageModel>[].obs;
  final TextEditingController textController = TextEditingController();
  final FlutterSoundRecorder recorder = FlutterSoundRecorder();
  final RxBool isRecording = false.obs;
  final RxString recordingPath = ''.obs;
  final RxBool isPlaying = false.obs;
  final RxString currentlyPlayingId = ''.obs;
  final RxDouble playbackPosition = 0.0.obs;
  final RxDouble playbackDuration = 0.0.obs;
  StreamSubscription? _progressSubscription;
  final RxInt recordingDuration = 0.obs; // المدة بالثواني
  Timer? _recordingTimer;
  // الحد الاقصى للرسالة الصوتية
  final int maxRecordingDuration = 5 * 60; // 15 دقيقة بالثواني

  final RxList<AssetEntity> selectedAssets = <AssetEntity>[].obs;
  final int maxMediaSelection = 15; // الحد الأقصى للوسائط المختارة


  @override
  void onInit() async {
    super.onInit();
    await _initRecorder();
    await _initAudioPlayer();
    _loadInitialMessages();
  }

  Future<void> _initAudioPlayer() async {
    await audioPlayer.openPlayer();
    _setupAudioPlayerListeners();
  }

  void _setupAudioPlayerListeners() {
    audioPlayer.setSubscriptionDuration(const Duration(milliseconds: 100));

    _progressSubscription = audioPlayer.onProgress?.listen((event) {
      if (event != null) {
        playbackPosition.value = event.position.inMilliseconds.toDouble();
        playbackDuration.value = event.duration.inMilliseconds.toDouble();
      }
    });
  }

  void seekToPosition(double value) async {
    await audioPlayer.seekToPlayer(Duration(milliseconds: value.toInt()));
    playbackPosition.value = value;
  }

  Future<void> togglePlayPause(String audioPath, String messageId) async {
    try {
      if (currentlyPlayingId.value == messageId) {
        if (isPlaying.value) {
          // إذا كانت شغالة، نوقفها
          await audioPlayer.pausePlayer();
          isPlaying.value = false;
        } else {
          // إذا كانت موقوفة، نكمل التشغيل من نفس المكان
          await audioPlayer.resumePlayer();
          isPlaying.value = true;
        }
      } else {
        // إذا كانت رسالة مختلفة
        // نوقف أي صوت آخر أولاً
        await audioPlayer.stopPlayer();

        // نحدث الـ ID
        currentlyPlayingId.value = messageId;

        // نبدأ التشغيل من البداية
        await audioPlayer.startPlayer(
          fromURI: audioPath,
          codec: Codec.aacADTS,
          whenFinished: () {
            seekTo(0);
            isPlaying.value = false;
            playbackPosition.value = 0;
            currentlyPlayingId.value = '';
          },
        );

        isPlaying.value = true;
      }
    } catch (e) {
      Get.snackbar('Error', 'فشل في تشغيل الصوت: ${e.toString()}');
      debugPrint('Audio play error: $e');
    }
  }

  Future<void> _initRecorder() async {
    try {
      await recorder.openRecorder();
    } catch (e) {
      debugPrint('Error initializing recorder: $e');
      Get.snackbar('خطأ', 'تعذر تهيئة مسجل الصوت');
    }
  }

  Future<bool> _checkMicrophonePermission() async {
    final status = await Permission.microphone.status;
    if (!status.isGranted) {
      final result = await Permission.microphone.request();
      return result.isGranted;
    }
    return true;
  }

  // Future<void> startRecording() async {
  //   try {
  //     final hasPermission = await _checkMicrophonePermission();
  //     if (!hasPermission) {
  //       Get.snackbar('الإذن مطلوب', 'يجب منح إذن الميكروفون لتسجيل الصوت');
  //       return;
  //     }
  //
  //     if (recorder.isRecording) {
  //       await stopRecording();
  //     }
  //
  //     final directory = await getTemporaryDirectory();
  //     final path =
  //         '${directory.path}/audio_${DateTime.now().millisecondsSinceEpoch}.aac';
  //
  //     await recorder.startRecorder(
  //       toFile: path,
  //       codec: Codec.aacADTS,
  //     );
  //
  //     recordingPath.value = path;
  //     isRecording.value = true;
  //   } catch (e) {
  //     debugPrint('Error starting recording: $e');
  //     Get.snackbar('خطأ', 'تعذر بدء التسجيل الصوتي');
  //     isRecording.value = false;
  //   }
  // }

  Future<void> startRecording() async {
    try {
      final hasPermission = await _checkMicrophonePermission();
      if (!hasPermission) {
        Get.snackbar('الإذن مطلوب', 'يجب منح إذن الميكروفون لتسجيل الصوت');
        return;
      }

      if (recorder.isRecording) {
        await stopRecording();
      }

      final directory = await getTemporaryDirectory();
      final path = '${directory.path}/audio_${DateTime.now().millisecondsSinceEpoch}.aac';

      await recorder.startRecorder(
        toFile: path,
        codec: Codec.aacADTS,
      );

      recordingPath.value = path;
      isRecording.value = true;
      recordingDuration.value = 0;

      // بدء العد التنازلي
      _recordingTimer = Timer.periodic(Duration(seconds: 1), (timer) {
        recordingDuration.value += 1;
        if (recordingDuration.value >= maxRecordingDuration) {
          stopRecording();
          timer.cancel();
          Get.snackbar('انتهى الوقت', 'تم الوصول إلى الحد الأقصى للتسجيل (15 دقيقة)');
        }
      });
    } catch (e) {
      debugPrint('Error starting recording: $e');
      Get.snackbar('خطأ', 'تعذر بدء التسجيل الصوتي');
      isRecording.value = false;
      _recordingTimer?.cancel();
    }
  }
  // Future<void> stopRecording() async {
  //   try {
  //     if (!isRecording.value) return;
  //
  //     String? path = await recorder.stopRecorder();
  //     if (path != null) {
  //       sendMessage('رسالة صوتية', MessageType.audio, true, path);
  //     }
  //     recordingPath.value = '';
  //     isRecording.value = false;
  //   } catch (e) {
  //     debugPrint('Error stopping recording: $e');
  //     Get.snackbar('خطأ', 'تعذر إيقاف التسجيل الصوتي');
  //     isRecording.value = false;
  //   }
  // }

  Future<void> stopRecording() async {
    try {
      if (!isRecording.value) return;

      _recordingTimer?.cancel(); // إلغاء المؤقت
      String? path = await recorder.stopRecorder();
      if (path != null) {
        sendMessage('رسالة صوتية', MessageType.audio, true, path);
      }
      recordingPath.value = '';
      isRecording.value = false;
    } catch (e) {
      debugPrint('Error stopping recording: $e');
      Get.snackbar('خطأ', 'تعذر إيقاف التسجيل الصوتي');
      isRecording.value = false;
      _recordingTimer?.cancel();
    }
  }

  // Future<void> pickImage() async {
  //   try {
  //     final status = await Permission.photos.status;
  //     if (!status.isGranted) {
  //       await Permission.photos.request();
  //     }
  //
  //     final ImagePicker picker = ImagePicker();
  //     final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  //     if (image != null) {
  //       sendMessage('صورة', MessageType.image, true, image.path);
  //     }
  //   } catch (e) {
  //     debugPrint('Error picking image: $e');
  //     Get.snackbar('خطأ', 'تعذر اختيار الصورة');
  //   }
  // }

  // Future<void> pickMedia() async {
  //   try {
  //     // التحقق من الأذونات
  //     final PermissionState ps = await PhotoManager.requestPermissionExtend();
  //     if (!ps.hasAccess) {
  //       Get.snackbar('خطأ', 'يجب منح إذن الوصول إلى الوسائط');
  //       return;
  //     }
  //
  //     // اختيار الوسائط
  //     final List<AssetEntity>? result = await AssetPicker.pickAssets(
  //       Get.context!,
  //       pickerConfig: AssetPickerConfig(
  //         maxAssets: maxMediaSelection,
  //         requestType: RequestType.common,
  //         specialPickerType: SpecialPickerType.wechatMoment,
  //         filterOptions: FilterOptionGroup(
  //           videoOption: FilterOption(
  //             durationConstraint: DurationConstraint(max: Duration(minutes: 15)),
  //           ),
  //         ),
  //         themeColor: Colors.green,
  //       ),
  //     );
  //
  //     if (result != null && result.isNotEmpty) {
  //       await _processSelectedAssets(result);
  //     }
  //   } catch (e) {
  //     Get.snackbar('خطأ', 'تعذر اختيار الوسائط');
  //     debugPrint('Media pick error: $e');
  //   }
  // }
  Future<void> pickMedia() async {
    try {
      final PermissionState ps = await PhotoManager.requestPermissionExtend();
          if (!ps.hasAccess) {
            Get.snackbar('خطأ', 'يجب منح إذن الوصول إلى الوسائط');
            return;
          }
      final List<AssetEntity>? result = await AssetPicker.pickAssets(
        Get.context!,
        pickerConfig: AssetPickerConfig(
          maxAssets: maxMediaSelection,
          requestType: RequestType.common,
          filterOptions: FilterOptionGroup(
            imageOption: const FilterOption(
              sizeConstraint: SizeConstraint(ignoreSize: true),
            ),
            videoOption: const FilterOption(
              durationConstraint: DurationConstraint(max: Duration(minutes: 15)),
            ),
          ),
          themeColor: ColorManager.primaryColor,
        ),
      );

          if (result != null && result.isNotEmpty) {
        await _processSelectedAssets(result);
      }
    } catch (e) {
      Get.snackbar('خطأ', 'تعذر اختيار الوسائط');
      debugPrint('Media pick error: $e');
    }
  }


  // Future<void> _processSelectedAssets(List<AssetEntity> assets) async {
  //   List<MediaItemModel> mediaItems = [];
  //
  //   for (final asset in assets) {
  //     final file = await asset.file;
  //     if (file == null) continue;
  //
  //     mediaItems.add(MediaItemModel(
  //       filePath: file.path,
  //       type: asset.type == AssetType.video ? MediaType.video : MediaType.image,
  //       duration: asset.type == AssetType.video
  //           ? await _getVideoDuration(asset)
  //           : null,
  //       thumbnailPath: asset.type == AssetType.video
  //           ? await _saveVideoThumbnail(asset)
  //           : null,
  //     ));
  //   }
  //
  //   if (mediaItems.isNotEmpty) {
  //     _sendMediaMessage(mediaItems);
  //   }
  // }

  Future<void> _processSelectedAssets(List<AssetEntity> assets) async {
    List<MediaItemModel> mediaItems = [];

    for (final asset in assets) {
      final file = await asset.file;
      if (file == null) continue;

      mediaItems.add(MediaItemModel(
        filePath: file.path,
        type: asset.type == AssetType.video ? MediaType.video : MediaType.image,
        duration: asset.type == AssetType.video
            ? await _getVideoDuration(asset)
            : null,
        thumbnailPath: asset.type == AssetType.video
            ? await _saveVideoThumbnail(asset)
            : file.path, // للصور نستخدم المسار الأصلي كثمبنايل
      ));
    }

    if (mediaItems.isNotEmpty) {
      _sendMediaMessage(mediaItems);
    }
  }
  // Future<String> _getVideoDuration(AssetEntity asset) async {
  //   final duration = await asset.duration ?? Duration.zero;
  //   return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  // }

  Future<String> _getVideoDuration(AssetEntity asset) async {
    final durationInSeconds = await asset.duration; // هذا int يمثل عدد الثواني
    final duration = Duration(seconds: durationInSeconds);

    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;

    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  // Future<String?> _saveVideoThumbnail(AssetEntity asset) async {
  //   final thumbnail = await asset.thumbnailDataWithSize(const ThumbnailSize(200, 200));
  //   if (thumbnail == null) return null;
  //
  //   final directory = await getTemporaryDirectory();
  //   final path = '${directory.path}/thumb_${DateTime.now().millisecondsSinceEpoch}.jpg';
  //   await File(path).writeAsBytes(thumbnail);
  //   return path;
  // }

  Future<String?> _saveVideoThumbnail(AssetEntity asset) async {
    try {
      final uint8list = await asset.thumbnailDataWithSize(
        const ThumbnailSize(200, 200),
        quality: 80,
      );
      if (uint8list == null) return null;

      final directory = await getTemporaryDirectory();
      final path = '${directory.path}/thumb_${DateTime.now().millisecondsSinceEpoch}.jpg';
      await File(path).writeAsBytes(uint8list);
      return path;
    } catch (e) {
      debugPrint('Error generating video thumbnail: $e');
      return null;
    }
  }
  void _sendMediaMessage(List<MediaItemModel> mediaItems) {
    final isSingleImage = mediaItems.length == 1 && mediaItems.first.type == MediaType.image;
    final isSingleVideo = mediaItems.length == 1 && mediaItems.first.type == MediaType.video;

    String content;
    MessageType type;

    if (isSingleImage) {
      content = 'صورة';
      type = MessageType.image;
    } else if (isSingleVideo) {
      content = 'فيديو';
      type = MessageType.video;
    } else {
      content = '${mediaItems.length} وسائط';
      type = MessageType.mediaGroup;
    }

    messages.insert(0, MessageModel(
      content: content,
      type: type,
      isUser: true,
      mediaItems: mediaItems,
      timestamp: DateTime.now(),
    ));
  }



  Future<void> pickFile() async {
    try {
      final status = await Permission.storage.status;
      if (!status.isGranted) {
        await Permission.storage.request();
      }

      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null && result.files.isNotEmpty) {
        PlatformFile file = result.files.first;
        if (file.path != null) {
          sendMessage(file.name, MessageType.file, true, file.path!);
        }
      }
    } catch (e) {
      debugPrint('Error picking file: $e');
      Get.snackbar('خطأ', 'تعذر اختيار الملف');
    }
  }

  // void sendMessage(String content, MessageType type, bool isUser,
  //     [String? filePath]) {
  //   messages.insert(
  //       0,
  //       MessageModel(
  //         content: content,
  //         type: type,
  //         isUser: isUser,
  //         filePath: filePath,
  //         timestamp: DateTime.now(),
  //       ));
  //   textController.clear();
  // }

  void sendMessage(String content, MessageType type, bool isUser, [String? filePath]) async {
    String? duration;
    if (type == MessageType.audio && filePath != null) {
      duration = await getAudioDuration(filePath);
    }

    messages.insert(0, MessageModel(
      content: content,
      type: type,
      isUser: isUser,
      filePath: filePath,
      duration: duration,
      timestamp: DateTime.now(),
    ));
    textController.clear();
  }
  String getFileSize(String path) {
    try {
      final file = File(path);
      final size = file.lengthSync();
      if (size < 1024) return '$size B';
      if (size < 1024 * 1024) return '${(size / 1024).toStringAsFixed(1)} KB';
      return '${(size / (1024 * 1024)).toStringAsFixed(1)} MB';
    } catch (e) {
      debugPrint('Error getting file size: $e');
      return 'غير معروف';
    }
  }

  String formatDuration(double milliseconds) {
    Duration duration = Duration(milliseconds: milliseconds.toInt());
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  Future<String> getAudioDuration(String path) async {
    try {
      final player = AudioPlayer();
      await player.setFilePath(path);
      final duration = player.duration ?? Duration.zero;
      await player.dispose();
      return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
    } catch (e) {
      debugPrint('Error getting duration: $e');
      return '0:00';
    }
  }

  void seekTo(double value) {
    audioPlayer.seekToPlayer(Duration(milliseconds: value.toInt()));
  }

  void _loadInitialMessages() {
    messages.addAll([
      MessageModel(
        content: 'مرحباًا اسمي كو. قبل أن نبدأ، ما اسمك؟',
        type: MessageType.text,
        isUser: false,
        timestamp: DateTime.now(),
      ),
      MessageModel(
        content: 'تومي جيسون',
        type: MessageType.text,
        isUser: true,
        timestamp: DateTime.now(),
      ),
      MessageModel(
        content: 'مرحباًا تومي 🟢. كيف يمكنني مساعدتك اليوم؟',
        type: MessageType.text,
        isUser: false,
        timestamp: DateTime.now(),
      ),
    ]);
  }

  @override
  void onClose() {
    if (recorder.isRecording) {
      recorder.stopRecorder();
    }
    if (!recorder.isStopped) {
      recorder.closeRecorder();
    }
    audioPlayer.closePlayer();
    _progressSubscription?.cancel();
    textController.dispose();

    super.onClose();
  }
}
