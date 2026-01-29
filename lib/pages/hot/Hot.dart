import 'package:flutter/material.dart';
import 'package:hey/components/common/BadgeIcon.dart';
import 'package:hey/components/common/CustomTabAppBar.dart';
import 'package:hey/components/hot/HotShell.dart';
import 'package:hey/constant/GlobalConstants.dart';
import 'package:hey/utils/MsgUtil.dart';

class Hot extends StatefulWidget {
  const Hot({super.key});

  @override
  State<Hot> createState() => _HotState();
}

class _HotState extends State<Hot> {
  late final List<IconActionItem> _rightIconItems;
  int _selectedTabIndex = 0;
  final _tabTitles = ["热点"];
  // 切换标签的回调
  void _onTabTap(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  void _onSearchTap() {
    MsgUtil.show("点击了【搜索图标】");
  }

  void _onMailTap() {
    MsgUtil.show("点击了【邮件图标】");
  }

  List<Widget> _buildContentPages() {
    return [
      const HotShell(),
    ];
  }

  @override
  void initState() {
    super.initState();
    _rightIconItems = [
      IconActionItem(
        icon: const Icon(
          Icons.search_outlined,
          size: GlobalConstants.topIconSize,
          color: Colors.black,
        ),
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
