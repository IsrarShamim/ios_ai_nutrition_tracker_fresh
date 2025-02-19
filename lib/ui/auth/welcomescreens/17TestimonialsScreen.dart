import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

// Replace with your actual import if needed.
import '../../common/welcome_screen_indicator.dart';
import '../welcome_provider.dart';

class TestimonialsScreen extends StatelessWidget {
  const TestimonialsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Builder(
        // Builder to access the provider
        builder: (context) {
          return CupertinoPageScaffold(
            backgroundColor: CupertinoColors.systemBackground,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    WelcomeScreenNumberIndicator(
                      currentScreen: 14,
                      onBackPressed: () => context.pop(),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Our Users Love Us",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/images/five_people_portraits.png',
                              width: 98,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              "+1000 users",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: CupertinoColors.secondaryLabel,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Image.asset(
                        'assets/images/five_star_rating.png',
                        height: 24,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: _TestimonialsSection(), // Reviews list
                    ),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: screenWidth,
                        height: 54,
                        child: CupertinoButton.filled(
                          onPressed: () =>
                              context.pushNamed('create_plan_screen'),
                          borderRadius: BorderRadius.circular(27),
                          child: const Text(
                            "Next",
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
            ),
          );
        },

    );
  }
}

class Review {
  final String name;
  final String comment;

  Review(this.name, this.comment);
}

class _TestimonialsSection extends StatelessWidget {
  final List<Review> reviews = [
    Review(
      "Olivia Martinez",
      "This AI tech is absolutely amazing. It makes tracking meals so effortless and gives super practical tips to improve my diet. It's like having a personal dietitian on call 24/7!",
    ),
    Review(
      "Michael Chen",
      "The results have been incredible. I lost 40 pounds in just 3 months by following the app's guidance. I couldn't be happier with the progress!",
    ),
    Review(
      "Priya Sharma",
      "For the first time, I've been able to stick to my fitness goals. Lost 10 kilos, my energy levels are much better, and I finally feel confident and healthy.",
    ),
    Review(
      "Sophia Evans",
      "I’ve struggled with low energy for years, but this app helped me figure out what I was doing wrong. Now I eat better, have more energy, and just ran my first marathon—it’s unbelievable!",
    ),
  ];

  _TestimonialsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Using ListView.separated inside Expanded to ensure proper scrolling
    return ListView.separated(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: reviews.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final review = reviews[index];
        return _ReviewCard(review: review);
      },
    );
  }
}

class _ReviewCard extends StatelessWidget {
  final Review review;

  const _ReviewCard({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {},
      padding: EdgeInsets.zero,
      // Remove backgroundColor from button and use Container to simulate a card.
      child: Container(
        decoration: BoxDecoration(
          color: CupertinoColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: CupertinoColors.systemGrey.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            )
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: Avatar, name, and stars.
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor:
                  CupertinoColors.systemGrey.withOpacity(0.2),
                  radius: 20,
                  child: Text(
                    review.name[0],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        review.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Image.asset(
                        'assets/images/five_star_rating.png',
                        height: 16,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              review.comment,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black,
                height: 1.4,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
