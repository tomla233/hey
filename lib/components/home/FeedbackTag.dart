import 'package:flutter/material.dart';

class FeedbackTag extends StatelessWidget {
  final String feedbackContent;
  const FeedbackTag({super.key, required this.feedbackContent});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
