import 'package:flutter/material.dart';
import 'package:hey/pages/game/Game.dart';
import 'package:hey/pages/home/home.dart';
import 'package:hey/pages/hot/Hot.dart';
import 'package:hey/pages/mine/Mine.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  static const double _tabIconSize = 24.0;
  static const double _tabIconContainerSize = 40.0;
  static const double _tabPlusBtnContainerWidth = 40.0;
  static const double _tabPlusBtnContainerHeight = 30.0;
  static const double _tabFontSize = 10.0;
  static const double _plusBtnOffsetY = 12.0;

  final List<Map<String, dynamic>> tabList = [
    {
      "text": "首页",
      "icon": "lib/assets/tabIcon/home.png",
      "active_icon": "lib/assets/tabIcon/home_active.png",
      "pageIndex": 0,
    },
    {
      "text": "热点",
      "icon": "lib/assets/tabIcon/hot.png",
      "active_icon": "lib/assets/tabIcon/hot_active.png",
      "pageIndex": 1,
    },
    {"type": "add_button", "pageIndex": -1},
    {
      "text": "游戏库",
      "icon": "lib/assets/tabIcon/game_res.png",
      "active_icon": "lib/assets/tabIcon/game_res_active.png",
      "pageIndex": 2,
    },
    {
      "text": "我",
      "icon": "lib/assets/tabIcon/mine.png",
      "active_icon": "lib/assets/tabIcon/mine_active.png",
      "pageIndex": 3,
    },
  ];
  int _selectedTabIndex = 0;

  List<BottomNavigationBarItem> _getTabItems() {
    return List.generate(tabList.length, (int index) {
      if (tabList[index]["type"] == "add_button") {
        return BottomNavigationBarItem(
          icon: Transform.translate(
            offset: const Offset(0, _plusBtnOffsetY),
            child: Container(
              width: _tabPlusBtnContainerWidth,
              height: _tabPlusBtnContainerHeight,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xFF181D21), Color(0xFF43484C)],
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Icon(Icons.add, color: Colors.white, size: 24),
            ),
          ),
          label: "",
        );
      }
      return BottomNavigationBarItem(
        icon: Container(
          alignment: Alignment.center,
          width: _tabIconContainerSize,
          height: _tabIconContainerSize,
          child: Image.asset(
            tabList[index]["icon"]!,
            width: _tabIconSize,
            height: _tabIconSize,
          ),
        ),
        activeIcon: Container(
          alignment: Alignment.center,
          width: _tabIconContainerSize,
          height: _tabIconContainerSize,
          child: Image.asset(
            tabList[index]["active_icon"]!,
            width: _tabIconSize,
            height: _tabIconSize,
          ),
        ),
        label: tabList[index]["text"],
      );
    });
  }

  List<Widget> _getChildren() {
    return [const Home(), const Hot(), const Game(), const Mine()];
  }

  // 获取页面索引
  int _getPageIndex() {
    final tabItem = tabList[_selectedTabIndex];
    return tabItem["pageIndex"] == -1
        ? _selectedTabIndex
        : tabItem["pageIndex"]!;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: _getPageIndex(), children: _getChildren()),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: const Color(0xFF8C9195),
        showUnselectedLabels: true,
        selectedItemColor: const Color(0xFF14191C),
        selectedFontSize: _tabFontSize,
        unselectedFontSize: _tabFontSize,
        backgroundColor: const Color(0xFFF7F8FA),
        items: _getTabItems(),
        currentIndex: _selectedTabIndex,
        onTap: (index) {
          final item = tabList[index];
          if (item["type"] == "add_button") {
            Navigator.pushNamed(context, '/article').then((_) {
              setState(() {});
            });
            return;
          }
          setState(() {
            _selectedTabIndex = index;
          });
        },
      ),
    );
  }
}
