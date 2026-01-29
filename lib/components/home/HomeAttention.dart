import 'package:flutter/material.dart';
import 'package:hey/components/common/CustomDivider.dart';
import 'package:hey/components/home/PostItem.dart';
import 'package:hey/constant/ColorConstants.dart';
import 'package:hey/mock/PostService.dart';
import 'package:hey/models/home/AttentionUserInfo.dart';
import 'package:hey/models/home/PostBase.dart';
import 'package:hey/utils/MsgUtil.dart';
import 'package:hey/utils/ToastUtils.dart';

class HomeAttention extends StatefulWidget {
  const HomeAttention({super.key});

  @override
  State<HomeAttention> createState() => _HomeAttentionState();
}

class _HomeAttentionState extends State<HomeAttention> {
  final List<PostBase> _postList = PostService().attentionPostList;
  //关注列表
  final List<AttentionUserInfo> _attentionUserList =
      PostService().attentionUserList;
  // 滚动控制器
  final ScrollController _scrollController = ScrollController();
  // 上拉加载状态
  bool _isLoading = false;
  // 下拉刷新
  Future<void> _onRefresh() async {
    await Future.delayed(
      const Duration(seconds: 2),
      () => {
        if (mounted) {ToastUtils.showToast(context, '已推荐10条新内容')},
      },
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

  void _onTapAttentionUser(String name) {
    MsgUtil.show('点击了关注的人$name');
  }

  Widget _buildAttentionList() {
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(top: 16),
            itemCount: _attentionUserList.length,
            itemBuilder: (context, index) {
              AttentionUserInfo attentionUserInfo = _attentionUserList[index];
              bool newMessage = attentionUserInfo.newMessage;
              return GestureDetector(
                onTap: () => _onTapAttentionUser(attentionUserInfo.name),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          margin: const EdgeInsets.symmetric(horizontal: 14),
                          child: CircleAvatar(
                            radius: 48,
                            backgroundImage: Image.network(
                              attentionUserInfo.picture,
                            ).image,
                          ),
                        ),
                        if (newMessage)
                          Container(
                            width: 10,
                            height: 10,
                            margin: const EdgeInsets.only(right: 18, top: 2),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      attentionUserInfo.name,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color(0xFF64696D),
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

  Widget _buildPostItem(PostBase postBase) {
    return PostItem(postBase: postBase);
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

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: 1 + _postList.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildAttentionList();
          } else {
            PostBase postBase = _postList[index - 1];
            return _buildPostItem(postBase);
          }
        },
      ),
    );
  }
}
