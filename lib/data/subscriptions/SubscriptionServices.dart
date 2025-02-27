import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:go_router/go_router.dart';
import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubscriptionService {
  // Add this near the other field declarations in SubscriptionService
  BuildContext? _purchaseContext;

  // Singleton pattern
  static final SubscriptionService _instance = SubscriptionService._internal();
  factory SubscriptionService() => _instance;
  SubscriptionService._internal();

  // Define your product IDs
  final Set<String> _productIds = {
    'aiNutritionTrackerPremiumMonthly',
    'aiNutritionTrackerPremiumQuarterly',
    'aiNutritionTrackerPremiumYearly',
  };

  // Stream to listen for purchase updates
  late StreamSubscription<List<PurchaseDetails>> _subscription;

  // Products retrieved from the store
  List<ProductDetails> _products = [];

  // Publicly accessible products
  List<ProductDetails> get products => _products;

  // Stream controller to broadcast subscription status changes
  final StreamController<bool> _subscriptionStatusController =
      StreamController<bool>.broadcast();
  Stream<bool> get subscriptionStatus => _subscriptionStatusController.stream;

  // Current subscription status
  bool _isSubscribed = false;
  bool get isSubscribed => _isSubscribed;

  // Initialize the service
  Future<void> initialize() async {
    final bool available = await InAppPurchase.instance.isAvailable();
    if (!available) {
      _products = [];
      _subscriptionStatusController.add(false);
      return;
    }

    // For App Store, set delegate for payment queue
    if (Platform.isIOS) {
      final InAppPurchaseStoreKitPlatformAddition iosPlatformAddition =
          InAppPurchase.instance
              .getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      await iosPlatformAddition.setDelegate(PaymentQueueDelegate());
    }

    // Listen for purchase updates
    _subscription = InAppPurchase.instance.purchaseStream.listen(
      _listenToPurchaseUpdated,
      onDone: () {
        _subscription.cancel();
      },
      onError: (error) {
        print('Subscription error: $error');
      },
    );

    // Load products
    await loadProducts();

    // Check if user already has an active subscription
    await checkSubscriptionStatus();
  }

  // Load available products
  Future<void> loadProducts() async {
    final ProductDetailsResponse response =
        await InAppPurchase.instance.queryProductDetails(_productIds);

    if (response.notFoundIDs.isNotEmpty) {
      print('Products not found: ${response.notFoundIDs}');
    }

    _products = response.productDetails;
  }

  // Launch the purchase flow
  Future<bool> buySubscription(
      ProductDetails product, BuildContext context) async {
    _purchaseContext = context;
    final PurchaseParam purchaseParam = PurchaseParam(
      productDetails: product,
      applicationUserName: null,
    );

    try {
      final bool success = await InAppPurchase.instance
          .buyNonConsumable(purchaseParam: purchaseParam);
      return success;
    } catch (e) {
      print('Error making purchase: $e');
      return false;
    }
  }

  // Listen to purchase updates
  void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
    for (final PurchaseDetails purchaseDetails in purchaseDetailsList) {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        // Show loading UI if needed
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          print('Purchase error: ${purchaseDetails.error?.message}');
        } else if (purchaseDetails.status == PurchaseStatus.purchased ||
            purchaseDetails.status == PurchaseStatus.restored) {
          _verifyPurchase(purchaseDetails, _purchaseContext!);
          InAppPurchase.instance.completePurchase(purchaseDetails);
        }

        if (purchaseDetails.pendingCompletePurchase) {
          InAppPurchase.instance.completePurchase(purchaseDetails);
        }
      }
    }
  }

  // Verify the purchase (in a real app, you should verify with your server)
  Future<void> _verifyPurchase(
      PurchaseDetails purchaseDetails, BuildContext context) async {
    if (_productIds.contains(purchaseDetails.productID)) {
      await setSubscriptionStatus(true);
      // Navigate to home screen
      context.goNamed('home');
    }
  }

  // Check current subscription status
  Future<bool> checkSubscriptionStatus() async {
    await loadSubscriptionStatus();

    // If subscribed, validate with the App Store
    if (_isSubscribed) {
      await _validateReceipt();
    }

    _subscriptionStatusController.add(_isSubscribed);
    return _isSubscribed;
  }

  Future<void> _validateReceipt() async {
    if (Platform.isIOS) {
      try {
        // await setSubscriptionStatus(hasValidSubscription);
      } catch (e) {
        print('Error validating purchases: $e');
        // await setSubscriptionStatus(false);
      }
    }
  }

  // Restore purchases
  Future<void> restorePurchases() async {
    await InAppPurchase.instance.restorePurchases();
  }

  // Save subscription status using SharedPreferences
  Future<void> setSubscriptionStatus(bool isSubscribed) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isSubscribed', isSubscribed);
    _isSubscribed = isSubscribed;
    _subscriptionStatusController.add(_isSubscribed);
  }

  // Load subscription status from SharedPreferences
  Future<void> loadSubscriptionStatus() async {
    final prefs = await SharedPreferences.getInstance();
    _isSubscribed = prefs.getBool('isSubscribed') ?? false;
  }

  String? getPriceForId(String productId) {
    final matchingProducts =
        _products.where((element) => element.id == productId);
    if (matchingProducts.isEmpty) {
      return null; // or handle the error as needed
    }
    final product = matchingProducts.first;
    return product.price;
  }

  // Clean up
  void dispose() {
    _subscription.cancel();
    _subscriptionStatusController.close();
  }
}

// Required payment queue delegate for iOS
class PaymentQueueDelegate implements SKPaymentQueueDelegateWrapper {
  @override
  bool shouldContinueTransaction(
      SKPaymentTransactionWrapper transaction, SKStorefrontWrapper storefront) {
    return true;
  }

  @override
  bool shouldShowPriceConsent() {
    return false;
  }
}
