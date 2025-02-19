import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

// Import the subscription service
import '../../../data/subscriptions/SubscriptionServices.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  final SubscriptionService _subscriptionService = SubscriptionService();
  int _selectedPlanIndex = 0;
  bool _isLoading = true;
  bool _isPurchasing = false;

  // Product IDs
  final List<String> _productIds = [
    'aiNutritionTrackerPremiumMonthly',
    'aiNutritionTrackerPremiumQuarterly',
    'aiNutritionTrackerPremiumYearly'
  ];

  // Plan details - prices will be updated from App Store
  final List<String> _plans = ['Monthly', 'Quarterly', 'Yearly'];
  late final List<String> _prices = ['\$5.99', '\$17.99', '\$39.99']; // Default values
  final List<String> _discounts = ['', '', '50% OFF'];

  @override
  void initState() {
    super.initState();
    _initSubscriptions();
  }

  Future<void> _initSubscriptions() async {
    await _subscriptionService.initialize();

    // Update prices from the store if available
    setState(() {
      for (int i = 0; i < _productIds.length; i++) {
        final price = _subscriptionService.getPriceForId(_productIds[i]);
        if (price != null) {
          _prices[i] = price;
        }
      }
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGrey6,
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Premium Subscription'),
      ),
      child: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 24),
                  _isLoading
                      ? const Center(child: CupertinoActivityIndicator())
                      : _buildPlanSelector(),
                  const SizedBox(height: 32),
                  // Rest of your feature sections remain unchanged
                  const FeatureSection(
                    title: 'Core AI Features',
                    features: [
                      FeatureItem(
                        title: 'AI Nutritionist',
                        description: 'Your personal AI nutritionist to guide meal choices.',
                      ),
                      FeatureItem(
                        title: 'Photo Food Tracking',
                        description: 'Snap a meal photo to log nutritional details.',
                      ),
                      FeatureItem(
                          title: 'AI Nutrition Analysis',
                          description: 'Receive smart analysis of your meal\'s nutrition.',
                      ),
                      FeatureItem(
                        title: 'AI Recipes',
                        description: 'Generate recipe ideas based on available ingredients.',
                      ),
                    ],
                    gradientColors: [Color(0xFFCC5B66), Color(0xFFD32F2F)],
                  ),
                  const SizedBox(height: 24),
                  const FeatureSection(
                    title: 'Premium Tools',
                    features: [
                      FeatureItem(
                        title: 'Barcode Scanner',
                        description: 'Instant food recognition with barcode scanning.',
                      ),
                      FeatureItem(
                        title: '3M+ Food Database',
                        description: 'Access a comprehensive global food database.',
                      ),
                      FeatureItem(
                        title: 'Micro Nutrient Tracking',
                        description: 'Effortlessly monitor essential vitamins and minerals.',
                      ),
                    ],
                    gradientColors: [Color(0xFF5B8CC6), Color(0xFF2F5FD3)],
                  ),
                  const SizedBox(height: 24),
                  const FeatureSection(
                    title: 'Essentials',
                    features: [
                      FeatureItem(
                        title: 'Personalized Diet Plans',
                        description: 'Custom diet plans tailored to your unique goals.',
                      ),
                      FeatureItem(
                        title: 'Smarter Every Day',
                        description: 'Actionable nutrition insights to help you stay on track.',
                      ),
                      FeatureItem(
                        title: 'Visualize Your Progress',
                        description: 'Interactive charts to monitor your nutritional journey.',
                      ),
                    ],
                    gradientColors: [Color(0xFFFFA726), Color(0xFFF57C00)],
                  ),
                  const SizedBox(height: 120),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _buildSubscribeButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Text(
          'Unlock Premium Features',
          textAlign: TextAlign.center,
          style: CupertinoTheme.of(context)
              .textTheme
              .navLargeTitleTextStyle
              .copyWith(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Reach your health goals in 3 months',
          textAlign: TextAlign.center,
          style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
            color: CupertinoColors.secondaryLabel,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildPlanSelector() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Row(
        children: List.generate(_plans.length, (index) {
          return Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () => setState(() => _selectedPlanIndex = index),
              child: PlanCard(
                title: _plans[index],
                price: _prices[index],
                discount: _discounts[index],
                isSelected: _selectedPlanIndex == index,
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildSubscribeButton() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6,
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.systemGrey.withOpacity(0.1),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: _isPurchasing
          ? const Center(child: CupertinoActivityIndicator())
          : CupertinoButton.filled(
        borderRadius: BorderRadius.circular(30),
        padding: const EdgeInsets.symmetric(vertical: 16),
        onPressed: _startPurchase,
        child: const Text(
          'Subscribe Now',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Future<void> _startPurchase() async {
    final selectedProductId = _productIds[_selectedPlanIndex];

    // Find the product detail
    final product = _subscriptionService.products.firstWhere(
          (p) => p.id == selectedProductId,
      orElse: () => ProductDetails(
        id: '',
        title: '',
        description: '',
        price: '',
        rawPrice: 0,
        currencyCode: '',
        currencySymbol: '',
      ),
    );

    if (product.id.isEmpty) {
      _showErrorAlert('Product not available');
      return;
    }

    setState(() {
      _isPurchasing = true;
    });

    try {
      final success = await _subscriptionService.buySubscription(product);
      if (!success) {
        _showErrorAlert('Purchase could not be initiated');
      }
    } catch (e) {
      _showErrorAlert('Error: ${e.toString()}');
    } finally {
      setState(() {
        _isPurchasing = false;
      });
    }
  }

  void _showErrorAlert(String message) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Subscription Error'),
          content: Text(message),
          actions: <Widget>[
            CupertinoDialogAction(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}


class PlanCard extends StatelessWidget {
  final String title;
  final String price;
  final String discount;
  final bool isSelected;

  const PlanCard({
    super.key,
    required this.title,
    required this.price,
    required this.discount,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final transform = Matrix4.identity();
    if (isSelected) {
      transform.translate(0.0, -2.0);
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          transform: transform,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: isSelected
                      ? CupertinoColors.activeBlue
                      : CupertinoColors.systemBackground,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isSelected
                        ? CupertinoColors.activeBlue
                        : CupertinoColors.systemGrey4,
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: isSelected
                          ? CupertinoColors.activeBlue.withOpacity(0.25)
                          : CupertinoColors.systemGrey.withOpacity(0.1),
                      blurRadius: isSelected ? 16 : 8,
                      offset: Offset(0, isSelected ? 6 : 3),
                      spreadRadius: isSelected ? 1 : 0,
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(
                  vertical: isSelected ? 22 : 20,
                  horizontal: 12,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: isSelected
                            ? CupertinoColors.white
                            : CupertinoColors.label,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                        fontSize: 15,
                        letterSpacing: 0.3,
                      ),
                    ),
                    const SizedBox(height: 12),
                    AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 200),
                      style: TextStyle(
                        color: isSelected
                            ? CupertinoColors.white
                            : CupertinoColors.label,
                        fontSize: isSelected ? 22 : 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                      child: Text(price),
                    ),
                  ],
                ),
              ),
              if (discount.isNotEmpty)
                Positioned(
                  top: -12,
                  left: 0,
                  right: 0,
                  child: Align(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemRed,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: CupertinoColors.systemRed.withOpacity(0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            CupertinoIcons.tag_fill,
                            color: CupertinoColors.white,
                            size: 12,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            discount,
                            style: const TextStyle(
                              color: CupertinoColors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              // Subtle bottom indicator
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                bottom: 0,
                left: 0,
                right: 0,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: isSelected ? 1.0 : 0.0,
                  child: Container(
                    height: 3,
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                      color: CupertinoColors.white,
                      borderRadius: BorderRadius.circular(1.5),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}


class FeatureSection extends StatelessWidget {
  final String title;
  final List<FeatureItem> features;
  final List<Color> gradientColors;

  const FeatureSection({
    super.key,
    required this.title,
    required this.features,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: CupertinoColors.systemBackground,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.systemGrey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: gradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Text(
              title.toUpperCase(),
              style: const TextStyle(
                color: CupertinoColors.white,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              children: features
                  .map((feature) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: feature,
              ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  final String title;
  final String description;

  const FeatureItem({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(CupertinoIcons.checkmark_seal_fill,
            size: 24, color: CupertinoColors.activeGreen),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                  color: CupertinoColors.secondaryLabel,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
