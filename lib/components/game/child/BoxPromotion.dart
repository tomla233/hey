//黑盒促销
import 'package:flutter/material.dart';
import 'package:hey/mock/GameService.dart';
import 'package:hey/models/game/GameInfo.dart';
import 'package:hey/utils/MsgUtil.dart';

class BoxPromotion extends StatelessWidget {
  BoxPromotion({super.key});
  void _onMoreTap() {
    MsgUtil.show('更多');
  }

  final List<GameInfo> _gameList = GameService().gameInfoList;
  @override
  Widget build(BuildContext context) {
    //列之间的水平间距
    final double hSpacing = 14;
    double sizeBoxHeight = 180;
    double ContainerWidth = 140;
    final double dividerY = sizeBoxHeight * 3 / 5;
    final Color borderColor = const Color(0xFFF4F4F5);
    //领券9折标签的高度
    final double couponTagHeight = 18;
    //领券9折标签的宽度
    final double couponTagWidth = ContainerWidth * 1 / 3;
    ////领券9折标签距离父容器顶部的距离
    final double couponTagTop = dividerY - couponTagHeight + 4;
    //内部margin
    final double marginHorizontal = 10;
    //游戏名称、价格区域距离顶部的距离
    final double gameNameTop = couponTagTop + couponTagHeight + 4;
    //游戏名称、价格区域宽度
    final double gameNameWidth = ContainerWidth - marginHorizontal * 2;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '黑盒热销',
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
        SizedBox(
          height: sizeBoxHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: _gameList.length,
            separatorBuilder: (context, index) => SizedBox(width: hSpacing),
            itemBuilder: (context, index) {
              return Container(
                width: ContainerWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: borderColor, width: 0.8),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      right: 0,
                      top: dividerY,
                      child: Container(height: 0.5, color: borderColor),
                    ),
                    Positioned(
                      top: couponTagTop,
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: marginHorizontal,
                        ),
                        height: couponTagHeight,
                        width: couponTagWidth,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF69E34),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: const Center(
                          child: Text(
                            '领券9折',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: gameNameTop,
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: marginHorizontal,
                        ),
                        padding: const EdgeInsets.only(right: 10),
                        width: gameNameWidth,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${_gameList[index].gameChineseName},-${_gameList[index].gameDesc}',
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Row(
                              spacing: 3,
                              children: [
                                const Text(
                                  '￥',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.end,
                                ),
                                Text(
                                  _gameList[index].gamePrice,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black,
                                  ),
                                ),
                                const Text(
                                  '券后价',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    height: 1.4,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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
