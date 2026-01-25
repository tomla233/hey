import 'package:flutter/material.dart';

class ToastUtils {
  static bool showLoading = false;
  static void showToast(BuildContext context, String? msg) {
    if (ToastUtils.showLoading) {
      return;
    }
    ToastUtils.showLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      ToastUtils.showLoading = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 160,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        backgroundColor: const Color(0xFF4D5153),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        content: Text(
          msg ?? "加载成功",
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12, ),
        ),
      ),
    );
  }
}
