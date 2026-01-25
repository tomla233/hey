import 'package:flutter/material.dart';
import 'package:hey/components/common/BadgeIcon.dart';
import 'package:hey/components/common/CustomTabAppBar.dart';
import 'package:hey/constant/GlobalConstants.dart';

class Mine extends StatefulWidget {
  const Mine({super.key});

  @override
  State<Mine> createState() => _MineState();
}

class _MineState extends State<Mine> {
  late final List<IconActionItem> _rightIconItems;
  int _selectedTabIndex = 0;
  final _tabTitles = ["数据", "动态"];
  // 切换标签的回调
  void _onTabTap(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  void _onSearchTap() {
    print("点击了【搜索图标】");
  }

  void _onShareTap() {
    print("点击了【分享图标】");
  }

  void _onMailTap() {
    print("点击了【邮件图标】");
  }

  List<Widget> _buildContentPages() {
    return [
      const Center(child: Text("数据页面内容", style: TextStyle(fontSize: 20))),
      const Center(child: Text("动态页面内容", style: TextStyle(fontSize: 20))),
    ];
  }

  @override
  void initState() {
    super.initState();
    _rightIconItems = [
      IconActionItem(
        icon: const Icon(Icons.search_outlined, size: GlobalConstants.topIconSize, color: Colors.black),
        onTap: _onSearchTap,
      ),
      IconActionItem(
        icon: const Icon(
          Icons.file_upload_outlined,
          size: GlobalConstants.topIconSize,
          color: Colors.black,
        ),
        onTap: _onShareTap,
      ),
      IconActionItem(
        icon: const BadgeIcon(icon: Icons.email_outlined, showBadge: true),
        onTap: _onMailTap,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTabAppBar(
        tabTitles: _tabTitles,
        selectedTabIndex: _selectedTabIndex,
        onTabTap: _onTabTap,
        rightIconItems: _rightIconItems,
      ),
      body: IndexedStack(
        index: _selectedTabIndex,
        children: _buildContentPages(),
      ),
    );
  }
}
