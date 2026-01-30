import 'package:flutter/material.dart';
import 'package:hey/components/common/CustomDivider.dart';
import 'package:hey/components/home/PostItem.dart';
import 'package:hey/constant/ColorConstants.dart';
import 'package:hey/mock/PostService.dart';
import 'package:hey/models/home/CommunityInfo.dart';
import 'package:hey/models/home/PostBase.dart';
import 'package:hey/utils/MsgUtil.dart';
import 'package:oktoast/oktoast.dart';

class HomeRecommend extends StatefulWidget {
  const HomeRecommend({super.key});

  @override
  State<HomeRecommend> createState() => _HomeRecommendState();
}

class _HomeRecommendState extends State<HomeRecommend> {
  final List<CommunityInfo> _gameList = PostService().gameList;
  final List<PostBase> _postList = PostService().postList;
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

  Widget _buildPostItem(PostBase postBase) {
    return PostItem(postBase: postBase);
  }

  void _onTapAll() {
    MsgUtil.show('点击了全部');
  }

  void _onTapItem(String name) {
    MsgUtil.show('点击了$name');
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

  Widget _buildGameCardList() {
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(top: 16),
            itemCount: _gameList.length,
            itemBuilder: (context, index) {
              //index为0时，显示全部
              if (index == 0) {
                return GestureDetector(
                  onTap: _onTapAll,
                  child: Column(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        margin: const EdgeInsets.symmetric(horizontal: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(
                            'lib/assets/all.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        _gameList[index].communityName,
                        style: const TextStyle(
                          fontSize: 10,
                          color: ColorConstants.primaryBlack,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return GestureDetector(
                onTap: () => _onTapItem(_gameList[index].communityName),
                child: Column(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      margin: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                          _gameList[index].picture,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'lib/assets/box.png',
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            );
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return Image.asset(
                                'lib/assets/box.png',
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                              );
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      _gameList[index].communityName,
                      style: const TextStyle(
                        fontSize: 10,
                        color: ColorConstants.primaryBlack,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: CustomDivider(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: 1 + _postList.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildGameCardList();
          } else {
            PostBase postBase = _postList[index - 1];
            return _buildPostItem(postBase);
          }
        },
      ),
    );
  }
}
