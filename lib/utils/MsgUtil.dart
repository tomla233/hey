import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class MsgUtil {
  static void show(String msg, {ToastPosition position = ToastPosition.top}) {
    showToast(
      msg,
      position: position,
      duration: const Duration(seconds: 2),
      backgroundColor: const Color(0xFF4D5153),
      textPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 18),
      textStyle: const TextStyle(fontSize: 14, color: Colors.white),
    );
  }
}
