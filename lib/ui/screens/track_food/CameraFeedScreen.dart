import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'package:ai_nutrition_tracker_for_ios/ui/screens/track_food/TrackFoodProvider.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import 'package:video_player/video_player.dart';

/// A screen that shows a live camera feed with overlay controls.
class CustomCameraScreen extends StatefulWidget {
  final List<CameraDescription> cameras;

  const CustomCameraScreen({
    Key? key,
    required this.cameras,
  }) : super(key: key);

  @override
  State<CustomCameraScreen> createState() => _CustomCameraScreenState();
}

class _CustomCameraScreenState extends State<CustomCameraScreen>
    with SingleTickerProviderStateMixin {
  CameraController? _controller;
  int _selectedCameraIndex = 0;
  bool _isFlashOn = false;
  final TextEditingController _contextController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();

  // Animation for the scanning line.
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.repeat(reverse: true);
  }

  Future<void> _initializeCamera() async {
    if (widget.cameras.isNotEmpty) {
      _selectedCameraIndex = 0;
      _controller = CameraController(
        widget.cameras[_selectedCameraIndex],
        ResolutionPreset.ultraHigh,
        enableAudio: false,
      );
      await _controller!.initialize();
      if (!mounted) return;
      setState(() {});
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    _animationController.dispose();
    _contextController.dispose();
    super.dispose();
  }

  void _toggleFlash() async {
    if (_controller == null) return;
    _isFlashOn = !_isFlashOn;
    await _controller!
        .setFlashMode(_isFlashOn ? FlashMode.torch : FlashMode.off);
    setState(() {});
  }

  void _switchCamera() async {
    if (widget.cameras.length < 2) return;
    _selectedCameraIndex = (_selectedCameraIndex + 1) % widget.cameras.length;
    await _controller?.dispose();
    _controller = CameraController(
      widget.cameras[_selectedCameraIndex],
      ResolutionPreset.medium,
      enableAudio: false,
    );
    await _controller!.initialize();
    setState(() {});
  }

  Future<String> saveXFileToPermanentStorage(XFile xfile) async {
    final appDir = await getApplicationDocumentsDirectory();
    final fileName = xfile.name;
    final savedImage = await File(xfile.path).copy('${appDir.path}/$fileName');
    return savedImage.path;
  }

  Future<void> _takePhoto() async {
    if (_controller == null || !_controller!.value.isInitialized) return;
    try {
      XFile file = await _controller!.takePicture();
      final permanentPath = await saveXFileToPermanentStorage(file);
      _scanFood(permanentPath);
    } catch (e) {
      print("Error taking picture: $e");
    }
  }

  Future<void> _pickImage() async {
    final XFile? file =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      final permanentPath = await saveXFileToPermanentStorage(file);
      _scanFood(permanentPath);
    }
  }

  void _scanFood(String permanentPath) {
    final provider = Provider.of<FoodAnalysisProvider>(context, listen: false);
    provider.setMealLoadingState();
    context.pushNamed('meal_details_screen');
    provider.setImageFile(File(permanentPath));
    provider.additionalContext = _contextController.text;
    provider.scanFoodImageOfUserWithGemini(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Full screen camera feed at the very back
          Positioned.fill(
            child: CameraPreview(_controller!),
          ),

          // Main content column
          Column(
            children: [
              // Top controls in SafeArea
              SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => context.pop(),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.black45,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            CupertinoIcons.chevron_back,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: _toggleFlash,
                            child: Container(
                              margin: const EdgeInsets.only(right: 16),
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.black45,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                _isFlashOn
                                    ? CupertinoIcons.bolt_fill
                                    : CupertinoIcons.bolt,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: _switchCamera,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.black45,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                CupertinoIcons.switch_camera,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Scanner area (takes remaining space)
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return CustomPaint(
                          size: Size(constraints.maxWidth, constraints.maxHeight),
                          painter: ModernScannerPainter(
                            progress: _animation.value,
                            cameraPreviewSize: Size(
                              constraints.maxWidth,
                              constraints.maxHeight,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

              // Bottom controls
              SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 24,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CupertinoTextField(
                        controller: _contextController,
                        placeholder: 'Add meal description (optional)',
                        placeholderStyle: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 14,
                        ),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: _pickImage,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.black45,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                CupertinoIcons.photo,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: _takePhoto,
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 6,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Container(
                                  width: 66,
                                  height: 66,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.black12,
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 48),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class ModernScannerPainter extends CustomPainter {
  final double progress;
  final Size cameraPreviewSize;

  ModernScannerPainter({
    required this.progress,
    required this.cameraPreviewSize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scanHeight = cameraPreviewSize.height;
    final scanWidth = size.width;
    final y = progress * scanHeight;

    // Scanning line
    final linePaint = Paint()
      ..shader = LinearGradient(
        colors: [
          Colors.green.withOpacity(0.1),
          Colors.green.withOpacity(0.4),
          Colors.green.withOpacity(0.1),
        ],
        stops: const [0.0, 0.5, 1.0],
      ).createShader(Rect.fromLTWH(0, y - 1, scanWidth, 4));

    canvas.drawRect(
      Rect.fromLTWH(0, y - 1, scanWidth, 4),
      linePaint,
    );

    // Corner indicators
    final cornerPaint = Paint()
      ..color = Colors.green.withOpacity(0.8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    const cornerSize = 40.0;
    const padding = 20.0;
    const radius = 8.0; // Radius for the rounded corners

    // Top-left corner
    final topLeftPath = Path()
      ..moveTo(padding + radius, padding)
      ..lineTo(padding + cornerSize, padding)
      ..moveTo(padding, padding + radius)
      ..lineTo(padding, padding + cornerSize)
      ..addArc(
        Rect.fromCircle(center: Offset(padding + radius, padding + radius), radius: radius),
        pi,
        pi/2,
      );

    // Top-right corner
    final topRightPath = Path()
      ..moveTo(scanWidth - padding - cornerSize, padding)
      ..lineTo(scanWidth - padding - radius, padding)
      ..moveTo(scanWidth - padding, padding + radius)
      ..lineTo(scanWidth - padding, padding + cornerSize)
      ..addArc(
        Rect.fromCircle(center: Offset(scanWidth - padding - radius, padding + radius), radius: radius),
        -pi/2,
        pi/2,
      );

    // Bottom-left corner
    final bottomLeftPath = Path()
      ..moveTo(padding + radius, scanHeight - padding)
      ..lineTo(padding + cornerSize, scanHeight - padding)
      ..moveTo(padding, scanHeight - padding - cornerSize)
      ..lineTo(padding, scanHeight - padding - radius)
      ..addArc(
        Rect.fromCircle(center: Offset(padding + radius, scanHeight - padding - radius), radius: radius),
        pi/2,
        pi/2,
      );

    // Bottom-right corner
    final bottomRightPath = Path()
      ..moveTo(scanWidth - padding - cornerSize, scanHeight - padding)
      ..lineTo(scanWidth - padding - radius, scanHeight - padding)
      ..moveTo(scanWidth - padding, scanHeight - padding - cornerSize)
      ..lineTo(scanWidth - padding, scanHeight - padding - radius)
      ..addArc(
        Rect.fromCircle(center: Offset(scanWidth - padding - radius, scanHeight - padding - radius), radius: radius),
        0,
        pi/2,
      );

    // Draw all corners
    canvas.drawPath(topLeftPath, cornerPaint);
    canvas.drawPath(topRightPath, cornerPaint);
    canvas.drawPath(bottomLeftPath, cornerPaint);
    canvas.drawPath(bottomRightPath, cornerPaint);
  }

  @override
  bool shouldRepaint(covariant ModernScannerPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}


/// A simple screen to display the captured/selected image along with any context.
class DisplayPictureScreen extends StatelessWidget {
  const DisplayPictureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FoodAnalysisProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Captured Image'),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          if (provider.imageFile != null)
            Expanded(child: Image.file(provider.imageFile!)),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Context: additional context',
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}





//
//
// class FoodScanVideo extends StatefulWidget {
//   const FoodScanVideo({Key? key}) : super(key: key);
//
//   @override
//   _FoodScanVideoState createState() => _FoodScanVideoState();
// }
//
// class _FoodScanVideoState extends State<FoodScanVideo> {
//   late VideoPlayerController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.asset(
//       'assets/videos/camerafeedtwo.mp4',
//       videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
//     )..initialize().then((_) {
//       setState(() {});
//       _controller.setLooping(true);
//       _controller.play();
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.black,
//       child: _controller.value.isInitialized
//           ? LayoutBuilder(
//         builder: (context, constraints) {
//           return SizedBox.expand(
//             child: FittedBox(
//               fit: BoxFit.cover,
//               child: SizedBox(
//                 width: _controller.value.size.width,
//                 height: _controller.value.size.height,
//                 child: VideoPlayer(_controller),
//               ),
//             ),
//           );
//         },
//       )
//           : const CupertinoActivityIndicator(),
//     );
//   }
// }

