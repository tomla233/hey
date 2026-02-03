import 'package:flutter/material.dart';

class PriceTag extends StatelessWidget {
  final String gamePrice;
  final bool? isDiscountPrice;
  const PriceTag({
    super.key,
    required this.gamePrice,
    this.isDiscountPrice = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isDiscountPrice == true? 96: 60,
      height: 26,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F8),
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.all(2),
      child: Wrap(
        spacing: 2, // 水平子组件间距
        runSpacing: 2,
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          const Icon(
            Icons.snowboarding_rounded,
            size: 16,
            fontWeight: FontWeight.bold,
          ),
          Text(
            '￥$gamePrice',
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          if (isDiscountPrice == true)
            const Text(
              '券后价',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
        ],
      ),
    );
  }
}
