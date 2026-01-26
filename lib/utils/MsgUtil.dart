import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class MsgUtil {
  static void show(String msg) {
    showToast(
      msg,
      position: ToastPosition.top,
      duration: const Duration(seconds: 2),
      backgroundColor: const Color(0xFF4D5153),
      textPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      textStyle: const TextStyle(fontSize: 16, color: Colors.white),
    );
  }
}
