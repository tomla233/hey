import 'package:flutter/material.dart';

class AttentionTag extends StatelessWidget {
  const AttentionTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FA),
        borderRadius: BorderRadius.circular(2),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite, size: 14, color: Color(0xFFC8CDD1)),
          SizedBox(width: 4),
          Text(
            '55.68',
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text('万', style: TextStyle(fontSize: 12, color: Colors.black)),
        ],
      ),
    );
  }
}
