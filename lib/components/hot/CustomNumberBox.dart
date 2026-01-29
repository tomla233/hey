import 'package:flutter/material.dart';
import 'package:hey/constant/GlobalConstants.dart';

class CustomNumberBox extends StatelessWidget {
  final int number;
  const CustomNumberBox({super.key, required this.number});

  // 根据数字获取对应的渐变背景
  LinearGradient? _getGradientByNumber(int num) {
    switch (num) {
      case 1:
        return const LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [Color(0xFFFF5722), Color(0xFFFF9800)],
        );
      case 2:
        return const LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [Color(0xFF673AB7), Color(0xFF9C27B0)],
        );
      case 3:
        return const LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [Color(0xFF03A9F4), Color(0xFF2196F3)],
        );
      case 4:
        return const LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [Color(0xFF8BC34A), Color(0xFF4CAF50)],
        );
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final gradient = _getGradientByNumber(number);

    return Container(
      width: 24,
      height: GlobalConstants.hotPostContainerHeight,
      color: Colors.white,
      alignment: Alignment.topLeft,
      child: Container(
        width: 18,
        height: 22,
        decoration: BoxDecoration(gradient: gradient),
        alignment: Alignment.center,
        child: Text(
          '$number',
          style: TextStyle(
            color: number <= 4 ? Colors.white : const Color(0xFF8C9195),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
