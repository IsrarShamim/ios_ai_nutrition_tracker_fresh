import 'package:ai_nutrition_tracker_for_ios/data/database/entities/user_information.dart';
import 'package:ai_nutrition_tracker_for_ios/ui/common/welcome_screen_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'dart:async';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../data/data_classes/nutrition/NutrientDataClasses.dart';
import '../../../data/database/entities/nutrition_goal_holder.dart';
import '../../../data/database/repositories/nutrition_repo.dart';
import '../../../data/database/repositories/user_information_repo.dart';
import '../../../data/gemini/GeminiModels.dart';
import '../../../data/util/CalculateTheTargetNutritionPlan.dart';
import '../welcome_provider.dart';
import '2GoogleSignInScreen.dart';
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';

class CreatePlanScreen extends StatefulWidget {
  const CreatePlanScreen({super.key});

  @override
  State<CreatePlanScreen> createState() => _CreatePlanScreenState();
}

class _CreatePlanScreenState extends State<CreatePlanScreen>
    with SingleTickerProviderStateMixin {
  late ConfettiController _confettiController;
  late AnimationController _iconController;
  late Animation<double> _iconAnimation;
  bool _isNextClicked = false;
  String _buttonText = "Create my plan";
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 10));
    _iconController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _iconAnimation = Tween<double>(begin: 0.9, end: 1.1).animate(
      CurvedAnimation(
        parent: _iconController,
        curve: Curves.easeInOutBack,
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _iconController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _iconController.forward();
        }
      });

    _iconController.forward();
    _confettiController.play();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    _iconController.dispose();
    super.dispose();
  }

  Future<void> _startLoading() async {
    final provider = Provider.of<WelcomeScreenProvider>(context, listen: false);
    // Access your UserInfoRepository using Provider
    final userRepository = Provider.of<UserInfoRepository>(context, listen: false);
    setState(() {
      _isNextClicked = true;
      _progress = 0.0;
    });

    const totalDuration = Duration(seconds: 5);
    const interval = Duration(milliseconds: 100);
    final steps = totalDuration.inMilliseconds ~/ interval.inMilliseconds;

    for (int i = 0; i <= steps; i++) {
      await Future.delayed(interval);
      setState(() {
        _progress = i / steps;
        _buttonText = _getLoadingText(_progress);
      });
    }


    UserInformationEntity userInformation = provider.userInformationHolder;
    // logger.d("UserInformation before calculation:");
    // logger.d("  ID: ${userInformation.id}");
    // logger.d("  Name: ${userInformation.name}");
    // logger.d("  Age: ${userInformation.age}");
    // logger.d("  Weight: ${userInformation.weight} ${userInformation.weightUnit}");
    // logger.d("  Height: ${userInformation.height} ${userInformation.heightUnit}");
    // logger.d("  Gender: ${userInformation.gender}");
    // logger.d("  Location: ${userInformation.location}");
    // logger.d("  Diet: ${userInformation.diet}");
    // logger.d("  Goal: ${userInformation.goal}");
    // logger.d("  Current Activity Level: ${userInformation.currentActivityLevel}");
    // logger.d("  Exercise: ${userInformation.exercise}");
    // logger.d("  Exercise Amount: ${userInformation.exerciseAmount}");
    // logger.d("  Weight Goal: ${userInformation.weightGoal}");
    // logger.d("  Weight Goal Per Week: ${userInformation.weightGoalPerWeek}");
    // logger.d("  Weight Records: ${userInformation.weightRecords}");
    // logger.d("  Weight Records Time: ${userInformation.weightRecordsTime}");
    // logger.d("  Weight Records For Next 3 Months: ${userInformation.weightRecordsForNext3Months}");
    // logger.d("  Weight Records Time For Next 3 Months: ${userInformation.weightRecordsTimeForNext3Months}");

    calculateTheTargetCalorieAndNutrientIntakeOfUser(
        userInformation: provider.userInformationHolder,
        returnTheNutritionPlan: (nutritionPlan)  async {
          // logger.d("inside the async");
          provider.nutritionPlan = nutritionPlan;
          // logger.d("1");
          User? user = FirebaseAuth.instance.currentUser; // Get current Firebase user
          // logger.d("2");

          final goalHolder = NutritionGoalHolder.fromNutritionPlan(nutritionPlan);

          final nutritionRepository = Provider.of<NutritionRepository>(context, listen: false); // Access the repository

          // logger.d("3");
          context.pushNamed('my_plan_screen');
          // logger.d("4");
          await nutritionRepository.upsertNutritionGoal(goalHolder);


          // logger.d("pushed below");


          FirebaseFirestore firestore = FirebaseFirestore.instance; // Get Firestore instance

          Map<String, dynamic> userData = <String, dynamic>{ // Dart Map for userData
            "uid": user?.uid,
            "displayName": provider.userInformationHolder.name,
            "email": user?.email,
            "photoUrl": user?.photoURL,
            "phoneNumber": user?.phoneNumber,
            "age": provider.userInformationHolder.age,
            "gender": provider.userInformationHolder.gender,
            "weight": provider.userInformationHolder.weight,
            "weightUnit": provider.userInformationHolder.weightUnit,
            "height": provider.userInformationHolder.height,
            "heightUnit": provider.userInformationHolder.heightUnit,
            "location": provider.userInformationHolder.location,
            "diet": provider.userInformationHolder.diet,
            "goal": provider.userInformationHolder.goal,
            "currentActivityLevel": provider.userInformationHolder.currentActivityLevel,
            "exercise": provider.userInformationHolder.exercise,
            "exerciseAmount": provider.userInformationHolder.exerciseAmount,
            "weightGoal": provider.userInformationHolder.weightGoal,
            "weightGoalPerWeek": provider.userInformationHolder.weightGoalPerWeek,
            "weightRecords": ["Code:Split69${provider.userInformationHolder.weight}"], // Example List<String>
            "weightRecordsTime": ["Code:Split69${DateTime.now().toString()}"], // Example List<String> - use proper date formatting if needed
            "usersAllNutritionInformation": <Map<String, dynamic>>[], // Example empty List<Map>
            "userAllMealEntities": <Map<String, dynamic>>[], // Example empty List<Map>
            "usersAllIndividualWaterLogs": <Map<String, dynamic>>[], // Example empty List<Map>
            "weightRecordsForNext3Months": [], // Example empty list, replace with projectedWeights if you translate that logic
            "weightRecordsTimeForNext3Months": [], // Example empty list, replace with projectedDates if you translate that logic
          };

          logger.e("userRelated: userData---> $userData");

          // chatViewModel.onlySendMessage(...) -  Dart equivalent would depend on your chatViewModel implementation

          // Make new document for this user in Firestore
          userRepository.insertUserInformation(provider.userInformationHolder);
          userRepository.addWeightRecord(75.5);
          firestore.collection("Users")
              .doc(user!.uid) // Use user!.uid as document ID (assuming user is not null here)
              .set(userData)
              .then((value) {
            // On success
            // informationScreenViewmodel.insertUserInformation(...) - Dart equivalent would depend on your informationScreenViewmodel/repository implementation
            // Assuming you have a UserInfoRepository instance: // Get your UserInfoRepository instance

            // ScaffoldMessenger.of(context).showSnackBar(
            //   const SnackBar(content: Text("User registered!")), // Dart SnackBar for Toast-like message
            // );
            context.pushNamed('my_plan_screen'); // Navigate after successful registration
          }).catchError((error) {
            // On failure
            // logger.e("failedTORegist: message -- > ${error.message} cause - > ${error.toString()}");
            // ScaffoldMessenger.of(context).showSnackBar(
            //   SnackBar(content: Text("Failed to register user! Error: ${error.message}")), // Dart SnackBar for error message
            // );
          });
          _isNextClicked = false;
        }
    );
  }

  String _getLoadingText(double progress) {
    if (progress < 0.3) return "Setting up AI...";
    if (progress < 0.6) return "Analyzing preferences...";
    if (progress < 0.9) return "Generating plan...";
    return "Finalizing...";
  }

  @override
  Widget build(BuildContext context) {

    final brightness = CupertinoTheme.brightnessOf(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemBackground,
      child: Stack(
        children: [
          // Confetti
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: true,
              colors: const [
                Color(0xfffce18a),
                Color(0xffff726d),
                Color(0xfff4306d),
                Color(0xffb48def),
              ],
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  WelcomeScreenNumberIndicator(
                    currentScreen: 16,
                    onBackPressed: () {
                      context.pop();
                    },
                  ),
                  Expanded(
                    child: Center(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: _isNextClicked
                            ? _buildProgressContent()
                            : _buildInitialContent(),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: _isNextClicked ? 0 : screenWidth * 0.9,
                    height: _isNextClicked ? 0 : 50,
                    child: CupertinoButton.filled(
                      onPressed: _startLoading,
                      borderRadius: BorderRadius.circular(25),
                      child: Text(
                        "Create my plan",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: CupertinoColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInitialContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ScaleTransition(
          scale: _iconAnimation,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: CupertinoColors.systemGrey5,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(
                CupertinoIcons.checkmark_alt_circle_fill,
                size: 120,
                color: CupertinoColors.activeBlue,
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),
        Text(
          "All set!",
          style: CupertinoTheme.of(context)
              .textTheme
              .navLargeTitleTextStyle
              .copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          "Your information is safe and secure.",
          style: CupertinoTheme.of(context).textTheme.textStyle,
        ),
        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            "Time to create your perfect custom nutrition plan!",
            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildProgressContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _buttonText,
          style:
              CupertinoTheme.of(context).textTheme.navTitleTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.activeBlue,
                  ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: 84,
          height: 84,
          child: CircularProgressIndicator(
            value: _progress,
            strokeWidth: 12,
            color: CupertinoColors.activeBlue,
          ),
        ),
      ],
    );
  }
}
