import 'package:flutter/material.dart';
import 'package:hey/components/hot/HotContent.dart';

class HotShell extends StatefulWidget {
  const HotShell({super.key});

  @override
  State<HotShell> createState() => _HotShellState();
}

class _HotShellState extends State<HotShell>
    with SingleTickerProviderStateMixin {
  final List<String> _hotCategories = [
    '全部',
    '热榜',
    'CS2',
    'PC游戏',
    '千恋 * 万花',
    'Gal游戏综合区',
    'Steam',
    '刀塔2',
    '极限国度',
  ];
  late TabController _tabController;
  String _currentCategory = '全部';
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _hotCategories.length, vsync: this);
    // 监听tab切换事件
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {
          _currentCategory = _hotCategories[_tabController.index];
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          height: 50,
          child: Row(
            children: [
              //tabBar区域
              Expanded(
                child: TabBar(
                  controller: _tabController,
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  labelColor: Colors.red,
                  unselectedLabelColor: Colors.grey,
                  indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                  tabs: _hotCategories.map((c) => Tab(text: c)).toList(),
                ),
              ),
              //抽屉icon
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: const EndDrawerButton(),
              ),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: _hotCategories.map((category) {
              return HotContent(currentCategory: category);
            }).toList(),
          ),
        ),
      ],
    );
  }
}
