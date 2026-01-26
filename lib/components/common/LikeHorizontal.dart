import 'package:flutter/material.dart';

class LikeHorizontal extends StatelessWidget {
  final int likeCount;
  const LikeHorizontal({super.key,required this.likeCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.thumb_up_alt_rounded, size: 16, color: Color(0xFFC8CDD1)),
        const SizedBox(width: 4),
        Text(
          '$likeCount',
          style: const TextStyle(fontSize: 12, color: Color(0xFFC8CDD1)),
        ),
      ],
    );;
  }
}