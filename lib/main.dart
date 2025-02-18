import 'dart:ui';
import 'package:ai_nutrition_tracker_for_ios/data/database/entities/nutrition_goal_holder.dart';
import 'package:ai_nutrition_tracker_for_ios/data/database/entities/user_information.dart';
import 'package:ai_nutrition_tracker_for_ios/ui/auth/splash/SplashScreen.dart';
import 'package:ai_nutrition_tracker_for_ios/ui/auth/welcome_provider.dart';
import 'package:ai_nutrition_tracker_for_ios/ui/auth/welcomescreens/10RelisticGoalScreen.dart';
import 'package:ai_nutrition_tracker_for_ios/ui/auth/welcomescreens/11HowFastPerWeek.dart';
import 'package:ai_nutrition_tracker_for_ios/ui/auth/welcomescreens/12WithUsVsWithOurUs.dart';
import 'package:ai_nutrition_tracker_for_ios/ui/auth/welcomescreens/13ActivityLevel.dart';
import 'package:ai_nutrition_tracker_for_ios/ui/auth/welcomescreens/14DietScreen.dart';
import 'package:ai_nutrition_tracker_for_ios/ui/auth/welcomescreens/15OtherGoalsScreen.dart';
import 'package:ai_nutrition_tracker_for_ios/ui/auth/welcomescreens/16WeightTransitionScreen.dart';
import 'package:ai_nutrition_tracker_for_ios/ui/auth/welcomescreens/17TestimonialsScreen.dart';
import 'package:ai_nutrition_tracker_for_ios/ui/auth/welcomescreens/18CreatePlanScreen.dart';
import 'package:ai_nutrition_tracker_for_ios/ui/auth/welcomescreens/19MyPlanScreen.dart';
import 'package:ai_nutrition_tracker_for_ios/ui/auth/welcomescreens/1WelcomeScreen.dart';
import 'package:ai_nutrition_tracker_for_ios/ui/auth/welcomescreens/20AdviceScreen.dart';
import 'package:ai_nutrition_tracker_for_ios/ui/auth/welcomescreens/21SubscribeScreen.dart';
import 'package:ai_nutrition_tracker_for_ios/ui/auth/welcomescreens/22GetSubscriptionScreen.dart';
import 'package:ai_nutrition_tracker_for_ios/ui/auth/welcomescreens/2GoogleSignInScreen.dart';
import 'package:ai_nutrition_tracker_for_ios/ui/auth/welcomescreens/3NameScreen.dart';
import 'package:ai_nutrition_tracker_for_ios/ui/auth/welcomescreens/4GenderScreen.dart';
import 'package:ai_nutrition_tracker_for_ios/ui/auth/welcomescreens/5ReachYourGoalsFaster.dart';
import 'package:ai_nutrition_tracker_for_ios/ui/auth/welcomescreens/6HeightAndWeightScreen.dart';
import 'package:ai_nutrition_tracker_for_ios/ui/auth/welcomescreens/7AgeScreen.dart';
import 'package:ai_nutrition_tracker_for_ios/ui/auth/welcomescreens/8WeightGoalTypeScreen.dart';
import 'package:ai_nutrition_tracker_for_ios/ui/auth/welcomescreens/9DesiredWeightScreen.dart';
import 'package:ai_nutrition_tracker_for_ios/ui/screens/HomeScreen.dart';
import 'package:ai_nutrition_tracker_for_ios/ui/screens/ai_recipe_generation/GeneratedRecipe.dart';
import 'package:ai_nutrition_tracker_for_ios/ui/screens/ai_recipe_generation/RecipeDetails.dart';
import 'package:ai_nutrition_tracker_for_ios/ui/screens/chat_screen/ChatProvider.dart';
import 'package:ai_nutrition_tracker_for_ios/ui/screens/chat_screen/MainChatScreen.dart';
import 'package:ai_nutrition_tracker_for_ios/ui/screens/diary/DiaryProvider.dart';
import 'package:ai_nutrition_tracker_for_ios/ui/screens/meals/FoodAnalysisProvider.dart';
import 'package:ai_nutrition_tracker_for_ios/ui/screens/meals/MealScreen.dart';
import 'package:ai_nutrition_tracker_for_ios/ui/screens/profile_screen/MainProfileScreen.dart';
import 'package:ai_nutrition_tracker_for_ios/ui/screens/track_food/CameraFeedScreen.dart';
import 'package:ai_nutrition_tracker_for_ios/ui/screens/track_food/FoodLoggingScreen.dart';
import 'package:ai_nutrition_tracker_for_ios/ui/screens/track_food/RecentMealHistory.dart';
import 'package:ai_nutrition_tracker_for_ios/ui/screens/track_food/TrackFoodProvider.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart'; // Ensure this line is present and correct
import 'data/database/entities/chat_message.dart';
import 'data/database/entities/meal_entities.dart';
import 'data/database/entities/nutrition_entities.dart';
import 'data/database/repositories/chat_message_repo.dart';
import 'data/database/repositories/meal_repo.dart';
import 'data/database/repositories/nutrition_repo.dart';
import 'data/database/repositories/user_information_repo.dart';
import 'data/gemini/GeminiModels.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

late Isar isar; // Globally accessible Isar instance

const apiKey = 'AIzaSyCfD7HlwTLAKy4uQI-7dUOV_LmUFi8H3lA';

late List<CameraDescription> globalCameras;

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter binding is initialized
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Gemini.init(apiKey: apiKey);

  final dir = await getApplicationDocumentsDirectory();
  isar = await Isar.open(
    [UserInformationEntitySchema,NutritionSchema, NutritionGoalSchema, NutritionUploadStatusSchema,NutritionGoalHolderSchema,ChatMessageSchema,MealSchema,IndividualWaterLogSchema], // Pass the schema of your entity
    directory: dir.path,
  );

  // Obtain the list of cameras and assign it to the global variable:
  globalCameras = await availableCameras();

  // Make sure to initialize the chat session before using it elsewhere.
  await initializeGeminiChatSession();
  runApp(

    MultiProvider(
      providers: [

        // You already provide your WelcomeScreenProvider:
        ChangeNotifierProvider(create: (_) => WelcomeScreenProvider()),
        ChangeNotifierProvider(create: (_) => DiaryProvider()),
        ChangeNotifierProvider(create: (_) => FoodAnalysisProvider()),
        ChangeNotifierProvider(create: (_) => FoodAnalysisProvider2()),
        // Provide your repositories as singletons:
        Provider<ChatRepository>(create: (_) => ChatRepository(isar)),
        Provider<MealRepository>(create: (_) => MealRepository(isar)),
        Provider<NutritionRepository>(create: (_) => NutritionRepository(isar)),
        Provider<UserInfoRepository>(create: (_) => UserInfoRepository()),
        ChangeNotifierProvider(
          create: (context) => ChatProvider(
            repository: context.read<ChatRepository>(),
          ),
        ),
        Provider<NutritionLoaderService>(
          create: (context) => NutritionLoaderService(
            nutritionRepository: context.read<NutritionRepository>(),
          ),
        ),
        ChangeNotifierProvider<RecipeDetailsProvider>(
          create: (context) => RecipeDetailsProvider(context),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return CupertinoApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      title: 'AI Nutrition Tracker',
      theme: const CupertinoThemeData(
        brightness: Brightness.light,
      ),
      builder: (context, child) { // Wrap the child with Localizations
        return Localizations(
          locale: const Locale('en', 'US'), // Or your default locale
          delegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate, // Needed for Cupertino widgets
          ],
          child: child!, // Pass the child down
        );
      },
    );
  }
}

// Create a function to check authentication status
Future<bool> isUserAuthenticated() async {
  try {
    final user = FirebaseAuth.instance.currentUser; // Check current Firebase user
    return user != null; // True if logged in, false otherwise
  } catch (e) {
    return false;  // Handle error appropriately (e.g., show error message)
  }
}


class AnotherScreen extends StatelessWidget {
  const AnotherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(  // Ensure it has a Scaffold
      appBar: AppBar(title: const Text('Another Screen')),
      body: const Center(child: Text('Another Screen Content')),
    );
  }
}


// Assume that StatefulNavigationShell is coming from your GoRouter configuration.
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, required this.navigationShell}) : super(key: key);

  /// The navigation shell and container for the bottom navigation bar.
  final StatefulNavigationShell navigationShell;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  /// We maintain a local index for the bottom navigation bar.
  ///
  /// 0: Home (branch 0 in the navigation shell)
  /// 1: Chat (external route)
  /// 2: Recipes (external route)
  /// 3: Profile (branch 1 in the navigation shell)
  int _selectedIndex = 0;

  /// Called when a bottom navigation item is tapped.
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
      // Home: Navigate within the shell.
        widget.navigationShell.goBranch(0, initialLocation: true);
        break;
      case 1:
      // Chat: Push the ChatScreen route.
        context.pushNamed('ChatScreen');
        break;
      case 2:
      // Recipes: Push the recipe generation route.
        context.pushNamed('recipe_generation_screen');
        break;
      case 3:
      // Profile: Navigate within the shell.
        widget.navigationShell.goBranch(1, initialLocation: true);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The body is your navigation shell.
      body: widget.navigationShell,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          context.pushNamed('food_logging_screen');
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.add, size: 36, color: Colors.white), // This ensures a circular shape.
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // Set your desired colors:
        selectedItemColor: CupertinoColors.activeBlue,
        unselectedItemColor: CupertinoColors.systemGrey,
        backgroundColor: CupertinoColors.systemBackground,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(
              icon: Icon(Icons.auto_stories), label: 'Recipes'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}



//  GoRouter configuration
final GoRouter router = GoRouter(
  initialLocation: '/splash',
  redirect: (context, state) async {
    final isAuthenticated = await isUserAuthenticated();
    if (state.uri.toString() == '/splash') {
      return isAuthenticated ? '/home' : '/welcome';
    }
    return null;
  },
  routes: <RouteBase>[
    GoRoute(
      path: '/splash',
      name: 'splash',
      pageBuilder: (context, state) => MaterialPage<void>(
        key: state.pageKey,
        child: SplashScreen(
          onNavigateToWelcome: () => context.goNamed('welcome'),
          onNavigateToHome: () => context.goNamed('home'),
        ),
      ),
    ),
    GoRoute(
      path: '/welcome',
      name: 'welcome',
      pageBuilder: (context, state) => MaterialPage<void>(
        key: state.pageKey,
        child: AWelcomeScreen(),
      ),
    ),
    GoRoute(
      path: '/googleSignIn',
      name: 'googleSignIn',
      pageBuilder: (context, state) => MaterialPage<void>(
        key: state.pageKey,
        child: GoogleSignInScreen(),
      ),
    ),
    GoRoute(
      path: '/name_screen',
      name: 'name_screen',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: NameScreen(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
    ),
    GoRoute(
      path: '/gender_screen',
      name: 'gender_screen',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: GenderScreen(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
    ),
    GoRoute(
      path: '/reach_your_goals',
      name: 'reach_your_goals',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: ThirdScreen(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
    ),
    GoRoute(
      path: '/height_and_weight_screen',
      name: 'height_and_weight_screen',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: WeightAndDietScreen(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
    ),
    GoRoute(
      path: '/age_screen',
      name: 'age_screen',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: AgeScreen(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
    ),
    GoRoute(
      path: '/weight_goal_type_screen',
      name: 'weight_goal_type_screen',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: GoalSettingScreen(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
    ),
    GoRoute(
      path: '/desired_weight_goal_screen',
      name: 'desired_weight_goal_screen',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: ChooseDesiredWeightScreen(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
    ),
    GoRoute(
      path: '/is_realistic_target_screen',
      name: 'is_realistic_target_screen',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: IsRealisticTargetScreen(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
    ),
    GoRoute(
      path: '/how_fast_per_week',
      name: 'how_fast_per_week',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: WeightDifferencePerWeekScreen(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
    ),
    GoRoute(
      path: '/with_us_vs_without_us',
      name: 'with_us_vs_without_us',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: WithUsVsWithoutUsScreen(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
    ),
    GoRoute(
      path: '/activity_level_of_user',
      name: 'activity_level_of_user',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: ActivityAndGoalScreen(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
    ),
    GoRoute(
      path: '/diet_screen',
      name: 'diet_screen',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: DietScreen(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
    ),
    GoRoute(
      path: '/other_goals_screen',
      name: 'other_goals_screen',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: OtherGoalsScreen(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
    ),
    GoRoute(
      path: '/weight_transition_screen',
      name: 'weight_transition_screen',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: WeightTransitionScreen(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
    ),
    GoRoute(
      path: '/testimonials_screen',
      name: 'testimonials_screen',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: TestimonialsScreen(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
    ),
    GoRoute(
      path: '/create_plan_screen',
      name: 'create_plan_screen',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child:  CreatePlanScreen(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
    ),
    GoRoute(
      path: '/my_plan_screen',
      name: 'my_plan_screen',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child:  MyPlanScreen(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
    ),
    GoRoute(
      path: '/advice_screen',
      name: 'advice_screen',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child:  CompleteOnboardingFlowScreenDart(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
    ),
    GoRoute(
      path: '/subscription_plan',
      name: 'subscription_plan',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child:  OnboardingSubscribeScreen(navigateToNextScreen: () {  }, navigateBack: () {  },),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
    ),
    GoRoute(
      path: '/subscribe_screen',
      name: 'subscribe_screen',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child:  SubscriptionScreen(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
    ),
    GoRoute(
      path: '/camera_access',
      name: 'camera_access',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child:CustomCameraScreen(cameras: globalCameras),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
    ),
    GoRoute(
      path: '/DisplayPictureScreen',
      name: 'DisplayPictureScreen',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child:DisplayPictureScreen(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
    ),
    GoRoute(
      path: '/ChatScreen',
      name: 'ChatScreen',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child:ChatScreen(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
    ),
    GoRoute(
      path: '/recipe_generation_screen',
      name: 'recipe_generation_screen',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: RecipeGenerationScreen2(), // This screen should not have its own nav bar.
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
    ),

    GoRoute(
      path: '/AIRecipeGenerationScreen',
      name: 'AIRecipeGenerationScreen',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child:RecipeGenerationScreen2(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
    ),
    GoRoute(
      path: '/recipe_details_screen',
      name: 'recipe_details_screen',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child:RecipeDetailsScreen(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
    ),
    GoRoute(
      path: '/meal_details_screen',
      name: 'meal_details_screen',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child:MealDetailsScreen( ),
        transitionDuration: const Duration(milliseconds: 400),  // Smooth duration
        reverseTransitionDuration: const Duration(milliseconds: 400),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // Slide and fade transition
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),  // Start from bottom (0, 1)
              end: Offset.zero,           // End at current position
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutCubic,  // Smooth easing curve
              ),
            ),
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
      ),
    ),
    GoRoute(
      path: '/recent_meal_history',
      name: 'recent_meal_history',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child:RecentMealsScreen( ),
        transitionDuration: const Duration(milliseconds: 400),  // Smooth duration
        reverseTransitionDuration: const Duration(milliseconds: 400),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // Slide and fade transition
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),  // Start from bottom (0, 1)
              end: Offset.zero,           // End at current position
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutCubic,  // Smooth easing curve
              ),
            ),
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
      ),
    ),
    GoRoute(
      path: '/food_logging_screen',
      name: 'food_logging_screen',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const FoodLoggingScreen(),
        transitionDuration: const Duration(milliseconds: 400),  // Smooth duration
        reverseTransitionDuration: const Duration(milliseconds: 400),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // Slide and fade transition
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),  // Start from bottom (0, 1)
              end: Offset.zero,           // End at current position
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutCubic,  // Smooth easing curve
              ),
            ),
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
      ),
    ),
    StatefulShellRoute.indexedStack(
      builder: (BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
        return MainScreen(navigationShell: navigationShell);
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/home',
              name: 'home',
              pageBuilder: (context, state) => CustomTransitionPage(
                key: state.pageKey,
                child: HomeScreen(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero,
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return child;
                },
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/profile_screen',
              name: 'profile_screen',
              pageBuilder: (context, state) => CustomTransitionPage(
                key: state.pageKey,
                child: ProfileScreen(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero,
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return child;
                },
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
