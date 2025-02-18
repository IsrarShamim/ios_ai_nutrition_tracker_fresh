// chat_repository.dart
import 'package:ai_nutrition_tracker_for_ios/data/database/entities/chat_message.dart';
import 'package:isar/isar.dart';

class ChatRepository {
  final Isar isar;

  ChatRepository(this.isar);

  Stream<void> watchChatMessages() {
    return isar.chatMessages.watchLazy();
  }

  Future<List<ChatMessage>> getAllMessages() async {
    return isar.chatMessages.where().sortByTimestamp().findAll();
  }


  Future<List<ChatMessage>> getMessagesForDate(String date) async {
    return isar.chatMessages.where().dateStringEqualTo(date).sortByTimestamp().findAll();
  }

  Future<void> addMessage(ChatMessage message) async {
    await isar.writeTxn(() async {
      await isar.chatMessages.put(message);
    });
  }


  Future<void> clearAllMessages() async {
    await isar.writeTxn(() async {
      await isar.chatMessages.clear();
    });
  }
}