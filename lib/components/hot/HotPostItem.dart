import 'package:flutter/material.dart';
import 'package:hey/components/common/CommentHorizontal.dart';
import 'package:hey/components/common/CustomDivider.dart';
import 'package:hey/components/hot/CustomNumberBox.dart';
import 'package:hey/constant/GlobalConstants.dart';
import 'package:hey/models/home/PostBase.dart';
import 'package:hey/utils/MsgUtil.dart';
import 'package:hey/utils/StrUtil.dart';

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
  static const double _imageHeight = GlobalConstants.hotPostContainerHeight;
  Widget _buildCommonPostContent() {
    return Expanded(
      child: SizedBox(
        height: _imageHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.postBase.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (widget.category == "热榜") ...[
                  Text(
                    StrUtil.limitTextLength(
                      '${widget.postBase.viewCount}阅读·${widget.postBase.communityName}',
                      maxLength: 15
                    ),
                    style: const TextStyle(
                      color: Color(0xFFC8CDD1),
                      fontSize: 12,
                    ),
                  ),
                  CommentHorizontal(commentCount: widget.postBase.commentCount),
                ] else ...[
                  Text(
                    StrUtil.limitTextLength(
                      '${widget.postBase.postTime}·${widget.postBase.communityName}',
                      maxLength: 15
                    ),
                    style: const TextStyle(
                      color: Color(0xFFC8CDD1),
                      fontSize: 12,
                    ),
                  ),
                  CommentHorizontal(commentCount: widget.postBase.commentCount),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            MsgUtil.show('点击了${widget.postBase.postId}');
          },
          child: Container(
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
                            _buildCommonPostContent(),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    if (widget.postBase.contentImages.isNotEmpty) ...[
                      SizedBox(
                        width: 120,
                        height: _imageHeight,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            widget.postBase.contentImages.take(1).first,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset('lib/assets/box.png');
                            },
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
        const CustomDivider(thickness: 1.5),
      ],
    );
  }
}
