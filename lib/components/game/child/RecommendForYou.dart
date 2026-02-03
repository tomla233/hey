import 'package:flutter/material.dart';
import 'package:hey/components/common/PriceTag.dart';
import 'package:hey/mock/GameService.dart';
import 'package:hey/models/game/GameInfo.dart';
import 'package:hey/utils/MsgUtil.dart';

/// 为你推荐
class RecommendForYou extends StatelessWidget {
  RecommendForYou({super.key});
  void _onMoreTap() {
    MsgUtil.show('更多');
  }

  void _onCardTap(GameInfo gameInfo) {
    MsgUtil.show(gameInfo.gameChineseName);
  }

  final List<GameInfo> gameInfoList = GameService().gameInfoList;
  @override
  Widget build(BuildContext context) {
    // 统一上左右padding
    final double hPadding = 10;
    //列之间的水平间距
    final double hSpacing = 6;
    // 计算每个卡片的宽度
    final double screenWidth = MediaQuery.of(context).size.width;
    final double cardWidth = (screenWidth - hPadding * 2 - hSpacing * 1) / 2;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '为你推荐',
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
        Wrap(
          spacing: hSpacing,
          runSpacing: 10,
          children: gameInfoList.map((item) {
            return GestureDetector(
              onTap: () => _onCardTap(item),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      item.gameScreenshots.take(1).first,
                      fit: BoxFit.cover,
                      width: cardWidth,
                      height: cardWidth * 0.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.gameChineseName,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  PriceTag(
                    gamePrice: item.gamePrice,
                    isDiscountPrice: item.isDiscountPrice,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF3F4F8),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 2,
                        ),
                        child: Text(
                          item.outFirstTag,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        item.gameTags[0],
                        style: const TextStyle(
                          color: Color(0xFF8D9194),
                          fontSize: 10,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        '|',
                        style: TextStyle(
                          color: Color(0xFF8D9194),
                          fontSize: 10,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        item.gameTags[1],
                        style: const TextStyle(
                          color: Color(0xFF8D9194),
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
