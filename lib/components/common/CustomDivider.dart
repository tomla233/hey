import 'package:flutter/material.dart';
import 'package:hey/constant/ColorConstants.dart';
// 自定义分割线组件
class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      thickness: 4,
      color: ColorConstants.dividerColor,
    );
  }
}
