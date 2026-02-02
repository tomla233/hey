import 'package:flutter/material.dart';
import 'package:hey/utils/MsgUtil.dart';

/// 标签卡片
class TagCard extends StatelessWidget {
  const TagCard({super.key});
  void _onMoreTap() {
    MsgUtil.show('更多');
  }

  @override
  Widget build(BuildContext context) {
    // 统一上左右padding
    final double hPadding = 10;
    //列之间的水平间距
    final double hSpacing = 6;
    // 计算每个卡片的宽度
    final double screenWidth = MediaQuery.of(context).size.width;
    final double cardWidth = (screenWidth - hPadding * 2 - hSpacing * 4) / 4;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '标题',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            GestureDetector(
              onTap: _onMoreTap,
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '更多',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 4),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text('data'),
      ],
    );
  }
}
