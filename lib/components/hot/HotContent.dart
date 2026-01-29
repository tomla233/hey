import 'package:flutter/material.dart';

class HotContent extends StatefulWidget {
  // 接收当前选中的分类
  final String currentCategory;
  const HotContent({super.key, required this.currentCategory});

  @override
  State<HotContent> createState() => _HotContentState();
}

class _HotContentState extends State<HotContent> {
  @override
  Widget build(BuildContext context) {
    if (widget.currentCategory == '全部') {
      return _buildAllContent();
    } else if (widget.currentCategory == '热榜') {
      return _buildHotContent();
    } else {
      return _buildNormalContent(widget.currentCategory);
    }
  }

  Widget _buildAllContent() {
    return const Center(child: Text("全部内容"));
  }

  Widget _buildHotContent() {
    return const Center(child: Text("热榜内容"));
  }

  Widget _buildNormalContent(String category) {
    return Center(child: Text("普通分类内容$category"));
  }
}
