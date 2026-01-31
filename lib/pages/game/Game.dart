import 'package:flutter/material.dart';
import 'package:hey/components/common/BadgeIcon.dart';
import 'package:hey/components/common/CustomTabAppBar.dart';
import 'package:hey/components/game/GameRank.dart';
import 'package:hey/components/game/GameRecommend.dart';
import 'package:hey/constant/GlobalConstants.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  late final List<IconActionItem> _rightIconItems;
  late PageController _pageController;
  int _selectedTabIndex = 0;
  final _tabTitles = ["推荐", "榜单"];
  // 切换标签的回调
  void _onTabTap(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
    // 滑动到对应的页面
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void _onSearchTap() {
    print("点击了【搜索图标】");
  }

  void _onMailTap() {
    print("点击了【邮件图标】");
  }

  List<Widget> _buildContentPages() {
    return [const GameRecommend(), const GameRank()];
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedTabIndex);
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
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedTabIndex = index;
          });
        },
        children: _buildContentPages(),
      ),
    );
  }
}
