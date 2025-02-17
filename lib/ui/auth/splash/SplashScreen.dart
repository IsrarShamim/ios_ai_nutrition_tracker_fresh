import 'package:firebase_auth/firebase_auth.dart'; // For authentication check
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  final VoidCallback onNavigateToWelcome; // Callback to navigate to welcome screen
  final VoidCallback onNavigateToHome;    // Callback to navigate to home screen

  const SplashScreen({
    Key? key,
    required this.onNavigateToWelcome,
    required this.onNavigateToHome,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _checkAuthAndNavigate();
  }

  Future<void> _checkAuthAndNavigate() async {

    // Simulate a delay (replace with your actual splash screen duration or loading logic)
    await Future.delayed(const Duration(seconds: 2));


    // Check authentication status
    final isAuthenticated = await isUserAuthenticated();


    if (isAuthenticated) {
      widget.onNavigateToHome();  // Navigate to home
    } else {
      widget.onNavigateToWelcome(); // Navigate to welcome
    }
  }

  Future<bool> isUserAuthenticated() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      return user != null;
    } catch (e) {
      print("Error checking authentication: $e");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold( // Or CupertinoPageScaffold
      body: Center(
        child: CircularProgressIndicator(), // Or your splash screen logo/animation
      ),
    );
  }
}