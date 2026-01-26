import 'package:flutter/material.dart';

///等级标签组件
class LevelTag extends StatelessWidget {
  const LevelTag({super.key, required this.level});
  final String level;
  static const String tagPrefix = "Lv.";
  // 不同等级对应的渐变色
  static const Map<String, List<Color>> levelGradients = {
    "1": [Color(0xFF2196F3), Color(0xFF64B5F6)],
    "2": [Color(0xFF4CAF50), Color(0xFF81C784)],
    "3": [Color(0xFFFF9800), Color(0xFFFFB74D)],
    "4": [Color(0xFFE91E63), Color(0xFFF06292)],
    "5": [Color(0xFF9C27B0), Color(0xFFBA68C8)],
    "6": [Color(0xFFF06292), Color(0xFFF48FB1)],
    "7": [Color(0xFF9C27B0), Color(0xFFCE93D8)],
    "8": [Color(0xFF673AB7), Color(0xFFB39DDB)],
    "9": [Color(0xFF3F51B5), Color(0xFF9FA8DA)],
  };
  // 默认渐变颜色
  static const List<Color> defaultGradient = [
    Color(0xFF9E9E9E),
    Color(0xFF616161),
  ];
  @override
  Widget build(BuildContext context) {
    final gradientColors = levelGradients[level] ?? defaultGradient;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: gradientColors,
        ),
        borderRadius: BorderRadius.circular(2),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 6),
      child: Text(
        tagPrefix + level,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 8,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
