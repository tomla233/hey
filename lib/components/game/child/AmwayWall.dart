//安利墙
import 'package:flutter/material.dart';
import 'package:hey/components/hot/CustomCarouselSlider.dart';
import 'package:hey/mock/GameService.dart';
import 'package:hey/models/game/GameInfo.dart';
import 'package:hey/models/hot/SliderInfo.dart';
import 'package:hey/utils/MsgUtil.dart';

class AmwayWall extends StatelessWidget {
  AmwayWall({super.key});

  void _onMoreTap() {
    MsgUtil.show('更多');
  }
  final List<SliderInfo> sliderList = GameService().sliderList.toList();
  final List<GameInfo> _gameList = GameService().gameInfoList.toList();
  final double cardHPadding = 10; // 卡片水平间距
  final double cardHeight = 280; // 卡片高度
  final double commonRadius = 8; // 圆角
  final double singleSideExpose = 30; // 单侧露边宽度

  /// 构建安利墙卡片
  Widget _buildAmwayWallCard(GameInfo gameInfo, double cardWidth) {
    final double imageHeight = cardHeight * 2 / 5;
    final double smallImageWidth = cardWidth / 4;

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: imageHeight,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(commonRadius),
                  child: Image.network(
                    gameInfo.gameScreenshots[0],
                    width: smallImageWidth,
                    height: imageHeight,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(commonRadius),
                    child: CustomCarouselSlider(
                      sliderList: sliderList,
                      showTitle: false,
                      autoPlay: false,
                    ),
                    // child: Image.network(
                    //   gameInfo.gameScreenshots[1],
                    //   width: double.infinity,
                    //   height: imageHeight,
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double cardWidth = screenWidth - singleSideExpose * 2;
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
          child: PageView.builder(
            itemCount: _gameList.length,
            scrollDirection: Axis.horizontal,
            padEnds: true,
            controller: PageController(
              initialPage: 2,
              viewportFraction: cardWidth / screenWidth,
            ),
            itemBuilder: (BuildContext context, int index) {
              GameInfo gameInfo = _gameList[index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: cardHPadding / 2),
                child: _buildAmwayWallCard(gameInfo, cardWidth),
              );
            },
          ),
        ),
      ],
    );
  }
}
