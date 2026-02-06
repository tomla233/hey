//安利墙
import 'package:flutter/material.dart';
import 'package:hey/mock/GameService.dart';
import 'package:hey/models/game/GameInfo.dart';
import 'package:hey/utils/MsgUtil.dart';

class AmwayWall extends StatefulWidget {
  const AmwayWall({super.key});

  @override
  State<AmwayWall> createState() => _AmwayWallState();
}

class _AmwayWallState extends State<AmwayWall> {
  void _onMoreTap() {
    MsgUtil.show('更多');
  }

  final List<GameInfo> _gameList = GameService().gameInfoList.toList();
  //卡片水平padding
  final double cardHPadding = 10;
  //卡片的宽度=屏幕宽度-卡片padding*2-左右两侧凸出内容宽度
  late final double cardWidth =
      MediaQuery.of(context).size.width - cardHPadding * 2 - 80;
  //卡片高度
  final double cardHeight = 240;
  //卡片顶部图片高度
  late final double imageHeight = cardHeight * 2 / 5;
  //小图片宽度
  late final double smallImageWidth = cardWidth / 4;
  //外部容器以及图片圆角
  final double commonRadius = 8;

  ///构建安利墙卡片
  Widget _buildAmwayWallCard(GameInfo gameInfo) {
    return Container(
      height: cardHeight,
      width: cardWidth,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[100]!,
            blurRadius: commonRadius,
            offset: const Offset(0, 2),
            spreadRadius: 0.5,
          ),
        ],
        borderRadius: BorderRadius.circular(commonRadius),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '安利墙',
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
        SizedBox(
          height: cardHeight,
          child: ListView.separated(
            itemCount: _gameList.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: cardHPadding);
            },
            itemBuilder: (BuildContext context, int index) {
              GameInfo gameInfo = _gameList[index];
              return _buildAmwayWallCard(gameInfo);
            },
          ),
        ),
      ],
    );
  }
}
