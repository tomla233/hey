//黑盒促销
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';
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
  final double triggerDistance = 15;
  bool _triggerOnRelease = false;

  // 记录列表项宽度和间距，用于计算滚动位置
  final double hSpacing = 14;
  final double containerWidth = 130;
  // 从该阈值开始旋转箭头，箭头完成180°旋转需额外的 `triggerDistance`
  final double rotationStart = 15;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (!_scrollController.hasClients) return;

      final position = _scrollController.position;
      final maxScroll = position.maxScrollExtent;
      final currentScroll = position.pixels;
      final extra = currentScroll - maxScroll;

      // 只有当滚动到最底部（maxScroll）之后继续滑动，才计算overscroll
      if (extra > 0) {
        setState(() {
          _overscroll = extra;
          // 只有在箭头完成180°旋转后才准备触发更多（rotationStart + triggerDistance）
          _readyToTrigger = _overscroll >= (rotationStart + triggerDistance);
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
    // 从 rotationStart 开始旋转，旋转完成需额外的 triggerDistance
    if (_overscroll < rotationStart) {
      return 0;
    }
    final progress = ((_overscroll - rotationStart) / triggerDistance).clamp(
      0.0,
      1.0,
    );
    return -progress * 3.1415926; // 0 → π (-180deg)
  }

  void _onTriggerMore() {
    MsgUtil.show('触发查看更多');
    context.push('/article').then((_) {
      setState(() {});
    });
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
    // 计算显示进度（0-1），控制组件从右侧滑入
    final showProgress = (_overscroll / rotationStart).clamp(0.0, 1.0);

    // 完全隐藏时偏移到屏幕右侧，显示时逐渐向左移动
    final offsetX = rotationStart * (1 - showProgress);

    return Transform.translate(
      offset: Offset(offsetX, 0),
      child: Opacity(
        opacity: showProgress,
        child: SizedBox(
          width: 36,
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
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double sizeBoxHeight = 190;
    final double dividerY = sizeBoxHeight * 3 / 5;
    final Color borderColor = const Color(0xFFF4F4F5);
    final double couponTagHeight = 18;
    final double couponTagWidth = containerWidth * 1 / 3;
    final double couponTagTop = dividerY - couponTagHeight + 4;
    final double marginHorizontal = 10;
    final double gameNameTop = couponTagTop + couponTagHeight + 4;
    final double gameNameWidth = containerWidth - marginHorizontal * 2;
    final double circleHW = 74;
    final double circleTop = 20;
    final double imgHeight = 50;
    final double imgWidth = 110;
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
          // 使用Stack将提示组件叠加在列表右侧
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 18),
                child: NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if (notification is UserScrollNotification) {
                      if (notification.direction == ScrollDirection.idle) {
                        if (_triggerOnRelease) {
                          print('trigger on release');
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
                    itemCount: _gameList.length,
                    controller: _scrollController,
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    separatorBuilder: (context, index) {
                      return SizedBox(width: hSpacing);
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        width: containerWidth,
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
                                      crossAxisAlignment: CrossAxisAlignment.end,
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
              // 将提示组件放在Stack中，叠加在列表右侧
              _buildPullMoreItem(),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
