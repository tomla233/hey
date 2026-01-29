import 'package:flutter/material.dart';
import 'package:hey/constant/ColorConstants.dart';

// 自定义分割线组件
class CustomDivider extends StatelessWidget {
  final double thickness;
  const CustomDivider({super.key, this.thickness = 4});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: thickness,
      color: ColorConstants.dividerColor,
    );
  }
}
