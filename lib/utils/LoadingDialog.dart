import 'package:flutter/material.dart';

class LoadingDialog {
  static void show(BuildContext context, {String message = "加载中..."}) {
    if (!_isContextMounted(context)) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 10),
                  Text(message),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static void hide(BuildContext context) {
    if (_isContextMounted(context)) {
      Navigator.pop(context);
    }
  }

  static bool _isContextMounted(BuildContext context) {
    if (context is StatefulElement) {
      return context.state.mounted;
    }
    return false;
  }
}
