//安利墙
import 'package:flutter/material.dart';
import 'package:hey/components/common/CollapsedTextWithGradient.dart';
import 'package:hey/components/common/CustomCarouselSlider.dart';
import 'package:hey/components/game/child/ScoreCard.dart';
import 'package:hey/components/game/child/StarRating.dart';
import 'package:hey/constant/ColorConstants.dart';
import 'package:hey/mock/GameService.dart';
import 'package:hey/models/game/GameComment.dart';
import 'package:hey/models/game/GameInfo.dart';
import 'package:hey/models/hot/SliderInfo.dart';
import 'package:hey/utils/MsgUtil.dart';

class AmwayWall extends StatefulWidget {
  const AmwayWall({super.key});

  @override
  State<AmwayWall> createState() => _AmwayWallState();
}

class _AmwayWallState extends State<AmwayWall> {
  int _currentPage = 2;
  final int _initialPage = 2;
  void _onMoreTap() {
    MsgUtil.show('更多');
  }

  final List<SliderInfo> sliderList = GameService().sliderList.toList();

  final List<GameInfo> _gameList = GameService().gameInfoList.toList();

  final double cardHPadding = 10;
  final double cardHeight = 280;
  final double commonRadius = 8;
  // 两侧分别露出宽度
  final double singleSideExpose = 30;

  ///点击全文事件
  void _onTapViewAllText(GameComment gameComment) {
    MsgUtil.show('点击了查看全文');
  }

  /// 构建安利墙卡片
  Widget _buildAmwayWallCard(GameInfo gameInfo, double cardWidth, int index) {
    final double imageHeight = cardHeight * 2 / 5;
    final double smallImageWidth = cardWidth / 4;
    final GameComment gameComment = gameInfo.gameComment!;
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
                      isActive: index == _currentPage,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: Column(
                          spacing: 2,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              gameComment.gameName,
                              style: const TextStyle(
                                color: Color(0xFF14191C),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Row(
                              spacing: 5,
                              children: [
                                const StarRating(rating: 5, starSize: 14),
                                CircleAvatar(
                                  radius: 6,
                                  backgroundImage: Image.network(
                                    gameComment.authorAvatar,
                                  ).image,
                                ),
                                Text(
                                  gameComment.authorName,
                                  style: const TextStyle(
                                    color: Color(0xFF8C9195),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    height: 1.2,
                                  ),
                                ),
                                Text(
                                  gameComment.playingTime,
                                  style: const TextStyle(
                                    color: Color(0xFF8C9195),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    height: 1.2,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    ScoreCard(
                      overallScore: gameComment.overallScore,
                      numbersOfScore: gameComment.numbersOfScore,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CollapsedTextWithGradient(
              text: gameComment.commentContent,

              onExpand: () => _onTapViewAllText(gameComment),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 2,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: const Color(0xFFF8F8FA),
                  ),
                  child: Text(
                    '${gameComment.ratioOfUseful}觉得有用 😃',
                    style: const TextStyle(
                      color: ColorConstants.primaryBlack,
                      fontSize: 10,
                      height: 1.2,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 2,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: const Color(0xFFF8F8FA),
                  ),
                  child: const Text(
                    '好玩奖 2025',
                    style: TextStyle(
                      color: ColorConstants.primaryBlack,
                      fontSize: 10,
                      height: 1.2,
                    ),
                  ),
                ),
              ],
            ),
          ),
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
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: _gameList.length,
            scrollDirection: Axis.horizontal,
            padEnds: true,
            controller: PageController(
              initialPage: _initialPage,
              viewportFraction: cardWidth / screenWidth,
            ),
            itemBuilder: (BuildContext context, int index) {
              GameInfo gameInfo = _gameList[index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: cardHPadding / 2),
                child: _buildAmwayWallCard(gameInfo, cardWidth, index),
              );
            },
          ),
        ),
      ],
    );
  }
}
