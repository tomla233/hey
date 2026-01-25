import 'package:flutter/material.dart';
import 'package:hey/components/home/LevelTag.dart';
import 'package:hey/constant/ColorConstants.dart';
import 'package:hey/constant/GlobalConstants.dart';
import 'package:hey/models/home/PostBase.dart';

class PostItem extends StatelessWidget {
  final PostBase postBase;
  static const sizeBoxWidth = 6.0;
  const PostItem({super.key, required this.postBase});
  void _onTapAuthor() {
    print("点击了【作者】,作者id:${postBase.authorId}");
  }

  Widget _buildTopArea() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: _onTapAuthor,
              child: CircleAvatar(
                radius: postBase.postType == GlobalConstants.recommendPostType
                    ? 10
                    : 14,
                backgroundImage: NetworkImage(postBase.authorAvatar),
              ),
            ),
            const SizedBox(width: sizeBoxWidth),
            GestureDetector(
              onTap: _onTapAuthor,
              child: Text(
                postBase.authorNickName,
                style: TextStyle(
                  fontSize:
                      postBase.postType == GlobalConstants.recommendPostType
                      ? 12
                      : 14,
                  fontWeight:
                      postBase.postType == GlobalConstants.recommendPostType
                      ? FontWeight.w300
                      : FontWeight.w400,
                  color: postBase.postType == GlobalConstants.recommendPostType
                      ? ColorConstants.nickName
                      : ColorConstants.primaryBlack,
                ),
              ),
            ),
            const SizedBox(width: sizeBoxWidth),
            LevelTag(level: postBase.authorLevel),
          ],
        ),
        GestureDetector(
          onTap: () {
            print("点击了【更多图标】");
          },
          child: const Icon(
            Icons.more_horiz_outlined,
            color: Color(0xFFC8CDD1),
          ),
        ),
      ],
    );
  }

  Widget _buildImageArea() {
    return Text('data');
  }

  Widget _buildBottomArea() {
    return Text('data');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          splashColor: Colors.grey[100]!.withValues(alpha: 2),
          onTap: () {
            print("点击了【帖子】,帖子id:${postBase.postId}");
          },
          child: Container(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //顶部用户名
                _buildTopArea(),
                const SizedBox(height: 10),
                //标题
                Text(
                  postBase.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ColorConstants.titleBlack,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                //帖子简短内容
                Text(
                  postBase.shortContent,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: ColorConstants.titleBlack,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                //图片区域
                _buildImageArea(),
                const SizedBox(height: 10),
                //底部社区信息、点赞和评论数量展示
                _buildBottomArea(),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Divider(
            height: 1,
            thickness: 4,
            color: ColorConstants.dividerColor,
          ),
        ),
      ],
    );
  }
}
