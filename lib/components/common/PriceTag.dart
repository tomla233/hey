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
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F8),
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      child: IntrinsicWidth(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.snowboarding_rounded,
              size: 10,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(width: 2),
            Text(
              '￥$gamePrice',
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            if (isDiscountPrice == true)
              ...[
                const SizedBox(width: 4),
                const Text(
                '券后价',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              )
              ],
          ],
        ),
      ),
    );
  }
}
