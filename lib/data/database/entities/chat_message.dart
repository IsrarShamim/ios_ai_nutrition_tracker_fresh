import 'dart:ffi';

import 'package:isar/isar.dart';
part 'chat_message.g.dart';

@collection
class ChatMessage {
  Id id = Isar.autoIncrement;

  String? message;
  DateTime timestamp = DateTime.now().toUtc(); // Store as DateTime for accurate ordering
  String? imageUrl; // Nullable, for messages with images

  @Index()
  String? dateString; // 'YYYY-MM-DD' format for grouping messages by day (optional)

  // Set isFromUser as a non-nullable boolean with a default value.
  bool isFromUser = false;

  // Constructor: Require isFromUser, or provide a default if you prefer.
  // ChatMessage({this.message, DateTime? timestamp, this.imageUrl, this.dateString, this.isFromUser = false}) {
  //   if (timestamp != null) {
  //     this.timestamp = timestamp;
  //   }
  // }

  @override
  String toString() {
    return 'ChatMessage{id: $id, message: $message, timestamp: $timestamp, imageUrl: $imageUrl, dateString: $dateString, isFromUser: $isFromUser}';
  }
}
