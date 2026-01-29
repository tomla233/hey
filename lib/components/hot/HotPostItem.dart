import 'package:flutter/material.dart';
import 'package:hey/models/home/PostBase.dart';

class HotPostItem extends StatefulWidget {
  final PostBase postBase;
  final String category;
  const HotPostItem({super.key, required this.postBase, required this.category});

  @override
  State<HotPostItem> createState() => _HotPostItemState();
}

class _HotPostItemState extends State<HotPostItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(widget.postBase.title + widget.category),
        ],
      ),
    );
  }
}