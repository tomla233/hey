import 'package:flutter/material.dart';
import 'package:hey/components/hot/CustomCarouselSlider.dart';
import 'package:hey/mock/HotService.dart';
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

  Widget _buildAllContent() {
    final List<SliderInfo> sliderList = HotService().sliderList;
    return Column(
      children: [
        CustomCarouselSlider(sliderList: sliderList),
        const SizedBox(height: 10,)
      ],
    );
  }

  Widget _buildHotContent() {
    return const Center(child: Text("热榜内容"));
  }

  Widget _buildNormalContent(String category) {
    return Center(child: Text("普通分类内容$category"));
  }
}
