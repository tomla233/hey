import 'package:flutter/material.dart';
import 'package:hey/components/common/CommentHorizontal.dart';
import 'package:hey/components/common/CustomDivider.dart';
import 'package:hey/components/hot/CustomNumberBox.dart';
import 'package:hey/constant/ColorConstants.dart';
import 'package:hey/models/home/PostBase.dart';

class HotPostItem extends StatefulWidget {
  final PostBase postBase;
  final String category;
  const HotPostItem({
    super.key,
    required this.postBase,
    required this.category,
  });

  @override
  State<HotPostItem> createState() => _HotPostItemState();
}

class _HotPostItemState extends State<HotPostItem> {
  Widget _buildCommonPostContent() {
    return Expanded(
      child: Column(
        children: [
          Text(widget.postBase.title, textAlign: TextAlign.left),
          Row(
            children: [
              if (widget.category == "热榜") ...[
                Text(
                  '${widget.postBase.viewCount}阅读·${widget.postBase.communityName}',
                  style: const TextStyle(
                    color: Color(0xFFC8CDD1),
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                CommentHorizontal(commentCount: widget.postBase.commentCount),
              ] else ...[
                Text(widget.postBase.postTime ?? ''),
                CommentHorizontal(commentCount: widget.postBase.commentCount),
              ],
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (widget.category == "热榜") ...[
                          CustomNumberBox(number: widget.postBase.rank ?? 0),
                          _buildCommonPostContent(),
                        ] else
                          const Text('data'),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 140,
                    height: 80,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.network(
                        widget.postBase.contentImages.take(1).first,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const CustomDivider(thickness: 1.5),
      ],
    );
  }
}
