import 'package:flutter/material.dart';
import 'package:hey/components/common/BadgeIcon.dart';
import 'package:hey/components/common/CustomTabAppBar.dart';
import 'package:hey/components/home/HomeAttention.dart';
import 'package:hey/components/home/HomeRecommend.dart';
import 'package:hey/constant/GlobalConstants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final List<IconActionItem> _rightIconItems;
  int _selectedTabIndex = 1;
  final _tabTitles = ["关注", "推荐"];
  // 切换标签的回调
  void _onTabTap(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  void _onSearchTap() {
    print("点击了【搜索图标】");
  }

  void _onMailTap() {
    print("点击了【邮件图标】");
  }

  List<Widget> _buildContentPages() {
    return [
      const HomeAttention(),
      const HomeRecommend(),
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
