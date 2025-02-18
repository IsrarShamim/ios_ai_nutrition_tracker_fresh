import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import '../../auth/welcomescreens/2GoogleSignInScreen.dart';
import 'ChatProvider.dart';
import 'MarkdownText.dart';

/// A widget that creates a shimmering rectangle.
/// You can specify its [width], [height], and [borderRadius].
class ShimmerEffect extends StatefulWidget {
  final double width;
  final double height;
  final double borderRadius;

  const ShimmerEffect({
    Key? key,
    required this.width,
    required this.height,
    this.borderRadius = 0,
  }) : super(key: key);

  @override
  _ShimmerEffectState createState() => _ShimmerEffectState();
}

class _ShimmerEffectState extends State<ShimmerEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500))
      ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        // Modified slide calculation to move from left to right
        final slidePercent = _controller.value * 3 - 1; // This will give us range from -1 to 2
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            gradient: LinearGradient(
              begin: Alignment(slidePercent - 1, 0), // Start further left
              end: Alignment(slidePercent, 0),       // End further right
              colors: [
                Colors.grey.shade300,
                Colors.grey.shade100,
                Colors.grey.shade300,
              ],
              stops: const [0.0, 0.5, 1.0], // Modified stops for smoother transition
            ),
          ),
        );
      },
    );
  }
}

/// A chat bubble placeholder that uses shimmer lines to indicate that a response is coming.
class ShimmerChatBubble extends StatelessWidget {
  final bool isSent;

  const ShimmerChatBubble({Key? key, required this.isSent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(
          left: isSent ? 64 : 16,
          right: 16,
          top: 6,
          bottom: 6,
        ),
        decoration: BoxDecoration(
          color: isSent
              ? Theme.of(context).primaryColor.withOpacity(0.9)
              : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: _buildShimmerLines(context),
      ),
    );
  }

  Widget _buildShimmerLines(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment:
      isSent ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ShimmerEffect(width: screenWidth * 0.65, height: 16, borderRadius: 4),
        const SizedBox(height: 8),
        ShimmerEffect(width: screenWidth * 0.65, height: 16, borderRadius: 4),
        const SizedBox(height: 8),
        ShimmerEffect(width: screenWidth * 0.35, height: 16, borderRadius: 4),
      ],
    );
  }
}
/// A chat bubble widget that supports both text and an optional image.
class ChatBubble extends StatelessWidget {
  final String message;
  final bool isSent;
  final DateTime timestamp;
  final String? imageUrl;

  const ChatBubble({
    Key? key,
    required this.message,
    required this.isSent,
    required this.timestamp,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Align the bubble based on who sent the message.
    return Align(
      alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(
          left: isSent ? 64 : 16,
          right: 16,
          top: 6,
          bottom: 6,
        ),
        decoration: BoxDecoration(
          color: isSent
              ? Theme.of(context).primaryColor.withOpacity(0.9)
              : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: isSent
                ? ImageFilter.blur(sigmaX: 0, sigmaY: 0)
                : ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment:
                    isSent ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Display an image if available.
                  if (imageUrl != null) ...[
                    GestureDetector(
                      onTap: () {
                        // Show the image in a full-screen dialog.
                        showDialog(
                          context: context,
                          builder: (_) => Dialog(
                            backgroundColor: Colors.transparent,
                            insetPadding: const EdgeInsets.all(10),
                            child: GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: InteractiveViewer(
                                child: _buildImage(imageUrl!),
                              ),
                            ),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: _buildImage(imageUrl!),
                      ),
                    ),
                    const SizedBox(height: 4),
                  ],
                  // Display text message.
                  if (message.isNotEmpty) ...[
                    MarkdownMessage(message: message,isSent: isSent),
                    const SizedBox(height: 4),
                  ],
                  // Display the timestamp.
                  Text(
                    _formatTime(timestamp),
                    style: TextStyle(
                      color: (isSent ? Colors.white : Colors.black87)
                          .withOpacity(0.7),
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Returns an image widget from a URL or local file.
  Widget _buildImage(String url) {
    if (url.startsWith('http')) {
      return Image.network(url, fit: BoxFit.cover);
    } else {
      return Image.file(File(url), fit: BoxFit.cover);
    }
  }

  String _formatTime(DateTime time) {
    final hours = time.hour.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');
    return '$hours:$minutes';
  }
}

/// ChatScreen displays the chat messages and input area.
class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {


  final ScrollController _scrollController = ScrollController();
  final TextEditingController _messageController = TextEditingController();
  bool _isTextEmpty = true;
  bool _showScrollButton = false;

  final GlobalKey _sendRowKey = GlobalKey();
  double _sendRowHeight = 84;

  // Holds the selected image path (for preview).
  String? _selectedImagePath;

  bool _userHasScrolled = false;

  // Threshold to determine if we should auto-scroll
  static const double _scrollThreshold = 200;

  @override
  void initState() {
    super.initState();
    _messageController.addListener(_handleTextChange);
    _scrollController.addListener(_handleScroll);

    // Initial scroll to bottom
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom(animate: false);
      _measureSendRow();
    });
  }

  void _handleTextChange() {
    setState(() {
      _isTextEmpty = _messageController.text.isEmpty;
    });
  }

  void _handleScroll() {
    if (!_scrollController.hasClients) return;

    // Update scroll button visibility
    final showButton = _scrollController.position.pixels <
        _scrollController.position.maxScrollExtent - _scrollThreshold;

    if (showButton != _showScrollButton) {
      setState(() {
        _showScrollButton = showButton;
      });
    }

    // Track if user has manually scrolled up
    if (!_scrollController.position.atEdge) {
      _userHasScrolled = true;
    }

    // Reset user scroll flag if we're at the bottom
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 50) {
      _userHasScrolled = false;
    }
  }

  void _scrollToBottom({bool animate = true}) {
    if (!_scrollController.hasClients) return;

    final position = _scrollController.position.maxScrollExtent;

    if (animate) {
      _scrollController.animateTo(
        position,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutQuart,
      );
    } else {
      _scrollController.jumpTo(position);
    }
  }

  // Determine if we should auto-scroll based on user's current position
  bool _shouldAutoScroll() {
    if (!_scrollController.hasClients) return false;

    // Don't auto-scroll if user has scrolled up significantly
    if (_userHasScrolled &&
        _scrollController.position.pixels <
            _scrollController.position.maxScrollExtent - _scrollThreshold) {
      return false;
    }
    return true;
  }

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty && _selectedImagePath == null) return;

    Provider.of<ChatProvider>(context, listen: false)
        .sendUserMessage(text, imagePath: _selectedImagePath);
    _messageController.clear();
    setState(() {
      _selectedImagePath = null;
    });

    // Auto-scroll after sending message
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }




  void _measureSendRow() {
    final context = _sendRowKey.currentContext;
    if (context != null) {
      final RenderBox renderBox = context.findRenderObject() as RenderBox;
      setState(() {
        _sendRowHeight = renderBox.size.height;
      });
    }
  }



  Future<void> _handleTakePicture() async {
    final ImagePicker picker = ImagePicker();
    final XFile? xfile = await picker.pickImage(source: ImageSource.camera);
    if (xfile != null) {
      final savedPath = await saveXFileToPermanentStorage(xfile);
      setState(() {
        _selectedImagePath = savedPath;
      });
    }
  }

  Future<void> _handlePickPicture() async {
    final ImagePicker picker = ImagePicker();
    final XFile? xfile = await picker.pickImage(source: ImageSource.gallery);
    if (xfile != null) {
      final savedPath = await saveXFileToPermanentStorage(xfile);
      setState(() {
        _selectedImagePath = savedPath;
      });
    }
  }

  /// Saves the picked image permanently.
  Future<String> saveXFileToPermanentStorage(XFile xfile) async {
    final appDir = await getApplicationDocumentsDirectory();
    final fileName = xfile.name;
    final savedImage = await File(xfile.path).copy('${appDir.path}/$fileName');
    return savedImage.path;
  }

  /// Show a CupertinoActionSheet for image picker options.
  void _showImagePickerOptions() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) =>
          CupertinoActionSheet(
            title: const Text("Select Image"),
            actions: [
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                  _handleTakePicture();
                },
                child: const Text("Take Picture"),
              ),
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                  _handlePickPicture();
                },
                child: const Text("Pick Picture"),
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
          ),
    );
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.systemBackground,
      appBar: CupertinoNavigationBar(
        middle: const Text('Chat'),
        leading: CupertinoNavigationBarBackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: CupertinoColors.systemBackground.withOpacity(0.8),
        border: null,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Consumer<ChatProvider>(
                    builder: (context, chatProvider, child) {
                      // Auto-scroll when new messages arrive
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        if (_shouldAutoScroll()) {
                          _scrollToBottom();
                        }
                      });

                      return ListView.builder(
                        controller: _scrollController,
                        // physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.only(
                          bottom: _sendRowHeight + (_selectedImagePath != null ? 80 : 0),
                          top: 10,
                        ),
                        itemCount: chatProvider.messages.length,
                        itemBuilder: (context, index) {
                          final message = chatProvider.messages[index];
                          if (!message.isFromUser &&
                              message.message!.isEmpty &&
                              chatProvider.isResponseComing) {
                            return const ShimmerChatBubble(isSent: false);
                          }
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 24),
                            child: ChatBubble(
                              message: message.message ?? "",
                              isSent: message.isFromUser,
                              timestamp: message.timestamp,
                              imageUrl: message.imageUrl,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),


            // Bottom UI elements container
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Image preview
                  if (_selectedImagePath != null)
                    Align(  // Added Align widget
                      alignment: Alignment.centerRight,  // Align to the right
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: CupertinoColors.systemBackground,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,  // Added this
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                File(_selectedImagePath!),
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            IconButton(
                              padding: EdgeInsets.zero,  // Reduced padding
                              constraints: const BoxConstraints(),  // Minimal constraints
                              icon: const Icon(
                                  CupertinoIcons.xmark_circle_fill,
                                  size: 20,
                                  color: CupertinoColors.systemGrey
                              ),
                              onPressed: () => setState(() => _selectedImagePath = null),
                            ),
                          ],
                        ),
                      ),
                    ),

                  // Message input area
                  Container(
                    key: _sendRowKey,
                    decoration: BoxDecoration(
                      color: CupertinoColors.systemBackground,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, -5),
                        ),
                      ],
                    ),
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: CupertinoTextField(
                                controller: _messageController,
                                placeholder: 'Type a message',
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: CupertinoColors.systemGrey6,
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                suffix: _isTextEmpty
                                    ? Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: GestureDetector(
                                    onTap: _showImagePickerOptions,
                                    child: const Icon(
                                      Icons.image_rounded,
                                      color: CupertinoColors.systemGrey,
                                    ),
                                  ),
                                )
                                    : null,
                              ),
                            ),
                            const SizedBox(width: 8),
                            CupertinoButton(
                              padding: const EdgeInsets.all(12),
                              borderRadius: BorderRadius.circular(24),
                              color: Theme
                                  .of(context)
                                  .primaryColor,
                              onPressed: _sendMessage,
                              child: const Icon(
                                CupertinoIcons.arrow_up,
                                color: CupertinoColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Scroll-to-bottom button
            if (_showScrollButton)
              Positioned(
                bottom: _sendRowHeight + (_selectedImagePath != null ? 80 : 0),
                right: 16,
                child: Padding(padding: EdgeInsets.only(bottom: 16), child :
                CupertinoButton(
                  padding: const EdgeInsets.all(12),
                  color: CupertinoColors.systemGrey6.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                  onPressed: _scrollToBottom,
                  child: const Icon(
                    CupertinoIcons.arrow_down,
                    color: CupertinoColors.systemGrey,
                  ),
                ),),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _messageController.removeListener(_handleTextChange);
    _scrollController.dispose();
    _messageController.dispose();
    super.dispose();
  }

}
