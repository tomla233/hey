import 'package:flutter/material.dart';
import 'package:hey/constant/ColorConstants.dart';

/// 收起的文本组件：最多maxLines行 + 末尾渐变 + 查看全文
class CollapsedTextWithGradient extends StatelessWidget {
  /// 要展示的文本内容
  final String text;

  /// 文本样式
  final TextStyle? textStyle;

  /// 最多展示行数（默认3行）
  final int maxLines;

  /// "查看全文"文字
  final String expandText;

  /// "查看全文"文字样式
  final TextStyle? expandTextStyle;

  /// 点击"查看全文"的回调
  final VoidCallback onExpand;

  /// 渐变区域宽度（可调整渐变范围）
  final double gradientWidth;

  const CollapsedTextWithGradient({
    super.key,
    required this.text,
    required this.onExpand,
    this.textStyle,
    this.maxLines = 3,
    this.expandText = '查看全文',
    this.expandTextStyle,
    this.gradientWidth = 60.0,
  });

  @override
  Widget build(BuildContext context) {
    // 默认样式
    final defaultTextStyle =
        textStyle ??
        const TextStyle(color: ColorConstants.primaryBlack, fontSize: 13);

    // 默认"查看全文"样式
    final defaultExpandStyle =
        expandTextStyle ??
        const TextStyle(
          color: Color(0xFF0B4986),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        );

    return Stack(
      clipBehavior: Clip.none,
      children: [
        // 底层文本：最多maxLines行，溢出裁剪
        Text(
          text,
          style: defaultTextStyle,
          maxLines: maxLines,
          overflow: TextOverflow.clip,
        ),

        // 渐变遮罩 + 查看全文按钮
        Positioned(
          bottom: 0,
          right: 0,
          // 确保渐变容器覆盖文字末尾
          child: Container(
            decoration: BoxDecoration(
              // 渐变：从透明到背景色，实现文字渐隐效果
              gradient: LinearGradient(
                colors: [
                  Colors.white.withValues(alpha: 0),
                  Colors.white.withValues(alpha: 1),
                  Colors.white,
                ],
                stops: const [0.0, 0.5, 1.0],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 渐变占位区域
                SizedBox(width: gradientWidth),
                // 查看全文按钮
                GestureDetector(
                  onTap: onExpand,
                  // 防止点击区域过小，增加点击范围
                  behavior: HitTestBehavior.opaque,
                  child: Text(expandText, style: defaultExpandStyle),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
