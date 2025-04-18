import '../enum/message_type.dart';

class MessageModel {
  final String id;
  final String content;
  final MessageType type;
  final bool isUser;
  final String? filePath;
  final DateTime timestamp;

  MessageModel({
    required this.content,
    required this.type,
    required this.isUser,
    this.filePath,
    DateTime? timestamp,
  }) :
        id = DateTime.now().millisecondsSinceEpoch.toString(),
        timestamp = timestamp ?? DateTime.now();
}