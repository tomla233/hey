import 'package:flutter/material.dart';
import 'package:hey/constant/ColorConstants.dart';
import 'package:hey/mock/PostService.dart';
import 'package:hey/models/home/AttentionUserInfo.dart';
import 'package:hey/models/home/PostBase.dart';
import 'package:hey/utils/ToastUtils.dart';

class HomeAttention extends StatefulWidget {
  const HomeAttention({super.key});

  @override
  State<HomeAttention> createState() => _HomeAttentionState();
}

class _HomeAttentionState extends State<HomeAttention> {
  final List<PostBase> _postList = PostService().postList;
  //关注列表
  final List<AttentionUserInfo> _attentionUserList =
      PostService().attentionUserList;
  // 下拉刷新
  Future<void> _onRefresh() async {
    await Future.delayed(
      const Duration(seconds: 2),
      () => {
        if (mounted) {ToastUtils.showToast(context, '已推荐10条新内容')},
      },
    );
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
              return Column(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: CircleAvatar(
                      backgroundImage: Image.network(
                        attentionUserInfo.picture,
                      ).image,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    attentionUserInfo.name,
                    style: const TextStyle(
                      fontSize: 10,
                      color: ColorConstants.primaryBlack,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Divider(
            height: 1,
            thickness: 4,
            color: ColorConstants.dividerColor,
          ),
        ),
      ],
    );
  }

  Widget _buildPostItem(PostBase postBase) {
    return const Placeholder();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView.builder(
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
