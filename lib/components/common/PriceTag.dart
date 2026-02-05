import 'package:flutter/material.dart';

class PriceTag extends StatelessWidget {
  final String gamePrice;
  // 标签数组
  final List<String?> tags;

  const PriceTag({super.key, required this.gamePrice, this.tags = const []});

  // 外层容器左侧圆角
  static const outerRadius = 2.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF3F4F8),
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(outerRadius),
          right: Radius.circular(outerRadius),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
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
          if (tags.any((e) => e != null)) ...[
            const SizedBox(width: 4),
            ..._buildTagWidgets(tags),
          ],
        ],
      ),
    );
  }

  // 构建标签
  List<Widget> _buildTagWidgets(List<String?> tags) {
    // 存储非空标签的索引（用于判断最后一个非空标签）
    List<int> nonNullIndexes = [];
    for (int i = 0; i < tags.length; i++) {
      if (tags[i] != null) {
        nonNullIndexes.add(i);
      }
    }

    return List<Widget>.generate(tags.length, (index) {
      String? tag = tags[index];
      if (tag == null) {
        return const SizedBox.shrink();
      }
      Color bgColor = Colors.transparent;
      BorderRadius borderRadius = BorderRadius.zero;
      Color textColor = Colors.white;
      switch (index) {
        case 0: // "券后价"）
          borderRadius = const BorderRadius.horizontal(
            left: Radius.zero,
            right: Radius.zero,
          );
          textColor = Colors.black;
          break;
        case 1: //（原价格）
          borderRadius = const BorderRadius.horizontal(
            left: Radius.zero,
            right: Radius.zero,
          );
          textColor = const Color(0xFF8C8F95);
          break;
        case 2: //（"-90%"）
          bgColor = const Color(0xFF404348);
          borderRadius = const BorderRadius.horizontal(
            left: Radius.zero,
            right: Radius.zero,
          );
          break;
        case 3: //（"新史低"）
          bgColor = const Color(0xFF009016);
          borderRadius = const BorderRadius.horizontal(
            left: Radius.zero,
            right: Radius.zero,
          );
          break;
      }
      if (index == nonNullIndexes.last) {
        borderRadius = const BorderRadius.horizontal(
          left: Radius.zero,
          right: Radius.circular(4),
        );
      }

      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        decoration: BoxDecoration(color: bgColor, borderRadius: borderRadius),
        child: Text(
          tag,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: textColor,
            decoration: index == 1 ? TextDecoration.lineThrough : null,
            decorationThickness: 1.5,
            decorationColor: Colors.grey,
          ),
        ),
      );
    });
  }
}
