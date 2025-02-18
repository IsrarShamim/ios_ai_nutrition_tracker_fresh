import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../../../data/database/entities/chat_message.dart';
import '../../../data/database/repositories/chat_message_repo.dart';
import '../../../data/gemini/GeminiModels.dart';
import '../../../data/util/GetDate.dart';
import '../../auth/welcomescreens/2GoogleSignInScreen.dart';


class ChatProvider extends ChangeNotifier {
  List<ChatMessage> messages = [];
  bool isResponseComing = false;
  final ChatRepository repository;

  /// The selected date (as a string) for which messages are shown.
  String selectedDate = getCurrentDate();


  final ScrollController scrollController = ScrollController();

  // Add disposal
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  // Add scroll to bottom method
  void scrollToBottom({bool animate = true}) {
    if (!scrollController.hasClients) return;

    final position = scrollController.position.maxScrollExtent;
    if (animate) {
      scrollController.animateTo(
        position,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutQuart,
      );
    } else {
      scrollController.jumpTo(position);
    }
  }

  ChatProvider({required this.repository}) {
    // Initially load messages for the selected date.
    _loadMessages();
    // Listen to changes in the chat collection.
    repository.watchChatMessages().listen((_) {
      _loadMessages();
    });
  }

  /// Loads messages for the current selected date from the repository.
  Future<void> _loadMessages() async {
    messages = await repository.getMessagesForDate(selectedDate);
    notifyListeners();
  }

  /// Allows the UI (or another provider) to change the selected date.
  Future<void> changeDate(String newDate) async {
    selectedDate = newDate;
    await _loadMessages();
  }

  /// Sends the user's message and streams back the response as plain text.
  Future<void> sendUserMessage(String text, {String? imagePath}) async {
    final now = DateTime.now();

    // Create and add the user's message.
    final userMessage = ChatMessage()
      ..message = text
      ..timestamp = now
      ..isFromUser = true
      ..dateString = selectedDate;
    if (imagePath != null) {
      userMessage.imageUrl = imagePath;
    }

    // logger.d("chat message - .> ${userMessage.toString()}");
    await repository.addMessage(userMessage);
    isResponseComing = true;
    notifyListeners();

    // Create a placeholder message for the backend's response.
    final generatingMessage = ChatMessage()
      ..message = ""
      ..timestamp = now
      ..isFromUser = false
      ..dateString = selectedDate;
    await repository.addMessage(generatingMessage);
    notifyListeners();

    // Create the Gemini request content.
    final Content content;
    if (imagePath != null) {
      final File imageFile = File(imagePath);
      final imageInBytes = await imageFile.readAsBytes();
      content = Content.multi([
        TextPart(text),
        // The only accepted MIME types are image/*.
        DataPart('image/jpeg', imageInBytes),
      ]);
    } else {
      content = Content.text(text);
    }

    // Get the streaming response from Gemini.
    final Stream<GenerateContentResponse> responseStream =
    geminiChatSession.sendMessageStream(content);

    // Process each plain text chunk as it arrives.
    await for (final chunk in responseStream) {
      // Append the new chunk's text to the existing message.
      generatingMessage.message = (generatingMessage.message ?? "") + (chunk.text ?? "");

      logger.d("generatingMessagegeneratingMessage -- > \n\n ${generatingMessage.message}");

      // Update the message record in the repository.
      await repository.addMessage(generatingMessage);
      notifyListeners();
    }

    // Optionally, mark that the response is finished.
    isResponseComing = false;
    notifyListeners();
  }



}
