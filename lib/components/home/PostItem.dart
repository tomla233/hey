import 'package:flutter/material.dart';
import 'package:hey/components/common/CommentHorizontal.dart';
import 'package:hey/components/common/LikeHorizontal.dart';
import 'package:hey/components/home/LevelTag.dart';
import 'package:hey/components/home/communityTag.dart';
import 'package:hey/constant/ColorConstants.dart';
import 'package:hey/constant/GlobalConstants.dart';
import 'package:hey/models/home/PostBase.dart';
import 'package:hey/utils/MsgUtil.dart';

class PostItem extends StatelessWidget {
  final PostBase postBase;
  static const sizeBoxWidth = 6.0;
  const PostItem({super.key, required this.postBase});
  void _onTapAuthor() {
    MsgUtil.show('作者主页暂未完成');
    print("点击了【作者】,作者id:${postBase.authorId}");
  }

  void _onTapCommunity() {
    MsgUtil.show('社区功能暂未完成');
    print("点击了【社区】,社区id:${postBase.communityId}");
  }

  void _onTapComment() {
    MsgUtil.show('评论功能暂未完成');
    print("点击了【评论】");
  }
  void _onTapLike() {
    MsgUtil.show('点赞功能暂未完成');
    print("点击了【点赞】");
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
            MsgUtil.show('更多功能暂未完成');
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

  Widget _buildImageArea(BuildContext context) {
    if (postBase.contentImages.isEmpty) {
      return const SizedBox.shrink();
    }
    List<String> imageList = postBase.contentImages.take(3).toList();
    return Row(
      children: imageList.asMap().entries.map((entry) {
        int index = entry.key;
        String imgUrl = imageList[index];
        double imageWidth = (MediaQuery.of(context).size.width - 20 - 12) / 3;
        return Expanded(
          child: Container(
            margin: EdgeInsets.only(right: index < 2 ? 6 : 0),
            height: imageWidth,
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    imgUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      // 图片加载失败时的占位图
                      return Container(
                        color: ColorConstants.dividerColor,
                        child: const Icon(
                          Icons.image_not_supported,
                          color: Colors.grey,
                        ),
                      );
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      // 图片加载过程中的占位图
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return Container(
                          color: ColorConstants.dividerColor,
                          child: const Icon(
                            Icons.image_not_supported,
                            color: Colors.grey,
                          ),
                        );
                      }
                    },
                  ),
                ),
                if (index == 2 && postBase.imageCount > 3)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 1,
                        horizontal: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          "共${postBase.imageCount}张",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildBottomArea() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: _onTapCommunity,
          child: CommunityTag(
            communityName: postBase.communityName,
            communityLogo: postBase.communityLogo,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: _onTapComment,
          child: CommentHorizontal(commentCount: postBase.commentCount),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: _onTapLike,
          child: LikeHorizontal(likeCount: postBase.likeCount)),
      ],
    );
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
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
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
                _buildImageArea(context),
                const SizedBox(height: 20),
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
