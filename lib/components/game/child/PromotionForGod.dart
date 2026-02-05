//促销神作
import 'package:flutter/material.dart';
import 'package:hey/components/common/PriceTag.dart';
import 'package:hey/mock/GameService.dart';
import 'package:hey/models/game/GameInfo.dart';
import 'package:hey/utils/MsgUtil.dart';

class PromotionForGod extends StatelessWidget {
  PromotionForGod({super.key});
  void _onMoreTap() {
    MsgUtil.show('更多');
  }

  final List<GameInfo> _gameList = GameService().gameInfoList.toList();
  //单个条目宽度
  final double itemWidth = 200.0;
  //单个条目高度
  final double itemHeight = 280.0;
  //文字和标签距离左侧
  final double leftWidth = 10.0;
  //遮罩层高度
  final double overlayHeight = 140.0;
  //游戏名称距离底部的高度
  final double nameBottomHeight = 70.0;
  //促销标签距离底部的高度
  final double promoTagHeight = 44.0;
  //分类标签距离底部的高度
  final double categoryTagHeight = 34.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '促销神作',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
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
                  Icon(Icons.arrow_forward_ios_sharp, size: 14),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: itemHeight,
          child: ListView.separated(
            itemCount: _gameList.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 10);
            },
            itemBuilder: (BuildContext context, int index) {
              GameInfo gameInfo = _gameList[index];
              return Container(
                decoration: BoxDecoration(
                  border: BoxBorder.all(
                    color: const Color(0xFFE5E7EB),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                width: itemWidth,
                height: itemHeight,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        gameInfo.gameScreenshots[0],
                        width: itemWidth,
                        height: itemHeight,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(8.0),
                          topLeft: Radius.circular(8.0),
                        ),
                        child: Container(
                          color: const Color(0xFF009015),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4.0,
                            vertical: 4,
                          ),
                          child: const Text(
                            '折扣剩余7天',
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    //  遮罩层
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      height: overlayHeight,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withValues(alpha: 0),
                              Colors.black.withValues(alpha: 102),
                            ],
                          ),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: nameBottomHeight,
                      left: leftWidth,
                      child: Text(
                        gameInfo.gameChineseName,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Positioned(
                      left: leftWidth,
                      bottom: promoTagHeight,
                      child: PriceTag(
                        gamePrice: gameInfo.gamePrice,
                        tags: gameInfo.priceRightTags,
                        dimBackground: true,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
