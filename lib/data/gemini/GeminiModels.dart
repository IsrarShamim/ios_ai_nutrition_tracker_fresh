

import 'package:ai_nutrition_tracker_for_ios/data/gemini/prompts/GeminiChatModelInstruction.dart';
import 'package:ai_nutrition_tracker_for_ios/main.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../database/repositories/user_information_repo.dart';

final gemini1Point5ProWelcomeMessage = GenerativeModel(
  model: "gemini-1.5-pro",
  apiKey: apiKey,
  generationConfig: GenerationConfig(
    temperature: 1.0,
    topP: 0.8,
  ),
);

final gemini1Point5ProForFoodScan = GenerativeModel(
  model: "gemini-1.5-pro",
  apiKey: apiKey,
  generationConfig: GenerationConfig(
    temperature: 1.0,
    topP: 0.8,
    responseMimeType: "application/json",
  ),

);
final gemini1Point5ProForChat= GenerativeModel(
  model: "gemini-2.0-flash-001",
  apiKey: apiKey,
  generationConfig: GenerationConfig(
    temperature: 1.0,
    topP: 0.8
  ),

);

final gemini1Point5ProForRecipeGeneration = GenerativeModel(
  model: "gemini-1.5-pro",
  apiKey: apiKey,
  generationConfig: GenerationConfig(
    temperature: 1.0,
    topP: 0.8,
    responseMimeType: "application/json",
  ),

);

late ChatSession geminiChatSession;
final geminiForRecipeGeneration = gemini1Point5ProForRecipeGeneration.startChat();

Future<void> initializeGeminiChatSession() async {
  final userRepository = UserInfoRepository();

  // Retrieve the user information (returns null if not found).
  final userInfo = await userRepository.getUserInformationEntity();

  // Determine the prompt text based on the availability of user information.
  final promptText = userInfo != null
      ? generateNutritionistPrompt(userInfo)
      : generateNutritionistPromptWhenUserInfoIsNotAvailable();

  // Initialize the global geminiChatSession with the personalized (or default) prompt.
  geminiChatSession = gemini1Point5ProForChat.startChat(
    history: [
      Content.text(promptText),
    ],
  );
}


final gemini1Point5FlashForFoodScan = GenerativeModel(
  model: "gemini-1.5-flash",
  apiKey: apiKey,
  generationConfig: GenerationConfig(
    temperature: 1.0,
    topP: 0.8,
    responseMimeType: "application/json",
  ),
);

final gemini1Point5FlashWelcomeMessage = GenerativeModel(
  model: "gemini-1.5-flash",
  apiKey: apiKey,
  generationConfig: GenerationConfig(
    temperature: 1.0,
    topP: 0.8,
  ),
);

final gemini1WelcomeMessage = GenerativeModel(
  model: "gemini-1.0-pro",
  apiKey: apiKey,
  generationConfig: GenerationConfig(
    temperature: 1.0,
    topP: 0.8,
  ),
);



