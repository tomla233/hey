//销量榜
import 'package:flutter/material.dart';
import 'package:hey/components/common/CustomDivider.dart';
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
  final List<GameInfo> _gameList = GameService().gameInfoList;

  late TabController _tabController;
  final totalHeight = 400.0;
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
      children: _gameList.map((game) {
        return SizedBox(
          height: 40,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Row(children: [Text('data')]),
              ),
              CustomDivider(thickness: 1),
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
                  tabs: _rankTypeList
                      .map(
                        (c) => Tab(text: c),
                      )
                      .toList(),
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
          const SizedBox(height: 10),
          Flexible(
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
