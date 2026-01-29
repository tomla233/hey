import 'package:flutter/material.dart';
import 'package:hey/components/hot/CustomCarouselSlider.dart';
import 'package:hey/components/hot/HotPostItem.dart';
import 'package:hey/mock/HotService.dart';
import 'package:hey/mock/PostService.dart';
import 'package:hey/models/home/PostBase.dart';
import 'package:hey/models/hot/SliderInfo.dart';
import 'package:hey/utils/MsgUtil.dart';
import 'package:oktoast/oktoast.dart';

class HotContent extends StatefulWidget {
  // 接收当前选中的分类
  final String currentCategory;
  const HotContent({super.key, required this.currentCategory});

  @override
  State<HotContent> createState() => _HotContentState();
}

class _HotContentState extends State<HotContent> {
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

  //构建可下拉刷新的容器
  Widget _buildRefreshContainer(Widget content) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: content,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (widget.currentCategory == '全部') {
      content = _buildAllContent();
    } else if (widget.currentCategory == '热榜') {
      content = _buildHotContent();
    } else {
      content = _buildNormalContent(widget.currentCategory);
    }
    return _buildRefreshContainer(content);
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

  Widget _buildAllContent() {
    final List<SliderInfo> sliderList = HotService().sliderList;
    return Column(
      children: [
        CustomCarouselSlider(sliderList: sliderList),
        ListView.builder(
          //收缩包裹内容
          shrinkWrap: true,
          //禁用自身滚动
          physics: const NeverScrollableScrollPhysics(),
          controller: _scrollController,
          itemCount: _postList.length,
          itemBuilder: (context, index) {
            PostBase postBase = _postList[index];
            return HotPostItem(postBase: postBase,category: widget.currentCategory,);
          },
        ),
      ],
    );
  }

  Widget _buildHotContent() {
    final List<SliderInfo> sliderList = HotService().sliderList;
    return Column(
      children: [
        ListView.builder(
          //收缩包裹内容
          shrinkWrap: true,
          //禁用自身滚动
          physics: const NeverScrollableScrollPhysics(),
          controller: _scrollController,
          itemCount: _postList.length,
          itemBuilder: (context, index) {
            PostBase postBase = _postList[index];
            return HotPostItem(postBase: postBase,category: widget.currentCategory,);
          },
        ),
      ],
    );
  }

  Widget _buildNormalContent(String category) {
    return Center(child: Text("普通分类内容$category"));
  }
}
