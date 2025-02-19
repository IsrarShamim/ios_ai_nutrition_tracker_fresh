import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart'; // Import Provider

import '../../common/welcome_screen_indicator.dart';
import '../welcome_provider.dart'; // Import your WelcomeScreenProvider

class NameScreen extends StatefulWidget {
  const NameScreen({Key? key}) : super(key: key);

  @override
  _NameScreenState createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  bool showError = false;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Get the Name from the Provider and set it to the text field initially
    final provider = Provider.of<WelcomeScreenProvider>(context, listen: false);
    _controller.text = provider.name; // Set initial text from provider's name
  }

  void _handleNext() {
    // Get the provider to access and set the name
    final provider = Provider.of<WelcomeScreenProvider>(context, listen: false);

    if (provider.name.trim().isNotEmpty) { // Use provider's name for validation
      setState(() {
        showError = false;
      });
      // Navigate to the third screen, passing the name is no longer needed as it's in the provider.
      context.pushNamed('gender_screen');
    } else {
      setState(() {
        showError = true;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get the provider instance to access the name (for display in UI)
    final provider = Provider.of<WelcomeScreenProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final contentWidth = screenWidth > 500 ? screenWidth * 0.5 : screenWidth;

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: CupertinoPageScaffold(
        backgroundColor: CupertinoColors.systemBackground,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 16),
                    WelcomeScreenNumberIndicator(
                      currentScreen: 0,
                      disableBack: true,
                      onBackPressed: () => context.pop(),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "What name would you like to go by?",
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .navLargeTitleTextStyle
                          .copyWith(fontWeight: FontWeight.w600),
                      textAlign: screenWidth > 500 ? TextAlign.center : TextAlign.start,
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: SizedBox(
                        width: contentWidth,
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: CupertinoColors.systemGrey6,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: CupertinoTextField(
                              controller: _controller,
                              placeholder: "Name",
                              // Update the provider's name when text field changes
                              onChanged: (value) {
                                // Get the provider and set the name
                                final provider = Provider.of<WelcomeScreenProvider>(context, listen: false);
                                provider.setName(value); // Update the name in the provider
                              },
                              textInputAction: TextInputAction.next,
                              onSubmitted: (_) => _handleNext(),
                              decoration: BoxDecoration(
                                color: CupertinoColors.systemGrey6,
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (showError)
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Center(
                          child: Text(
                            "Name can't be empty",
                            style: TextStyle(
                              color: CupertinoColors.systemRed,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                Column(
                  children: [
                    if (provider.name.isNotEmpty) // Use provider's name for conditional visibility
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          "Did You Know? Globally, 1 in 3 adults (over 1.9 billion people) is overweight. Let’s change that!",
                          style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                            fontWeight: FontWeight.w600,
                            color: CupertinoColors.black.withOpacity(0.8),
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: contentWidth,
                      height: 54,
                      child: CupertinoButton.filled(
                        onPressed: _handleNext,
                        padding: EdgeInsets.zero,
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}