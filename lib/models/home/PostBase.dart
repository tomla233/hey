///展示在外部列表的帖子简略信息
class PostBase {
  // 帖子id
  final String postId;
  //帖子类型
  final String postType;
  //帖子发布时间
  final String? postTime;
  //帖子排名
  final int? rank;
  //文章标题
  final String title;
  //帖子内容简略
  final String shortContent;
  //帖子内容图片列表(最多三张)
  final List<String> contentImages;
  //帖子图片数量
  final int imageCount;
  //帖子作者id
  final String authorId;
  //浏览量
  final String? viewCount;
  //用户头像
  final String authorAvatar;
  //用户昵称
  final String authorNickName;
  //用户等级
  final String authorLevel;
  //所属社区id
  final String communityId;
  //所属社区名称
  final String communityName;
  //所属社区logo
  final String communityLogo;
  //评论数量
  final int commentCount;
  //点赞数量
  final int likeCount;

  PostBase({
    required this.postId,
    required this.postType,
    this.postTime,
    this.rank,
    required this.title,
    required this.shortContent,
    required this.contentImages,
    required this.imageCount,
    required this.authorId,
    this.viewCount,
    required this.authorAvatar,
    required this.authorNickName,
    required this.authorLevel,
    required this.communityId,
    required this.communityName,
    required this.communityLogo,
    required this.commentCount,
    required this.likeCount,
  });

  factory PostBase.fromJson(Map<String, dynamic> json) {
    return PostBase(
      postId: json['postId'],
      postType: json['postType'],
      postTime: json['postTime'] ?? '',
      rank: json['rank'],
      title: json['title'],
      shortContent: json['shortContent'],
      contentImages: json['contentImages'] is List
          ? List<String>.from(json['contentImages'])
          : [],
      imageCount: json['imageCount'],
      authorId: json['authorId'],
      viewCount: json['viewCount'] ?? '',
      authorAvatar: json['authorAvatar'],
      authorNickName: json['authorNickName'],
      authorLevel: json['authorLevel'],
      communityId: json['communityId'],
      communityName: json['communityName'],
      communityLogo: json['communityLogo'],
      commentCount: json['commentCount'],
      likeCount: json['likeCount'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
      'title': title,
      'shortContent': shortContent,
      'contentImages': contentImages,
      'imageCount': imageCount,
      'authorAvatar': authorAvatar,
      'authorNickName': authorNickName,
      'authorLevel': authorLevel,
      'communityId': communityId,
      'communityName': communityName,
      'communityLogo': communityLogo,
      'commentCount': commentCount,
      'likeCount': likeCount,
    };
  }
}
