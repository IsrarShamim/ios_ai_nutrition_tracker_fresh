import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationHelper {
  static OverlayEntry? _currentNotification;

  static void showNotification({
    required BuildContext context,
    required String message,
    NotificationType type = NotificationType.info,
    Duration duration = const Duration(seconds: 2),
    VoidCallback? onActionPressed,
    String? actionLabel,
  }) {
    // Remove existing notification if any
    _currentNotification?.remove();

    // Create new notification
    _currentNotification = OverlayEntry(
      builder: (context) => _IOSNotification(
        message: message,
        type: type,
        duration: duration,
        onActionPressed: onActionPressed,
        actionLabel: actionLabel,
      ),
    );

    // Show notification
    Overlay.of(context).insert(_currentNotification!);

    // Auto-dismiss after duration
    Future.delayed(duration, () {
      _currentNotification?.remove();
      _currentNotification = null;
    });
  }
}

enum NotificationType {
  success,
  error,
  warning,
  info
}

class _IOSNotification extends StatelessWidget {
  final String message;
  final NotificationType type;
  final Duration duration;
  final VoidCallback? onActionPressed;
  final String? actionLabel;

  const _IOSNotification({
    required this.message,
    required this.type,
    required this.duration,
    this.onActionPressed,
    this.actionLabel,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        type: MaterialType.transparency,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 200),
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(0, -50 * (1 - value)),
                  child: Opacity(
                    opacity: value,
                    child: child,
                  ),
                );
              },
              child: Container(
                constraints: const BoxConstraints(maxWidth: 400),
                decoration: BoxDecoration(
                  color: CupertinoColors.systemBackground.resolveFrom(context),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: CupertinoColors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: _getBackgroundColor(type).withOpacity(0.9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildIcon(type),
                          const SizedBox(width: 12),
                          Flexible(
                            child: Text(
                              message,
                              style: const TextStyle(
                                color: CupertinoColors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          if (actionLabel != null && onActionPressed != null) ...[
                            const SizedBox(width: 12),
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: onActionPressed,
                              child: Text(
                                actionLabel!,
                                style: TextStyle(
                                  color: _getActionTextColor(type),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(NotificationType type) {
    IconData icon;
    switch (type) {
      case NotificationType.success:
        icon = CupertinoIcons.check_mark_circled_solid;
        break;
      case NotificationType.error:
        icon = CupertinoIcons.xmark_circle_fill;
        break;
      case NotificationType.warning:
        icon = CupertinoIcons.exclamationmark_triangle_fill;
        break;
      case NotificationType.info:
        icon = CupertinoIcons.info_circle_fill;
        break;
    }

    return Icon(
      icon,
      color: CupertinoColors.white,
      size: 24,
    );
  }

  Color _getBackgroundColor(NotificationType type) {
    switch (type) {
      case NotificationType.success:
        return CupertinoColors.systemGreen;
      case NotificationType.error:
        return CupertinoColors.systemRed;
      case NotificationType.warning:
        return CupertinoColors.systemOrange;
      case NotificationType.info:
        return CupertinoColors.systemBlue;
    }
  }

  Color _getActionTextColor(NotificationType type) {
    switch (type) {
      case NotificationType.success:
        return CupertinoColors.systemGreen.withOpacity(0.8);
      case NotificationType.error:
        return CupertinoColors.systemRed.withOpacity(0.8);
      case NotificationType.warning:
        return CupertinoColors.systemOrange.withOpacity(0.8);
      case NotificationType.info:
        return CupertinoColors.systemBlue.withOpacity(0.8);
    }
  }
}