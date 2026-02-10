import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  // 评分（0-5，支持小数，比如 3.5）
  final double rating;
  // 星星颜色（默认橙色，符合常见评分风格）
  final Color starColor;
  // 星星大小
  final double starSize;
  // 星星数量（固定5颗）
  final int starCount;

  const StarRating({
    super.key,
    required this.rating,
    this.starColor = Colors.orange,
    this.starSize = 24.0,
    this.starCount = 5,
  }) : assert(rating >= 0 && rating <= starCount);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min, // 仅占需要的宽度
      children: List.generate(starCount, (index) {
        // 计算当前星星的显示类型
        IconData icon;
        if (index < rating.floor()) {
          // 实心星星（比如 3.5 星的前 3 颗）
          icon = Icons.star;
        } else if (index == rating.floor() && rating - index > 0) {
          // 半颗星星（比如 3.5 星的第 4 颗）
          icon = Icons.star_half;
        } else {
          // 空心星星（比如 3.5 星的第 5 颗）
          icon = Icons.star_border;
        }

        return Icon(
          icon,
          color: starColor,
          size: starSize,
        );
      }),
    );
  }
}

// 用法示例
void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 4 星（全实心）
            StarRating(rating: 4.0),
            SizedBox(height: 20),
            // 3.5 星（3 实心 + 1 半星 + 1 空心）
            StarRating(rating: 3.5, starSize: 30),
            SizedBox(height: 20),
            // 2 星（自定义红色）
            StarRating(rating: 2.0, starColor: Colors.red),
          ],
        ),
      ),
    ),
  ));
}