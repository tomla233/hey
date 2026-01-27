import 'package:flutter/material.dart';
import 'package:hey/utils/MsgUtil.dart';

class FeedbackTag extends StatelessWidget {
  final String feedbackContent;
  // 新增：关闭弹窗的回调函数（可选）
  final VoidCallback? onClose;
  const FeedbackTag({super.key, required this.feedbackContent,this.onClose,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        MsgUtil.show('反馈成功，将为您优化推荐结果');
        if (onClose != null) {
          onClose!();
        }
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: const Color(0xFFF7F8FA),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          feedbackContent,
          style: const TextStyle(fontSize: 12, color: Color(0xFF585D60)),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
