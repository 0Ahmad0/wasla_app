import 'package:wasla_app/app/features/customer_support/models/media_item_model.dart';

import '../enum/message_type.dart';

class MessageModel {
  final String id;
  final String content;
  final MessageType type;
  final bool isUser;
  final String? filePath;
  final DateTime timestamp;

  // حساب مدة الرسالة عند التحميل لمرة واحدة
  final String? duration;

  final List<MediaItemModel>? mediaItems;

  MessageModel({
    required this.content,
    required this.type,
    required this.isUser,
    this.filePath,
    this.duration,
    this.mediaItems,
    DateTime? timestamp,
  })  : id = DateTime.now().millisecondsSinceEpoch.toString(),
        timestamp = timestamp ?? DateTime.now();
}
