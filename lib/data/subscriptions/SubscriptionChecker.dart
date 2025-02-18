import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'SubscriptionServices.dart';

class SubscriptionChecker {
  static final SubscriptionService _subscriptionService = SubscriptionService();

  // Initialize the subscription service
  static Future<void> initialize() async {
    await _subscriptionService.initialize();
  }

  // Check if user is subscribed
  static Future<bool> isSubscribed() async {
    return await _subscriptionService.checkSubscriptionStatus();
  }

  // Check subscription and redirect if not subscribed
  static Future<void> checkAndRedirect(BuildContext context, {required bool isUserAuthenticated}) async {
    if (!isUserAuthenticated) {
      // Handle unauthenticated user (e.g., redirect to login)
      return;
    }

    // Load subscription status from SharedPreferences
    Future<bool> loadSubscriptionStatus() async {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool('isSubscribed') ?? false;
    }


    final bool subscribed = await loadSubscriptionStatus();
    if (!subscribed) {
      if (context.mounted) {
        // Redirect to subscription screen
        context.pushNamed('subscribe_screen');
      }
    }
  }

  // Subscribe to status changes
  static Stream<bool> get subscriptionStatusStream => _subscriptionService.subscriptionStatus;

  // Restore purchases
  static Future<void> restorePurchases() async {
    await _subscriptionService.restorePurchases();
  }
}