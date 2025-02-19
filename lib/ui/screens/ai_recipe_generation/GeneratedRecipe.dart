import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';
import 'package:provider/provider.dart'; // Import Provider
import 'package:go_router/go_router.dart'; // Import Provider

import '../../../data/database/entities/user_information.dart';
import '../../../data/database/repositories/user_information_repo.dart';
import '../../../data/gemini/GeminiModels.dart';
import '../../../data/gemini/prompts/RecipeGeneration.dart';
import 'RecipeDetails.dart';

class RecipeGenerationScreen2 extends StatefulWidget {
  const RecipeGenerationScreen2({super.key});

  @override
  State<RecipeGenerationScreen2> createState() =>
      _RecipeGenerationScreen2State();
}

class _RecipeGenerationScreen2State extends State<RecipeGenerationScreen2>
    with SingleTickerProviderStateMixin {
  int currentStep = 1;
  final ImagePicker _picker = ImagePicker();
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  Set<String> selectedTypes = {};
  XFile? selectedImage;
  final TextEditingController _promptController = TextEditingController();
  bool isTextFieldFocused = false;
  final TextEditingController _customTypeController = TextEditingController();
  bool isAddingCustomType = false;
  bool _isLoadingRecipeNames = false;
  AIRecipeSearchItems? _recipeSearchResults;

// First, add this to your state class
  bool useOnlyMyIngredients = false;

  final List<String> recipeTypes = [
    "Breakfast",
    "Lunch",
    "Dinner",
    "Vegetarian",
    "Vegan",
    "Gluten-Free",
    "Quick & Easy",
    "Healthy",
    "Dessert",
    "Dairy-Free",
    "Nut-Free",
    "Soy-Free",
    "Italian",
    "Mexican",
    "Indian",
    "Chinese",
    "Thai",
    "Japanese",
    "French",
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.3, 0.8, curve: Curves.easeOut),
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _promptController.dispose();
    _customTypeController.dispose();
    super.dispose();
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: source,
        imageQuality: 80,
        maxWidth: 1200,
      );
      if (image != null) {
        setState(() {
          selectedImage = image;
        });
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  void _removeImage() {
    setState(() {
      selectedImage = null;
    });
  }

  void _addCustomRecipeType() {
    String newType = _customTypeController.text.trim();
    if (newType.isNotEmpty) {
      setState(() {
        recipeTypes.add(newType);
        selectedTypes.add(newType);
        _customTypeController.clear();
        isAddingCustomType = false;
      });
    } else {
      setState(() {
        isAddingCustomType = false;
      });
    }
  }

  Future<void> _generateRecipeNames() async {
    setState(() {
      _isLoadingRecipeNames = true;
      _recipeSearchResults = null;
      currentStep = 3; // Move to page 3 immediately when starting to load
    });

    // Content content;
    String? imagePath = selectedImage?.path;
    String textPrompt = _promptController.text;

    // if (imagePath != null) {
    //   final File imageFile = File(imagePath);
    //   final imageInBytes = await imageFile.readAsBytes();
    //   content = Content.multi([
    //     TextPart(textPrompt),
    //     DataPart('image/jpeg', imageInBytes),
    //   ]);
    // } else {
    //   content = Content.text(textPrompt);
    // }

    final userInfoRepository =
        Provider.of<UserInfoRepository>(context, listen: false);
    final UserInformationEntity? userInfo =
        await userInfoRepository.getUserInformationEntity();

    String prompt;
    if (userInfo != null) {
      prompt = generateChefPrompt(userInfo,
          additionalText: textPrompt,
          recipeTypes: selectedTypes.toList(),
          useOnlyMyIngredients: useOnlyMyIngredients);
    } else {
      prompt = generateChefPromptWhenUserInfoIsNotAvailable(
          additionalText: textPrompt,
          recipeTypes: selectedTypes.toList(),
          useOnlyMyIngredients: useOnlyMyIngredients);
    }

    Content contentToSend;
    if (imagePath != null) {
      final File imageFile = File(imagePath);
      final imageInBytes = await imageFile.readAsBytes();
      contentToSend = Content.multi([
        TextPart(prompt),
        DataPart('image/jpeg', imageInBytes),
      ]);

      // Content.multi([TextPart(prompt), if (content.dataPart != null) content.dataPart!]) // Ensure prompt is sent as text part
    } else {
      contentToSend = Content.text(prompt);
    }

    try {
      GenerateContentResponse response =
          await geminiForRecipeGeneration.sendMessage(contentToSend);

      if (response.text != null) {
        Map<String, dynamic> jsonResponse =
            jsonDecode(response.text!) as Map<String, dynamic>;
        AIRecipeSearchItems searchItems =
            AIRecipeSearchItems.fromJson(jsonResponse);

        setState(() {
          _recipeSearchResults = searchItems;
          _isLoadingRecipeNames = false;
          currentStep = 3; // Advance to the third step
        });
      } else {
        setState(() {
          _isLoadingRecipeNames = false;
        });
        print('Gemini response text was null');
      }
    } catch (e) {
      setState(() {
        _isLoadingRecipeNames = false;
      });
      print('Error generating recipe names: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.orange.shade50,
            Colors.blueGrey.shade50,
            Colors.blueGrey.shade50,
            Colors.white,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              _buildNavigationBar(),
              Expanded(
                child: currentStep == 1
                    ? _buildWelcomeScreen()
                    : currentStep == 2
                        ? _buildMainScreen()
                        : _isLoadingRecipeNames
                            ? _buildLoadingIndicator()
                            : _buildRecipeNameListScreen(_recipeSearchResults!),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                // Removed TweenAnimationBuilder and Transform.scale
                children: [
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          width: 45,
                          height: 45,
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.blue),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Column(
                          // Removed TweenAnimationBuilder
                          children: [
                            const Text(
                              'Generating Recipes',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Crafting personalized dishes just for you',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecipeNameListScreen(AIRecipeSearchItems searchItems) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      // Removed TweenAnimationBuilder and Transform.scale
                      children: [
                        const Icon(
                          CupertinoIcons.sparkles,
                          size: 40,
                          color: Colors.blue,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Your Personalized Recipes',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade800,
                            letterSpacing: -0.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Tap on a recipe to view details',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final recipe = searchItems.recipes[index];
                    return Padding(
                      // Removed TweenAnimationBuilder and Transform.translate and Opacity
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: _buildRecipeCard(recipe),
                    );
                  },
                  childCount: searchItems.recipes.length,
                ),
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(bottom: 24)),
          ],
        ),
      ),
    );
  }

  Widget _buildRecipeCard(AIRecipeSearchItem recipe) {
    // Access RecipeDetailsProvider without listening (since you only need to call a method)
    // final recipeProvider = Provider.of<RecipeDetailsProvider>(context, listen: false);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            final recipeProvider =
                Provider.of<RecipeDetailsProvider>(context, listen: false);
            recipeProvider.recipeName = recipe.name;
            recipeProvider.generateRecipeDetails(recipe);
            context.pushNamed(
                'recipe_details_screen'); // Navigate to the details screen
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Left icon
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Icon(
                      CupertinoIcons.wand_stars,
                      color: Colors.blue,
                      size: 24,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        recipe.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        recipe.nutritionalInfo,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
                // Right arrow
                Container(
                  margin: const EdgeInsets.only(left: 12),
                  child: Icon(
                    CupertinoIcons.chevron_right,
                    color: Colors.grey.shade400,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationBar() {
    return CupertinoNavigationBar(
      backgroundColor: Colors.transparent,
      border: null,
      leading: CupertinoNavigationBarBackButton(
        onPressed: () {
          if (currentStep == 1) {
            context.pop();
          } else {
            setState(() {
              if (_isLoadingRecipeNames || _recipeSearchResults != null) {
                _isLoadingRecipeNames = false;
                _recipeSearchResults = null;
              } else {
                currentStep = 1;
              }
            });
          }
        },
        color: Colors.blue,
      ),
      middle: _buildPageIndicator(),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _indicatorDot(currentStep == 1),
        const SizedBox(width: 8),
        _indicatorDot(currentStep == 2),
        const SizedBox(width: 8),
        _indicatorDot(currentStep == 3),
      ],
    );
  }

  Widget _indicatorDot(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.grey.shade400,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  Widget _buildWelcomeScreen() {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: _buildWelcomeScreenContent(),
              ),
              _buildFloatingButton(
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Get Started', style: TextStyle(fontSize: 18)),
                      SizedBox(width: 8),
                      Icon(CupertinoIcons.arrow_right, size: 20),
                    ],
                  ),
                  onPressed: () => setState(() => currentStep = 2)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeScreenContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 40),
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 1),
          duration: const Duration(seconds: 1),
          builder: (context, double value, child) {
            return Transform.scale(
              scale: value,
              child: Icon(
                CupertinoIcons.wand_stars,
                size: 80,
                color: Colors.blue.withOpacity(value),
              ),
            );
          },
        ),
        const SizedBox(height: 40),
        const Text(
          'AI Recipe Generator',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Turn your ingredients into delicious recipes using AI.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 40),
        if (selectedImage != null) _buildImagePreview(),
        Visibility(
          visible: selectedImage == null,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: EdgeInsets.only(bottom: selectedImage != null ? 20 : 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildQuickImageButton(
                  icon: CupertinoIcons.camera,
                  label: 'Camera',
                  onTap: () => _pickImage(ImageSource.camera),
                ),
                const SizedBox(width: 20),
                _buildQuickImageButton(
                  icon: CupertinoIcons.photo,
                  label: 'Gallery',
                  onTap: () => _pickImage(ImageSource.gallery),
                ),
              ],
            ),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.only(top: 24),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                spreadRadius: isTextFieldFocused ? 2 : 0,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Only Use My Ingredients',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.w500,
                ),
              ),
              CupertinoSwitch(
                value: useOnlyMyIngredients,
                activeColor: Colors.blue,
                onChanged: (bool value) {
                  setState(() {
                    useOnlyMyIngredients = value;
                  });
                },
              ),
            ],
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(vertical: 20),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                spreadRadius: isTextFieldFocused ? 2 : 0,
              ),
            ],
          ),
          child: TextField(
            controller: _promptController,
            maxLines: 3,
            onTap: () => setState(() => isTextFieldFocused = true),
            onEditingComplete: () => setState(() => isTextFieldFocused = false),
            decoration: InputDecoration(
              hintText: 'Describe what you\'d like to cook... (optional)',
              border: InputBorder.none,
              hintStyle: const TextStyle(color: Colors.grey),
              suffixIcon:
                  isTextFieldFocused && _promptController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(CupertinoIcons.clear_circled_solid,
                              color: Colors.grey),
                          onPressed: () {
                            setState(() {
                              _promptController.clear();
                            });
                          },
                        )
                      : null,
            ),
          ),
        ),
        const SizedBox(height: 100),
      ],
    );
  }

  Widget _buildMainScreen() {
    return Stack(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: _buildMainScreenContent(),
        ),
        Padding(padding: EdgeInsets.only(bottom: 12),
        child:
        _buildFloatingButton(
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Generate Recipe', style: TextStyle(fontSize: 18)),
                Icon(CupertinoIcons.sparkles, size: 20),
              ],
            ),
            onPressed: selectedTypes.isNotEmpty ? _generateRecipeNames : null),)
      ],
    );
  }

  Widget _buildMainScreenContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (selectedImage != null)
          _buildCard(
            title: 'Selected Image',
            child: _buildSelectedImagePreview(),
          ),
        if (_promptController.text.isNotEmpty)
          _buildCard(
            title: 'Your Description',
            child: _buildPromptPreview(),
          ),
        const SizedBox(height: 24),
        _buildCard(
          title: 'Select Recipe Types',
          child: _buildRecipeTypeChips(),
        ),
        const SizedBox(height: 100),
      ],
    );
  }

  Widget _buildFloatingButton(
      {required Widget child, required VoidCallback? onPressed}) {
    return Positioned(
      left: 24,
      right: 24,
      bottom: 16,
      child: Center(
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOutQuad,
          builder: (context, double animationValue, innerChild) {
            return Opacity(
              opacity: animationValue,
              child: Transform.translate(
                offset: Offset(0, (1 - animationValue) * 10),
                child: innerChild,
              ),
            );
          },
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 48,
            child: CupertinoButton.filled(
              minSize: 50,
              borderRadius: BorderRadius.circular(30),
              onPressed: onPressed,
              child: child,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuickImageButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Icon(icon, size: 30, color: Colors.blue),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImagePreview() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.file(
              File(selectedImage!.path),
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Material(
              color: Colors.transparent,
              shape: const CircleBorder(),
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: _removeImage,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    CupertinoIcons.xmark,
                    size: 20,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectedImagePreview() {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.file(
          File(selectedImage!.path),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildPromptPreview() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        _promptController.text,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildRecipeTypeChips() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        ...recipeTypes.map((type) => _buildChip(type)),
        if (!isAddingCustomType)
          _buildChip('Custom', isCustom: true, onCustomTap: () {
            setState(() {
              isAddingCustomType = true;
            });
          }),
        if (isAddingCustomType) _buildCustomTypeInputField(),
      ],
    );
  }

  Widget _buildCustomTypeInputField() {
    return Container(
      width: 150,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: TextField(
              controller: _customTypeController,
              decoration: const InputDecoration(
                hintText: 'New type...',
                border: UnderlineInputBorder(),
              ),
              onSubmitted: (_) => _addCustomRecipeType(),
            ),
          ),
          IconButton(
            icon: const Icon(CupertinoIcons.checkmark_circle_fill,
                color: Colors.blue),
            onPressed: _addCustomRecipeType,
          ),
          IconButton(
            icon: const Icon(CupertinoIcons.xmark_circle_fill,
                color: Colors.grey),
            onPressed: () {
              setState(() {
                isAddingCustomType = false;
                _customTypeController.clear();
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCard({required String title, required Widget child}) {
    return Container(
      // Removed TweenAnimationBuilder and Transform.scale
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            child!,
          ],
        ),
      ),
    );
  }

  Widget _buildChip(String label,
      {bool isCustom = false, VoidCallback? onCustomTap}) {
    final bool isSelected = selectedTypes.contains(label);
    return GestureDetector(
      onTap: () {
        if (isCustom && onCustomTap != null) {
          onCustomTap();
        } else {
          setState(() {
            if (isSelected) {
              selectedTypes.remove(label);
            } else {
              selectedTypes.add(label);
            }
          });
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.transparent,
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isCustom && !isAddingCustomType) ...[
              Icon(
                CupertinoIcons.add,
                size: 16,
                color: isSelected ? Colors.blue : Colors.grey.shade600,
              ),
              const SizedBox(width: 4),
            ],
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.blue : Colors.grey.shade600,
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
