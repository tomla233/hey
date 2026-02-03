import 'package:flutter/material.dart';
import 'package:hey/mock/GameService.dart';
import 'package:hey/models/game/TagCardEntity.dart';
import 'package:hey/utils/MsgUtil.dart';

/// 标签卡片
class TagCard extends StatelessWidget {
  TagCard({super.key});
  void _onTagTap(TagCardEntity item) {
    MsgUtil.show(item.tagName);
  }

  final List<TagCardEntity> tagCardList = GameService().tagCardList;
  @override
  Widget build(BuildContext context) {
    // 统一上左右padding
    final double hPadding = 10;
    //列之间的水平间距
    final double hSpacing = 6;
    // 计算每个卡片的宽度
    final double screenWidth = MediaQuery.of(context).size.width;
    final double cardWidth = (screenWidth - hPadding * 2 - hSpacing * 3) / 4;
    return Wrap(
      spacing: hSpacing,
      runSpacing: 10,
      children: tagCardList.map((item) {
        return GestureDetector(
          onTap: () => _onTagTap(item),
          child: Container(
            width: cardWidth,
            height: cardWidth * 0.5,
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 4,
                  top: 4,
                  child: Text(
                    item.tagName,
                    style: const TextStyle(fontSize: 12,color: Colors.black),
                  ),
                ),
                Positioned(
                  bottom: 4,
                  right: 4,
                  child: Image.asset(item.tagIcon, width: 20, height: 20),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
