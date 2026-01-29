import 'package:flutter/material.dart';
import 'package:hey/components/common/CommentHorizontal.dart';
import 'package:hey/components/common/CustomDivider.dart';
import 'package:hey/components/common/LikeHorizontal.dart';
import 'package:hey/components/home/FeedbackTag.dart';
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

  //点击更多图标的方法
  void _onTapMore(BuildContext context) {
    double leftRightPadding = 16.0;
    double wrapSpacing = 12.0;
    double wrapSizeBox = (MediaQuery.of(context).size.width - 32 - 12) / 2;
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(14)),
      ),
      isDismissible: true,
      builder: (BuildContext context) {
        void closeBottomSheet() {
          Navigator.pop(context);
        }

        return Container(
          padding: EdgeInsets.only(
            left: leftRightPadding,
            right: leftRightPadding,
            top: 16,
            bottom: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                '不感兴趣（选择后将减少相似推荐）',
                style: TextStyle(fontSize: 16, color: Color(0xFF898D91)),
              ),
              const SizedBox(height: 16),
              Wrap(
                //水平间距
                spacing: wrapSpacing,
                //垂直间距
                runSpacing: 12,
                alignment: WrapAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: wrapSizeBox,
                    child: FeedbackTag(
                      feedbackContent: '不喜欢该社区: ${postBase.communityName}',
                      onClose: closeBottomSheet,
                    ),
                  ),
                  SizedBox(
                    width: wrapSizeBox,
                    child: FeedbackTag(
                      feedbackContent: '相似内容过多',
                      onClose: closeBottomSheet,
                    ),
                  ),
                  SizedBox(
                    width: wrapSizeBox,
                    child: FeedbackTag(
                      feedbackContent: '不喜欢该作者: ${postBase.authorNickName}',
                      onClose: closeBottomSheet,
                    ),
                  ),
                  SizedBox(
                    width: wrapSizeBox,
                    child: FeedbackTag(
                      feedbackContent: '不喜欢该内容',
                      onClose: closeBottomSheet,
                    ),
                  ),
                  SizedBox(
                    width: wrapSizeBox,
                    child: FeedbackTag(
                      feedbackContent: '不喜欢: ${postBase.communityName}相关',
                      onClose: closeBottomSheet,
                    ),
                  ),
                  SizedBox(
                    width: wrapSizeBox,
                    child: FeedbackTag(
                      feedbackContent: '不喜欢: ${postBase.communityName}相关',
                      onClose: closeBottomSheet,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                '内容反馈',
                style: TextStyle(fontSize: 16, color: Color(0xFF898D91)),
              ),
              const SizedBox(height: 16),
              Wrap(
                //水平间距
                spacing: 12,
                //垂直间距
                runSpacing: 12,
                alignment: WrapAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: wrapSizeBox,
                    child: FeedbackTag(
                      feedbackContent: '软文广告',
                      onClose: closeBottomSheet,
                    ),
                  ),
                  SizedBox(
                    width: wrapSizeBox,
                    child: FeedbackTag(
                      feedbackContent: '标题党',
                      onClose: closeBottomSheet,
                    ),
                  ),
                  SizedBox(
                    width: wrapSizeBox,
                    child: FeedbackTag(
                      feedbackContent: '不实炒作',
                      onClose: closeBottomSheet,
                    ),
                  ),
                  SizedBox(
                    width: wrapSizeBox,
                    child: FeedbackTag(
                      feedbackContent: 'AI生成',
                      onClose: closeBottomSheet,
                    ),
                  ),
                  SizedBox(
                    width: wrapSizeBox,
                    child: FeedbackTag(
                      feedbackContent: '内容低俗',
                      onClose: closeBottomSheet,
                    ),
                  ),
                  SizedBox(
                    width: wrapSizeBox,
                    child: FeedbackTag(
                      feedbackContent: '分区错误',
                      onClose: closeBottomSheet,
                    ),
                  ),
                  SizedBox(
                    width: wrapSizeBox,
                    child: FeedbackTag(
                      feedbackContent: '内容质量差',
                      onClose: closeBottomSheet,
                    ),
                  ),
                  SizedBox(
                    width: wrapSizeBox,
                    child: FeedbackTag(
                      feedbackContent: '内容不适',
                      onClose: closeBottomSheet,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  MsgUtil.show('举报功能暂未完成');
                },
                child: const SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '举报',
                        style: TextStyle(
                          fontSize: 16,
                          color: ColorConstants.titleBlack,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Color(0xFFC8CDD1),
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTopArea(BuildContext context) {
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
        if (postBase.postType == GlobalConstants.recommendPostType)
          GestureDetector(
            onTap: () => _onTapMore(context),
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
        if (postBase.postTime?.isNotEmpty == true) ...[
          const SizedBox(width: 10),
          Text(
            postBase.postTime!,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF8E9295),
            ),
          ),
        ],
        const Spacer(),
        CommentHorizontal(commentCount: postBase.commentCount),
        const SizedBox(width: 10),
        LikeHorizontal(likeCount: postBase.likeCount),
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
                //顶部用户名和更多
                _buildTopArea(context),
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
          child: CustomDivider(),
        ),
      ],
    );
  }
}
