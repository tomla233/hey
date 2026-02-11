import 'package:flutter/material.dart';

///安利墙-综合评分小卡片
class ScoreCard extends StatelessWidget {
  final double overallScore; //评分
  final String numbersOfScore; //评分人数
  const ScoreCard({
    super.key,
    required this.overallScore,
    required this.numbersOfScore,
  });

  // 根据评分获取对应的渐变背景
  LinearGradient? _getGradientByScore(double score) {
    if (score < 6) {
      return const LinearGradient(
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
        colors: [Color(0xFF8BC34A), Color(0xFF4CAF50)],
      );
    } else if (score >= 6 && score < 9) {
      return const LinearGradient(
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
        colors: [Color(0xFF03A9F4), Color(0xFF2196F3)],
      );
    }
    return const LinearGradient(
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
      colors: [Color(0xFFFF5722), Color(0xFFFF9800)],
    );
  }

  @override
  Widget build(BuildContext context) {
    final gradient = _getGradientByScore(overallScore);
    final double radius = 4.0;
    return Container(
      width: 60,
      height: 50,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(radius),
                topRight: Radius.circular(radius),
              ),
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('lib/assets/box_white.png', width: 16, height: 16),
                const SizedBox(width: 4),
                Text(
                  '$overallScore',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F6),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(radius),
                bottomRight: Radius.circular(radius),
              ),
            ),
            child: Text(
              '$numbersOfScore人评分',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF14191D),
                fontSize: 8,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
