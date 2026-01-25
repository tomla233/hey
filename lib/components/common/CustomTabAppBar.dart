import 'package:flutter/material.dart';
import 'package:hey/constant/ColorConstants.dart';

class CustomTabAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<String> tabTitles;
  final int selectedTabIndex;

  /// 标签切换回调
  final Function(int) onTabTap;

  /// 右侧图标列表
  final List<IconActionItem> rightIconItems;

  /// 顶部栏背景色
  final Color backgroundColor = Colors.white;

  /// 标签激活态颜色
  final Color activeTabColor = ColorConstants.primaryBlack;

  /// 标签未激活态颜色
  final Color inactiveTabColor = ColorConstants.primaryGray;

  /// 分割线颜色
  final Color dividerColor = ColorConstants.primaryGray;

  // 固定AppBar高度
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  const CustomTabAppBar({
    super.key,
    required this.tabTitles,
    required this.selectedTabIndex,
    required this.onTabTap,
    required this.rightIconItems,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: backgroundColor,
          height: preferredSize.height,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 左侧标签区域
              Row(
                children: List.generate(tabTitles.length, (index) {
                  final isSelected = selectedTabIndex == index;
                  return GestureDetector(
                    onTap: () => onTabTap(index),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      margin: EdgeInsets.only(
                        right: index == tabTitles.length - 1 ? 0 : 8,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedBuilder(
                            animation: AlwaysStoppedAnimation(isSelected),
                            builder: (context, child) {
                              return Transform.scale(
                                scale: isSelected
                                    ? 1.25
                                    : 1.0,
                                alignment: Alignment.center,
                                child: Text(
                                  tabTitles[index],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: isSelected
                                        ? FontWeight.w500
                                        : FontWeight.normal,
                                    color: isSelected
                                        ? activeTabColor
                                        : inactiveTabColor,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
              // 右侧固定图标区域
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(rightIconItems.length, (index) {
                  final item = rightIconItems[index];
                  return IconButton(
                    icon: item.icon,
                    onPressed: item.onTap,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(
                      minWidth: 40,
                      minHeight: 40,
                    ),
                    highlightColor: Colors.transparent,
                  );
                }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class IconActionItem {
  final Widget icon;
  final VoidCallback? onTap;

  const IconActionItem({required this.icon, this.onTap});
}
