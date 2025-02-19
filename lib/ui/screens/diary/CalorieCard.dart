import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

import 'package:provider/provider.dart';
import '../../../data/database/entities/nutrition_entities.dart';
import '../../../data/util/GetDate.dart';
import '../../auth/welcomescreens/2GoogleSignInScreen.dart';
import '../HomeScreen.dart';
import 'DailyMeals.dart';
import 'DiaryProvider.dart';
import 'TopBar.dart';

class NutritionDashboard extends StatefulWidget {
  final int consumedCalories;
  final int targetCalories;
  final List<MacroNutrient> macros;
  final List<MicroNutrient> micronutrients;
  final Function(String,DateTime)? dateChange; // Add the callback function

  const NutritionDashboard({
    Key? key,
    required this.consumedCalories,
    required this.targetCalories,
    required this.macros ,
    required this.micronutrients,
    this.dateChange, // Initialize the callback function
  }) : super(key: key);

  @override
  State<NutritionDashboard> createState() => _NutritionDashboardState();
}

class _NutritionDashboardState extends State<NutritionDashboard> {
  late final PageController _pageController;
  final ValueNotifier<int> _currentPage = ValueNotifier(0);

  late DateTime _currentDate;
  late String currentDate;
  late StreamSubscription<Nutrition?> _nutritionSubscription;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.94,
      initialPage: 0,
    );

    final provider = Provider.of<DiaryProvider>(context, listen: false);
    _currentDate = provider.dateTime;
    currentDate = provider.dateForHomeScreen;

    // Listen to nutrition changes
    final nutritionLoader = Provider.of<NutritionLoaderService>(context, listen: false);
    _nutritionSubscription = nutritionLoader.nutritionStream.listen((nutrition) {
      if (nutrition != null) {
        // Update dates when nutrition changes
        setState(() {
          currentDate = nutrition.date!;
          _currentDate = DateFormat('dd-MM-yyyy').parse(nutrition.date ?? getCurrentDate());
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _nutritionSubscription.cancel();
    super.dispose();
  }

  void _decreaseDate() {
    final provider = Provider.of<DiaryProvider>(context, listen: false);
    final nutritionLoader = Provider.of<NutritionLoaderService>(context, listen: false);

    final minusOneDay = _currentDate.subtract(const Duration(days: 1));
    final newCurrentDate = DateFormat('dd-MM-yyyy').format(minusOneDay);

    // Update provider
    provider.dateTime = minusOneDay;
    provider.dateForHomeScreen = newCurrentDate;

    // Update local state
    setState(() {
      _currentDate = minusOneDay;
      currentDate = newCurrentDate;
    });

    // Load nutrition for new date
    nutritionLoader.loadNutritionForDate(newCurrentDate);

    // Call the callback if provided
    widget.dateChange?.call(newCurrentDate, minusOneDay);
  }
  void _increaseDate() {
    final provider = Provider.of<DiaryProvider>(context, listen: false);
    final nutritionLoader = Provider.of<NutritionLoaderService>(context, listen: false);

    final plusOneDay = _currentDate.add(const Duration(days: 1));
    final newCurrentDate = DateFormat('dd-MM-yyyy').format(plusOneDay);

    // Update provider
    provider.dateTime = plusOneDay;
    provider.dateForHomeScreen = newCurrentDate;

    // Update local state
    setState(() {
      _currentDate = plusOneDay;
      currentDate = newCurrentDate;
    });

    // Load nutrition for new date
    nutritionLoader.loadNutritionForDate(newCurrentDate);

    // Call the callback if provided
    widget.dateChange?.call(newCurrentDate, plusOneDay);
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<DiaryProvider>(
        builder: (context, diaryProvider, child) {
          // Update local dates if provider dates change
          if (diaryProvider.dateTime != _currentDate) {
            _currentDate = diaryProvider.dateTime;
            currentDate = diaryProvider.dateForHomeScreen;
          }

          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.orange.shade50, // Starting color at top right
                  Colors.blueGrey.shade50, // Ending color at bottom left
                  Colors.blueGrey.shade50, // Ending color at bottom left
                  Colors.white, // Ending color at bottom left
                ],
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(60 + kToolbarHeight),
                // Adjust as needed
                child: Padding(
                  padding: EdgeInsets.only(top: MediaQuery
                      .of(context)
                      .padding
                      .top),
                  child: DatePickerTopBar(
                    date: currentDate,
                    decreaseDate: _decreaseDate,
                    increaseDate: _increaseDate,
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    // const SizedBox(height: 42),
                    // DatePickerTopBar(
                    //   date: currentDate,
                    //   decreaseDate: _decreaseDate,
                    //   increaseDate: _increaseDate,
                    // ),
                    // const SizedBox(height: 8),
                    SizedBox(
                      height: 320, // Reduced height for the dashboard area.
                      child: PageView(
                        controller: _pageController,
                        onPageChanged: (index) {
                        _currentPage.value = index;
                      },
                        children: [
                          _buildCaloriesCard(context),
                          _buildMicronutrientsCard(
                              context, widget.micronutrients),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildEnhancedPageIndicator(),
                    // const SizedBox(height: 12),
                    DiaryMealsScreen(selectedDate: currentDate),
                  ],
                ),
              ),
            ),
          );
        }

    );
  }


  Widget _buildCaloriesCard(BuildContext context) {
    final caloriesLeft = widget.targetCalories - widget.consumedCalories;
    final progress = widget.consumedCalories / widget.targetCalories;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
      child: Card(
        color: Colors.white,
        elevation: 0.01,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Calories Left',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.3,
                                  ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              caloriesLeft.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor,
                                    height: 0.9,
                                  ),
                            ),
                            const SizedBox(width: 4),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Text(
                                'kcal',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 90,
                    height: 90,
                    margin: const EdgeInsets.only(left: 16),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        TweenAnimationBuilder<double>(
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeInOut,
                          tween: Tween<double>(begin: 0, end: progress),
                          builder: (context, value, _) => CustomPaint(
                            size: const Size(90, 90),
                            painter: CircularProgressPainter(
                              progress: value,
                              backgroundColor: Colors.grey[200]!,
                              progressColor: Theme.of(context).primaryColor,
                              strokeWidth: 10.0,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.local_fire_department,
                          size: 32,
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: widget.macros
                      .map((macro) => _buildMacroItem(context, macro))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMacroItem(BuildContext context, MacroNutrient macro) {

    double progress;
  if (macro.target == 0) {
    progress = 0.0; // or some default value
  } else {
    progress = macro.consumed / macro.target;
  }
  final percentage = (progress * 100).toInt();

    return Container(
      width: 85,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                macro.name,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.2,
                    ),
              ),
              const SizedBox(width: 4),
              _getMacroIcon(macro.name),
            ],
          ),
          const SizedBox(height: 12),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 52,
                width: 52,
                child: TweenAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.easeInOut,
                  tween: Tween<double>(begin: 0, end: progress),
                  builder: (context, value, _) => CustomPaint(
                    painter: CircularProgressPainter(
                      progress: value,
                      backgroundColor: Colors.grey[200]!,
                      progressColor: _getMacroColor(macro.name),
                      strokeWidth: 5.0,
                    ),
                  ),
                ),
              ),
              Text(
                '$percentage%',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: _getMacroColor(macro.name),
                    ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: macro.consumed.toString(),
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: _getMacroColor(macro.name),
                      ),
                ),
                TextSpan(
                  text: '/${macro.target}${macro.unit}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Color _getMacroColor(String macroName) {
    switch (macroName.toLowerCase()) {
      case 'protein':
        return Colors.red.shade400;
      case 'carbs':
        return Colors.blue.shade400;
      case 'fats':
        return Colors.amber.shade400;
      default:
        return Colors.grey;
    }
  }

  Widget _getMacroIcon(String macroName) {
    IconData iconData;
    Color color;

    switch (macroName.toLowerCase()) {
      case 'protein':
        iconData = Icons.egg_outlined;
        color = Colors.red.shade400;
        break;
      case 'carbs':
        iconData = Icons.grain;
        color = Colors.blue.shade400;
        break;
      case 'fats':
        iconData = Icons.water_drop_outlined;
        color = Colors.amber.shade400;
        break;
      default:
        iconData = Icons.circle;
        color = Colors.grey;
    }

    return Icon(
      iconData,
      size: 14,
      color: color,
    );
  }



  /// Enhanced Micronutrients Card with fixed height
  Widget _buildMicronutrientsCard(
      BuildContext context, List<MicroNutrient> micronutrients) {
    // Accept micronutrients list
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
      child: SizedBox(
        height: 300, // Fixed height
        child: Card(
          color: Colors.white,
          elevation: 0.01,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.local_fire_department,
                        color: Colors.teal, size: 24),
                    const SizedBox(width: 8),
                    Text(
                      'Micronutrients',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Colors.grey[800],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children:
                      micronutrients // Use the passed micronutrients data
                          .map((nutrient) =>
                          _buildMicronutrientRow(context, nutrient))
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildMicronutrientRow(BuildContext context, MicroNutrient nutrient) {
    // Prevent division by zero by checking if nutrient.target is 0
    final progress =
    nutrient.target != 0 ? nutrient.consumed / nutrient.target : 0.0;
    // final percentage = (progress * 100).toInt();

    // Get appropriate icon and color for each nutrient
    final (IconData icon, Color color) = _getNutrientProperties(nutrient.name);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6,horizontal: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, size: 20, color: color),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    nutrient.name,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
                Text(
                  '${nutrient.consumed}/${nutrient.target}${nutrient.unit}',
                  // Display dynamic values
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Stack(
                  children: [
                    LayoutBuilder(
                      builder: (context, constraints) => AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeOut,
                        width: constraints.maxWidth * progress,
                        // Use dynamic progress
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [color, color.withOpacity(0.7)],
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

// Helper function for nutrient properties
  (IconData, Color) _getNutrientProperties(String nutrient) {
    switch (nutrient) {
      case 'Sugar':
        return (Icons.cookie_outlined, Colors.pink);
      case 'Sodium':
        return (Icons.water_drop_outlined, Colors.blue);
      case 'Calcium':
        return (Icons.fitness_center_outlined, Colors.green);
      case 'Magnesium':
        return (Icons.spa_outlined, Colors.purple);
      case 'Potassium':
        return (Icons.eco_outlined, Colors.orange);
      default:
        return (Icons.circle_outlined, Colors.grey);
    }
  }

  Widget _buildEnhancedPageIndicator() {
    return ValueListenableBuilder<int>(
        valueListenable: _currentPage,
        builder: (context, currentPage, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(2, (i) {
              final isActive = currentPage == i;
              return TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 200),
                tween: Tween<double>(end: isActive ? 24.0 : 8.0),
                builder: (context, width, child) {
                  return Container(
                    width: width,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: isActive
                          ? Theme.of(context).primaryColor.withOpacity(0.3)
                          : Theme.of(context).disabledColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                },
              );
            }),
          );
        }
    );
  }

}

/// Circular progress painter for custom drawing of progress indicators.
class CircularProgressPainter extends CustomPainter {
  final double progress;
  final Color backgroundColor;
  final Color progressColor;
  final double strokeWidth;

  CircularProgressPainter({
    required this.progress,
    required this.backgroundColor,
    required this.progressColor,
    this.strokeWidth = 8.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius =
        math.min(size.width / 2, size.height / 2) - (strokeWidth / 2);

    final Gradient gradient = SweepGradient(
      startAngle: -math.pi / 2,
      endAngle: 3 * math.pi / 2,
      tileMode: TileMode.repeated,
      colors: [
        progressColor.withOpacity(0.8),
        progressColor,
      ],
    );

    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final progressPaint = Paint()
      ..shader = gradient.createShader(Rect.fromCircle(
        center: center,
        radius: radius,
      ))
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, backgroundPaint);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      2 * math.pi * progress,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CircularProgressPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.progressColor != progressColor ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}

/// MacroNutrient model.
class MacroNutrient {
  final String name;
  final int consumed;
  final int target;
  final String unit;

  const MacroNutrient(this.name, this.consumed, this.target, this.unit);
}

/// MicroNutrient model. // Added MicroNutrient model
class MicroNutrient {
  final String name;
  final int consumed;
  final int target;
  final String unit;

  const MicroNutrient(this.name, this.consumed, this.target, this.unit);
}
