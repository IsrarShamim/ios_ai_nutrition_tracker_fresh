import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final logger = Logger(
  printer: PrettyPrinter(methodCount: 2, // Number of stack trace lines to show
    errorMethodCount: 5, // Stack trace for errors
    lineLength: 800000, // Line width for formatting
    colors: true, // Enable colors
    printEmojis: false, // Emojis for log levels
    printTime: false, // Show timestamps
  ),
);

class GoogleSignInScreen extends StatefulWidget {
  const GoogleSignInScreen({Key? key}) : super(key: key);

  @override
  State<GoogleSignInScreen> createState() => _GoogleSignInScreenState();
}

class _GoogleSignInScreenState extends State<GoogleSignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _showSignIn = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _checkIfUserExists() async {
    setState(() {
      _isLoading = true; // Optionally show loading while checking
    });

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        _showErrorDialog("No user signed in after Google Sign-in.");
        return;
      }

      final userDoc = await FirebaseFirestore.instance
          .collection('Users')
          .doc(user.uid)
          .get();

      if (userDoc.exists) {
        // User document exists, navigate to target setting screen or home
        logger.i("User document exists in Firestore");
        _navigateToHomeScreen(); // Or navigate to target setting screen if needed
        _showToast("Sign in Successful"); // Optional toast message

        // Example of fetching data from Firestore (adapt to your data model)
        // String displayName = userDoc.get('displayName') as String? ?? '';
        // int age = (userDoc.get('age') as num?)?.toInt() ?? 0;
        // logger.d("User Display Name: $displayName, Age: $age");

      } else {
        // User document does not exist, navigate to second screen (likely user info setup)
        logger.i("User document does not exist in Firestore, navigating to user info setup");
        _navigateToNameScreenScreen();
        _showToast("Logging In"); // Optional toast message
      }
    } catch (e) {
      _showErrorDialog("Failed to check user existence: $e");
      logger.e("Error checking user existence in Firestore: $e");
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false; // Stop loading
        });
      }
    }
  }
  void _navigateToHomeScreen() {
    if (mounted) context.pushNamed('home'); // Replace 'home' with your actual route name
  }

  void _navigateToNameScreenScreen() {
    if (mounted) context.pushNamed('name_screen'); // Replace 'NameScreen' with your actual route
  }

  void _showToast(String message) {
    // Implement your toast display logic here, if needed.
    // For example, using package:fluttertoast
    print("Toast: $message"); // Placeholder - replace with actual toast implementation
  }

  // Future<void> _signInWithGoogle() async {
  //   context.pushNamed('name_screen');
  // }
  Future<void> _signInWithGoogle() async {

    setState(() {
      _isLoading = true;
    });

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn(
        serverClientId: '646074818132-pd5p41a1co75vpmgiotk7nmg46d0rrce.apps.googleusercontent.com', ).signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      if (googleAuth == null || googleAuth.accessToken == null || googleAuth.idToken == null) {
        _showErrorDialog("Google Sign-in failed: Could not retrieve authentication details.");
        return;
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);

      await _checkIfUserExists();

      // if (mounted) context.goNamed('home');
    } catch (e) {

      _showErrorDialog("Error signing in with Google: $e");
      print("Google Sign-in Error: $e"); // Log the full error for debugging
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _signInWithEmailAndPassword() async {
    setState(() {
      _isLoading = true;
    });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      await _checkIfUserExists();
      // if (mounted) context.goNamed('home');
    } on FirebaseAuthException catch (e) {
      String errorMessage = "Sign-in failed. Please try again.";
      if (e.code == 'user-not-found') {
        errorMessage = "No user found for that email.";
      } else if (e.code == 'wrong-password') {
        errorMessage = "Incorrect password.";
      } else {
        errorMessage = "Error during sign in. Please try again.";
      }

      _showErrorDialog(errorMessage);
      print("Email Sign-in Error: ${e.code} - ${e.message}"); // Log full error
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _signUpWithEmailAndPassword() async {
    setState(() {
      _isLoading = true;
    });
    if (_passwordController.text.trim() != _confirmPasswordController.text.trim()) {
      _showErrorDialog("Passwords do not match.");
      setState(() {
        _isLoading = false;
      });
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      await _checkIfUserExists();
      // if (mounted) context.goNamed('home');
    } on FirebaseAuthException catch (e) {
      String errorMessage = "Account creation failed. Please try again.";
      if (e.code == 'weak-password') {
        errorMessage = 'Password is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'An account already exists for this email.';
      } else {
        errorMessage = "Error creating account. Please try again.";
      }
      _showErrorDialog(errorMessage);
      print("Email Sign-up Error: ${e.code} - ${e.message}"); // Log full error
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showErrorDialog(String message) {
    print("Showing error dialog with message: $message"); // Confirmation print
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text("Error", style: TextStyle(fontWeight: FontWeight.bold)),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(_showSignIn ? "Sign In" : "Sign Up",
            style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
      child: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CupertinoTextField(
                    controller: _emailController,
                    placeholder: "Email",
                    keyboardType: TextInputType.emailAddress,
                    padding: const EdgeInsets.symmetric(
                        vertical: 14.0, horizontal: 12.0),
                    decoration: BoxDecoration(
                      color: CupertinoColors.lightBackgroundGray,
                      borderRadius: BorderRadius.circular(10.0), // More rounded text fields
                    ),
                  ),
                  const SizedBox(height: 20), // Increased spacing after email field
                  CupertinoTextField(
                    controller: _passwordController,
                    placeholder: "Password",
                    obscureText: true,
                    padding: const EdgeInsets.symmetric(
                        vertical: 14.0, horizontal: 12.0),
                    decoration: BoxDecoration(
                      color: CupertinoColors.lightBackgroundGray,
                      borderRadius: BorderRadius.circular(10.0), // More rounded text fields
                    ),
                  ),
                  if (!_showSignIn) ...[
                    const SizedBox(height: 20), // Increased spacing before confirm password
                    CupertinoTextField(
                      controller: _confirmPasswordController,
                      placeholder: "Confirm Password",
                      obscureText: true,
                      padding: const EdgeInsets.symmetric(
                          vertical: 14.0, horizontal: 12.0),
                      decoration: BoxDecoration(
                        color: CupertinoColors.lightBackgroundGray,
                        borderRadius: BorderRadius.circular(10.0), // More rounded text fields
                      ),
                    ),
                  ],

                  const SizedBox(height: 30), // Increased spacing before main button

                  CupertinoButton.filled(
                    onPressed: _isLoading
                        ? null
                        : _showSignIn
                        ? _signInWithEmailAndPassword
                        : _signUpWithEmailAndPassword,
                    borderRadius: BorderRadius.circular(14.0), // Even more rounded main button
                    padding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 24), // Increased button padding
                    child: _isLoading
                        ? const CupertinoActivityIndicator()
                        : Text(
                      _showSignIn ? "Sign In" : "Sign Up",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),

                  const SizedBox(height: 25), // Increased spacing before toggle text

                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      setState(() {
                        _showSignIn = !_showSignIn;
                      });
                    },
                    child: Text(
                      _showSignIn
                          ? "Don't have an account? Sign Up"
                          : "Already have an account? Sign In",
                      style: TextStyle(
                          color: CupertinoColors.link.resolveFrom(context), // Use link color
                          fontSize: 16 // Slightly smaller toggle text
                      ),
                    ),
                  ),
                  const SizedBox(height: 30), // Increased spacing before OR separator

                  // Enhanced "OR" Separator
                  Row(
                    children: <Widget>[
                      const Expanded(
                        child: Divider(
                          color: CupertinoColors.separator,
                          thickness: 0.8, // Thinner divider
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          "OR",
                          style: TextStyle(
                            color: CupertinoColors.secondaryLabel, // Muted "OR" text
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          color: CupertinoColors.separator,
                          thickness: 0.8, // Thinner divider
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30), // Increased spacing after OR separator

                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: _isLoading ? null : _signInWithGoogle,
                    child: Container(
                      width: double.infinity, // This makes the button fill the max width available
                      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 56),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            CupertinoColors.white.withOpacity(0.98),
                            CupertinoColors.white,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          color: CupertinoColors.inactiveGray.withOpacity(0.3),
                          width: 0.4,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/google_icon.png',
                            height: 26,
                            width: 26,
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            "Continue with Google",
                            style: TextStyle(
                              color: CupertinoColors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}