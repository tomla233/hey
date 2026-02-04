//黑盒促销
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hey/mock/GameService.dart';
import 'package:hey/models/game/GameInfo.dart';
import 'package:hey/utils/MsgUtil.dart';

class BoxPromotion extends StatefulWidget {
  const BoxPromotion({super.key});

  @override
  State<BoxPromotion> createState() => _BoxPromotionState();
}

class _BoxPromotionState extends State<BoxPromotion> {
  void _onMoreTap() {
    MsgUtil.show('更多');
  }

  final List<GameInfo> _gameList = GameService().gameInfoList;
  final ScrollController _scrollController = ScrollController();

  double _overscroll = 0;
  bool _readyToTrigger = false;
  final double triggerDistance = 30;
  bool _triggerOnRelease = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (!_scrollController.hasClients) return;

      final position = _scrollController.position;
      final extra = position.pixels - position.maxScrollExtent;

      if (extra > 0) {
        setState(() {
          _overscroll = extra;
          _readyToTrigger = _overscroll >= triggerDistance;
        });
      } else {
        if (_overscroll != 0) {
          setState(() {
            _overscroll = 0;
            _readyToTrigger = false;
          });
        }
      }
    });
  }

  double get _arrowRotation {
    final progress = (_overscroll / triggerDistance).clamp(0.0, 1.0);
    return -progress * 3.1415926; // 0 → π
  }

  void _onTriggerMore() {
    MsgUtil.show('触发查看更多');
  }

  Widget _verticalText(String text) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: text.split('').map((char) {
        return Text(
          char,
          style: const TextStyle(fontSize: 10, color: Colors.black54),
        );
      }).toList(),
    );
  }

  Widget _buildPullMoreItem() {
    return SizedBox(
      width: 40,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Transform.rotate(
              angle: _arrowRotation,
              child: const Icon(
                Icons.arrow_back_ios_new,
                size: 12,
                color: Colors.black54,
              ),
            ),
            const SizedBox(width: 4),
            _verticalText(_readyToTrigger ? '松开查看' : '左滑更多'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //列之间的水平间距
    final double hSpacing = 14;
    double sizeBoxHeight = 190;
    double ContainerWidth = 130;
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
    //圆形背景的宽高
    final double circleHW = 74;
    //圆形背景距离顶部的高度
    final double circleTop = 20;
    //圆形背景中图片的高
    final double imgHeight = 50;
    //圆形背景中图片的宽
    final double imgWidth = 110;
    //圆形背景中图片距离顶部的高度
    final double imgTop = circleTop + (circleHW - imgHeight) / 2;
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
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is UserScrollNotification) {
                if (notification.direction == ScrollDirection.idle) {
                  //  松手瞬间
                  if (_triggerOnRelease) {
                    _onTriggerMore();
                  }
                  _triggerOnRelease = false;
                }
              }
              if (notification is ScrollUpdateNotification &&
                  notification.dragDetails != null) {
                _triggerOnRelease = _readyToTrigger;
              }

              return false;
            },
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: _gameList.length + 1,
              controller: _scrollController,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              separatorBuilder: (context, index) {
                if (index == _gameList.length - 1) {
                  return const SizedBox(width: 4);
                }
                return SizedBox(width: hSpacing);
              },
              itemBuilder: (context, index) {
                if (index == _gameList.length) {
                  return _buildPullMoreItem();
                }
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
                        top: circleTop,
                        child: Container(
                          width: circleHW,
                          height: circleHW,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFAFBFD),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: imgTop,
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: SizedBox(
                              width: imgWidth,
                              height: imgHeight,
                              child: Image.network(
                                _gameList[index].gameScreenshots[0],
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                        ),
                      ),
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
        ),
      ],
    );
  }
}
