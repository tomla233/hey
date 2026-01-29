import 'package:flutter/material.dart';
import 'package:hey/components/hot/HotContent.dart';
import 'package:hey/constant/ColorConstants.dart';

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
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _hotCategories.length, vsync: this);
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
                  labelColor: ColorConstants.primaryBlack,
                  dividerColor: Colors.transparent,
                  unselectedLabelColor: ColorConstants.primaryGray,
                  indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(
                      color: ColorConstants.primaryBlack,
                      width: 2,
                    ),
                  ),
                  tabs: _hotCategories.map((c) => Tab(text: c)).toList(),
                ),
              ),
              //抽屉icon
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: IconButton(
                  color: ColorConstants.primaryGray,
                  icon: const Icon(Icons.menu),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    print('点击了【抽屉图标】');
                  },
                ),
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
