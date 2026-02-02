import 'package:flutter/material.dart';
import 'package:hey/components/hot/CustomCarouselSlider.dart';
import 'package:hey/mock/GameService.dart';
import 'package:hey/mock/HotService.dart';
import 'package:hey/models/game/GameInfo.dart';
import 'package:hey/models/hot/SliderInfo.dart';
import 'package:hey/utils/MsgUtil.dart';
import 'package:oktoast/oktoast.dart';

/// 游戏推荐
class GameRecommend extends StatefulWidget {
  const GameRecommend({super.key});

  @override
  State<GameRecommend> createState() => _GameRecommendState();
}

class _GameRecommendState extends State<GameRecommend> {
  final List<GameInfo> _gameList = GameService().gameInfoList;
  // 轮播图列表
  final List<SliderInfo> sliderList = HotService().sliderList;
  // 滚动控制器
  final ScrollController _scrollController = ScrollController();
  // 上拉加载状态
  bool _isLoading = false;
  // 下拉刷新
  Future<void> _onRefresh() async {
    await Future.delayed(
      const Duration(seconds: 2),
      () => {MsgUtil.show('已推荐10条新内容', position: ToastPosition.bottom)},
    );
  }

  // 加载更多
  void _loadMore() {
    if (_isLoading) return;
    setState(() {
      _isLoading = true;
    });
    MsgUtil.show('模拟上拉加载功能😁');
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    // 添加滚动监听
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        _loadMore();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildGameItem(GameInfo gameInfo) {
    return const Text('游戏推荐');
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: 1 + _gameList.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return CustomCarouselSlider(
              sliderList: sliderList,
              sliderHeight: 50,
              showTitle: false,
            );
          } else {
            GameInfo gameInfo = _gameList[index - 1];
            return _buildGameItem(gameInfo);
          }
        },
      ),
    );
  }
}
