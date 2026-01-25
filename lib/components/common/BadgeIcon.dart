import 'package:flutter/material.dart';
import 'package:hey/constant/GlobalConstants.dart';

/// 带角标的图标组件
class BadgeIcon extends StatelessWidget {
  /// 基础图标
  final IconData icon;
  /// 图标大小
  final double iconSize;
  /// 图标颜色
  final Color iconColor;
  /// 是否显示角标
  final bool showBadge;
  /// 角标背景色（默认红色）
  final Color badgeColor;
  /// 角标大小（默认8dp）
  final double badgeSize;
  /// 角标偏移量（微调位置）
  final Offset badgeOffset;

  const BadgeIcon({
    super.key,
    required this.icon,
    this.iconSize = GlobalConstants.topIconSize,
    this.iconColor = Colors.black,
    this.showBadge = false,
    this.badgeColor = Colors.red,
    this.badgeSize = 8.0,
    this.badgeOffset = const Offset(-1, 1),
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Icon(
          icon,
          size: iconSize,
          color: iconColor,
        ),
        if (showBadge)
          Positioned(
            right: badgeOffset.dx,
            top: badgeOffset.dy,
            child: Container(
              width: badgeSize,
              height: badgeSize,
              decoration: BoxDecoration(
                color: badgeColor,
                shape: BoxShape.circle,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 1,
                    spreadRadius: 1,
                  )
                ],
              ),
            ),
          ),
      ],
    );
  }
}