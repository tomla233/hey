//销量榜
import 'package:flutter/material.dart';
import 'package:hey/components/common/AttentionTag.dart';
import 'package:hey/components/common/CustomDivider.dart';
import 'package:hey/components/common/PriceTag.dart';
import 'package:hey/constant/ColorConstants.dart';
import 'package:hey/mock/GameService.dart';
import 'package:hey/models/game/GameInfo.dart';
import 'package:hey/utils/MsgUtil.dart';

class SalesRanking extends StatefulWidget {
  const SalesRanking({super.key});

  @override
  State<SalesRanking> createState() => _SalesRankingState();
}

class _SalesRankingState extends State<SalesRanking>
    with SingleTickerProviderStateMixin {
  final List<String> _rankTypeList = ['销量榜', '最受欢迎榜', '最受期待榜'];
  final List<GameInfo> _gameList = GameService().gameInfoList.take(4).toList();

  late TabController _tabController;
  // 单个条目水平内边距
  final double itemHPadding = 16.0;
  //图片高度
  final double imageHeight = 60.0;
  //图片宽度
  final double imageWidth = 130.0;

  // TabBar固定高度,约48px
  final double tabBarHeight = kToolbarHeight / 1.2;
  // TabBar和内容区的固定间距
  final double tabContentSpacing = 10.0;
  // 单条目总高度
  final double singleGameItemTotalHeight = 80.0;
  // 动态内容高度
  double get dynamicContentHeight =>
      _gameList.length * singleGameItemTotalHeight;
  // 最终总高度
  double get totalHeight {
    double calculatedHeight =
        tabBarHeight + tabContentSpacing + dynamicContentHeight;
    // 安全余量
    calculatedHeight += 10.0;
    double minHeight = MediaQuery.of(context).size.height / 4;
    double maxHeight = MediaQuery.of(context).size.height / 2;
    return calculatedHeight.clamp(minHeight, maxHeight);
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _rankTypeList.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onMoreTap() {
    MsgUtil.show('更多');
  }

  /// 构建排行榜内容卡片
  Widget _buildRankCard(String rankType) {
    return Column(
      // 禁止Column无限延伸
      mainAxisSize: MainAxisSize.min,
      children: _gameList.map((game) {
        return Container(
          height: singleGameItemTotalHeight,
          padding: EdgeInsets.only(left: itemHPadding, right: itemHPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: imageWidth,
                      height: imageHeight,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4.0),
                        child: Image.network(
                          game.gameScreenshots[0],
                          width: double.infinity, // 撑满外层SizedBox宽度
                          height: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: double.infinity, // 撑满外层SizedBox宽度
                              height: double.infinity,
                              color: Colors.grey,
                              child: const Icon(
                                Icons.image_not_supported,
                                size: 20,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        mainAxisAlignment:
                            MainAxisAlignment.center, 
                        children: [
                          Text(
                            game.gameChineseName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PriceTag(
                                gamePrice: game.gamePrice,
                              ),
                              const AttentionTag(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const CustomDivider(thickness: 1),
            ],
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: totalHeight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //tabBar区域
              SizedBox(
                width: MediaQuery.of(context).size.width - 80,
                child: TabBar(
                  controller: _tabController,
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  labelColor: ColorConstants.primaryBlack,
                  dividerColor: Colors.transparent,
                  unselectedLabelColor: ColorConstants.primaryGray,
                  indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(
                      color: ColorConstants.primaryBlack,
                      width: 2,
                    ),
                  ),
                  tabs: _rankTypeList.map((c) => Tab(text: c)).toList(),
                ),
              ),
              GestureDetector(
                onTap: _onMoreTap,
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '更多',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
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
          SizedBox(height: tabContentSpacing),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: _rankTypeList.map((rankType) {
                return _buildRankCard(rankType);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
