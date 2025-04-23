import '../enum/media_type.dart';

class MediaItemModel {
  final String filePath;
  final MediaType type;
  final String? thumbnailPath; // للفيديوهات
  final String? duration; // للفيديوهات

  MediaItemModel({
    required this.filePath,
    required this.type,
    this.thumbnailPath,
    this.duration,
  });
}