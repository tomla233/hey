//促销神作
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hey/components/common/PriceTag.dart';
import 'package:hey/mock/GameService.dart';
import 'package:hey/models/game/GameInfo.dart';
import 'package:hey/utils/MsgUtil.dart';

class PromotionForGod extends StatefulWidget {
  const PromotionForGod({super.key});

  @override
  State<PromotionForGod> createState() => _PromotionForGodState();
}

class _PromotionForGodState extends State<PromotionForGod> {
  void _onMoreTap() {
    MsgUtil.show('更多');
  }

  // 标记是否正在执行吸附动画
  bool _isAnimating = false;

  // 滚动控制器
  late ScrollController _scrollController;

  final List<GameInfo> _gameList = GameService().gameInfoList.toList();

  //单个条目宽度
  final double itemWidth = 200.0;

  //单个条目高度
  final double itemHeight = 280.0;

  //文字和标签距离左侧
  final double leftWidth = 10.0;

  //遮罩层高度
  final double overlayHeight = 190;

  //游戏名称距离底部的高度
  final double nameBottomHeight = 70.0;

  //促销标签距离底部的高度
  final double promoTagHeight = 44.0;

  //分类标签距离底部的高度
  final double categoryTagHeight = 22.0;

  //条目间距
  final double itemSpacing = 10.0;

  //卡片总宽度（宽度+间距）
  double get itemTotalWidth => itemWidth + itemSpacing;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  /// 吸附逻辑
  void _handleSnapToItem() {
    if (_isAnimating) return;

    double currentOffset = _scrollController.offset;
    int currentIndex = (currentOffset / itemTotalWidth).floor();
    double centerOffset = currentIndex * itemTotalWidth + itemWidth / 2;
    double screenLeftEdgeOffset = currentOffset;

    int targetIndex;
    if (centerOffset <= screenLeftEdgeOffset) {
      targetIndex = currentIndex + 1;
    } else {
      targetIndex = currentIndex;
    }
    // 边界处理
    targetIndex = targetIndex.clamp(0, _gameList.length - 1);
    double targetOffset = targetIndex * itemTotalWidth;
    // 执行平滑滚动
    _isAnimating = true;
    _scrollController
        .animateTo(
          targetOffset,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        )
        .whenComplete(() {
          // 动画结束后重置标记
          _isAnimating = false;
        });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
          child: NotificationListener<ScrollEndNotification>(
            onNotification: (notification) {
              // 只处理用户手动滚动结束的事件（忽略程序触发的滚动）
              if (notification.dragDetails != null) {
                // 添加帧后回调，确保等当前帧渲染完成、滚动位置完全稳定后，再执行吸附逻辑
                SchedulerBinding.instance.addPostFrameCallback((_) {
                  _handleSnapToItem();
                });
              }
              // return true 表示不需要再向上传递给父组件
              return true;
            },
            child: ListView.separated(
              controller: _scrollController,
              //回弹物理效果
              physics: const BouncingScrollPhysics(),
              itemCount: _gameList.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: itemSpacing);
              },
              itemBuilder: (BuildContext context, int index) {
                GameInfo gameInfo = _gameList[index];
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(
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
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                              ),
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
                                Colors.black.withValues(alpha: 30),
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
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
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
                      Positioned(
                        left: leftWidth,
                        bottom: categoryTagHeight,
                        child: Row(
                          children: gameInfo.gameTags
                              .asMap()
                              .entries
                              .map((entry) {
                                int index = entry.key;
                                String tag = entry.value;
                                List<Widget> widgets = [
                                  Text(
                                    tag,
                                    style: const TextStyle(
                                      fontSize: 8,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ];
                                if (index < gameInfo.gameTags.length - 1) {
                                  widgets.add(
                                    const Text(
                                      ' | ',
                                      style: TextStyle(
                                        fontSize: 8,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  );
                                }
                                return Row(children: widgets);
                              })
                              .expand((widget) => [widget])
                              .toList(),
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
