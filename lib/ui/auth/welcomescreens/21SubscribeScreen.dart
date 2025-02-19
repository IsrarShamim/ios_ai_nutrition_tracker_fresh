import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';

/// -------------------------
/// Onboarding Subscribe Screen
/// -------------------------
class OnboardingSubscribeScreen extends StatelessWidget {
  final VoidCallback navigateToNextScreen;
  final VoidCallback navigateBack;

  const OnboardingSubscribeScreen({
    Key? key,
    required this.navigateToNextScreen,
    required this.navigateBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return CupertinoPageScaffold(
      backgroundColor: Color(0xFF282423
),
      child: SafeArea(
        child: Column(
          children: [
            // Top section with video pages and back button.
            Expanded(
              child: Stack(
                children: [
                  SubscriptionVideoPages(),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: navigateBack,
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          shape: BoxShape.circle,
                        ),
                        child: Transform.rotate(
                          angle: 45 * 3.1416 / 180,
                          child: Icon(
                            CupertinoIcons.add,
                            size: 20,
                            color: Color(0xFF282423
),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Bottom section with subscription text and button.
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: CupertinoColors.systemBackground,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Unlimited access to",
                    textAlign: TextAlign.center,
                    style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.systemGrey.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "AI Nutrition Tracker",
                    textAlign: TextAlign.center,
                    style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle.copyWith(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SizedBox( // <-- Added SizedBox here
                      width: double.infinity, // <-- Set width to double.infinity to fill parent
                      child: CupertinoButton.filled(
                        onPressed: () {
                          context.pushNamed('subscribe_screen'); // Adjust route as needed
                        },
                        borderRadius: BorderRadius.circular(27),
                        child: const Text(
                          "Unlock Now!",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// -------------------------
/// Subscription Video Pages
/// -------------------------
class SubscriptionVideoPages extends StatefulWidget {
  const SubscriptionVideoPages({Key? key}) : super(key: key);

  @override
  State<SubscriptionVideoPages> createState() => _SubscriptionVideoPagesState();
}

class _SubscriptionVideoPagesState extends State<SubscriptionVideoPages> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final int _pageCount = 3;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // PageView: Three pages for Food Scan Video, Reviews, and AI Recipe Video.
        PageView(
          controller: _pageController,
          onPageChanged: (page) => setState(() => _currentPage = page),
          children: [
            const FoodScanVideo(),
            const AIRecipeVideo(),
            const ReviewsListPage(),
          ],
        ),
        // Custom Page Indicator at the bottom center.
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_pageCount, (index) {
              bool isSelected = index == _currentPage;
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? Colors.white : Colors.grey,
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

/// -------------------------
/// Food Scan Video (Placeholder)

class FoodScanVideo extends StatefulWidget {
  const FoodScanVideo({Key? key}) : super(key: key);

  @override
  _FoodScanVideoState createState() => _FoodScanVideoState();
}

class _FoodScanVideoState extends State<FoodScanVideo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      'assets/videos/scanfood.mp4',
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    )..initialize().then((_) {
      setState(() {});
      _controller.setLooping(true);
      _controller.play();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF282423
),
      child: _controller.value.isInitialized
          ? LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            ),
          );
        },
      )
          : const CupertinoActivityIndicator(),
    );
  }
}


/// -------------------------
/// AI Recipe Video (Placeholder)


class AIRecipeVideo extends StatefulWidget {
  const AIRecipeVideo({Key? key}) : super(key: key);

  @override
  _AIRecipeVideoState createState() => _AIRecipeVideoState();
}

class _AIRecipeVideoState extends State<AIRecipeVideo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      'assets/videos/airecipegeneration.mp4',
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    )..initialize().then((_) {
      setState(() {});
      _controller.setLooping(true);
      _controller.play();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF282423
),
      child: _controller.value.isInitialized
          ? LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            ),
          );
        },
      )
          : const CupertinoActivityIndicator(),
    );
  }
}


/// -------------------------
/// Reviews List Page
/// -------------------------
class ReviewsListPage extends StatelessWidget {
  const ReviewsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reviews = [
      "This app is a game-changer for how I think about food! Tracking is so easy, and the insights help me make smarter choices. Highly recommend it!",
      "Amazing! Lost 9 pounds in just a month. The AI is like my personal dietitian—super helpful and accurate. A must-have!",
      "This AI is incredible! Snap a picture, and it logs everything instantly. Food tracking has never been this easy. I’m super impressed!",
      "I wasn't sure at first, but this app totally changed my relationship with food. I’m eating better without feeling like I’m missing out. Love the progress charts!",
      "This app is actually fun! The AI tips, graphs, and logging make it feel like a game. It’s like having a nutritionist in my pocket.",
      "Hit my weight goal for the first time in years! The personalized advice and tracking are spot on. So grateful for this app!",
      "Three months in, and this app has changed my life! My eating habits are so much better, and I feel healthier overall. The AI's advice is always spot-on.",
      "More than just a tracker, this app is a lifestyle upgrade. I'm sleeping better, eating smarter, and staying hydrated. Worth every penny!",
      "Logging pizza three times in a week feels like the app is giving me the side-eye, but in a good way! Makes me think twice without being preachy.",
      "This app is unbelievably good! It's like it knows me better than I know myself. The personalized advice is invaluable. Already told all my friends to get it!"
    ];

    return Container(
      color: Color(0xFF282423
),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 54),
        itemCount: reviews.length,
        separatorBuilder: (context, index) => const Divider(color: Color(0xFF282423
)),
        itemBuilder: (context, index) {
          return ReviewCard(text: reviews[index]);
        },
      ),
    );
  }
}

/// -------------------------
/// Review Card Widget
/// -------------------------
class ReviewCard extends StatelessWidget {
  final String text;

  const ReviewCard({Key? key, this.text = "This app’s advice is so on point, it’s almost spooky. It knows what I need before I even realize it myself!"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Replace with your star rating image asset.
            Padding(
              padding: EdgeInsets.only(bottom: 0),
              child: Image.asset(
                "assets/images/five_star_rating.png",
                height: 24,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              text,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

/// -------------------------
/// Subscription Option Card (Example)
/// -------------------------
class SubscriptionOption extends StatelessWidget {
  final String planType;
  final String price;
  final String discount;
  final bool isSelected;
  final VoidCallback onClick;

  const SubscriptionOption({
    Key? key,
    required this.planType,
    required this.price,
    required this.discount,
    required this.isSelected,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // For the iOS feel, you can use Cupertino styling together with Material's Card.
    return Card(
      color: CupertinoColors.systemBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: onClick,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(
                isSelected ? CupertinoIcons.check_mark_circled_solid : CupertinoIcons.circle,
                color: isSelected ? CupertinoColors.activeGreen : Colors.grey,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      planType,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    if (discount.isNotEmpty)
                      Text(
                        discount,
                        style: const TextStyle(fontSize: 14, color: Colors.green),
                      ),
                  ],
                ),
              ),
              Text(
                price,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
