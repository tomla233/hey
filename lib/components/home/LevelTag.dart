import 'package:flutter/material.dart';

///等级标签组件
class LevelTag extends StatelessWidget {
  const LevelTag({super.key, required this.level});
  final String level;
  static const String tagPrefix = "Lv.";
  // 不同等级对应的渐变色
  static const Map<String, List<Color>> levelGradients = {
    "1": [Color(0xFF64B5F6), Color(0xFF2196F3)],
    "2": [Color(0xFF81C784), Color(0xFF4CAF50)],
    "3": [Color(0xFFFFB74D), Color(0xFFFF9800)],
    "4": [Color(0xFFF06292), Color(0xFFE91E63)],
    "5": [Color(0xFFBA68C8), Color(0xFF9C27B0)],
    "6": [Color(0xFFF48FB1), Color(0xFFF06292)],
    "7": [Color(0xFFCE93D8), Color(0xFF9C27B0)],
    "8": [Color(0xFFB39DDB), Color(0xFF673AB7)],
    "9": [Color(0xFF9FA8DA), Color(0xFF3F51B5)],
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
      width: 100,
      height: 20,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: gradientColors,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(1.0),
      child: Text(
        tagPrefix + level,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
