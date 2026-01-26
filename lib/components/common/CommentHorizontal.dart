import 'package:flutter/material.dart';

///水平排列的评论icon和评论数量
class CommentHorizontal extends StatelessWidget {
  final int commentCount;
  const CommentHorizontal({super.key, required this.commentCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.mode_comment, size: 16, color: Color(0xFFC8CDD1)),
        const SizedBox(width: 4),
        Text(
          '$commentCount',
          style: const TextStyle(fontSize: 12, color: Color(0xFFC8CDD1)),
        ),
      ],
    );
  }
}
