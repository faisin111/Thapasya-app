import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

enum FlushType { success, error, warning, info }

class AppFlushbar {
  AppFlushbar._();

  static Future<void> show(
    BuildContext context, {
    required String title,
    required String message,
    FlushType type = FlushType.info,
  }) async {
    late Color color;
    late IconData icon;

    switch (type) {
      case FlushType.success:
        color = const Color(0xFF16A34A);
        icon = Icons.check_circle_rounded;
        break;

      case FlushType.error:
        color = const Color(0xFF7F1D1D);
        icon = Icons.cancel_rounded;
        break;

      case FlushType.warning:
        color = const Color(0xFFF59E0B);
        icon = Icons.warning_rounded;
        break;

      case FlushType.info:
        color = const Color(0xFF2563EB);
        icon = Icons.info_rounded;
        break;
    }

    await Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,

      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),

      borderRadius: BorderRadius.circular(20),

      backgroundColor: color,

      duration: const Duration(seconds: 3),

      animationDuration: const Duration(milliseconds: 450),

      isDismissible: true,

      forwardAnimationCurve: Curves.easeOutBack,

      reverseAnimationCurve: Curves.easeIn,

      boxShadows: [
        BoxShadow(
          color: color.withOpacity(.30),
          blurRadius: 24,
          spreadRadius: 2,
          offset: const Offset(0, 12),
        ),
      ],

      icon: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.15),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 28),
      ),

      titleText: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
      ),

      messageText: Text(
        message,
        style: const TextStyle(color: Colors.white, fontSize: 14, height: 1.4),
      ),

      leftBarIndicatorColor: Colors.white,

      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
    ).show(context);
  }

  static Future<void> success(
    BuildContext context, {
    required String title,
    required String message,
  }) {
    return show(
      context,
      title: title,
      message: message,
      type: FlushType.success,
    );
  }

  static Future<void> error(
    BuildContext context, {
    required String title,
    required String message,
  }) {
    return show(context, title: title, message: message, type: FlushType.error);
  }

  static Future<void> warning(
    BuildContext context, {
    required String title,
    required String message,
  }) {
    return show(
      context,
      title: title,
      message: message,
      type: FlushType.warning,
    );
  }

  static Future<void> info(
    BuildContext context, {
    required String title,
    required String message,
  }) {
    return show(context, title: title, message: message, type: FlushType.info);
  }
}
