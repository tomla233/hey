class GameComment {
  final String commentId; //评论id(唯一标识)
  final String gameId; //游戏id
  final String authorId; //评论者id
  final String gameName;
  final String authorName;
  final String authorAvatar;
  final String commentTime; //评论时间
  final String commentContent; //评论内容
  final String playingTime; //游玩时间
  final double rating; //评分（0-5，支持小数）
  final double overallScore; //综合评分(0-10)
  final String numbersOfScore; //评分人数
  final int numbersOfUseful; //认为有用的人数
  final String ratioOfUseful; //认为有用占比
  final int numbersOfUseless; //认为无用的人数
  final int numbersOfFunny; //认为有趣的人数
  final int numbersOfCollect; //收藏数量

  GameComment({
    required this.commentId,
    required this.gameId,
    required this.authorId,
    required this.gameName,
    required this.authorName,
    required this.authorAvatar,
    required this.commentTime,
    required this.commentContent,
    required this.playingTime,
    required this.rating,
    required this.overallScore,
    required this.numbersOfScore,
    required this.numbersOfUseful,
    required this.ratioOfUseful,
    required this.numbersOfUseless,
    required this.numbersOfFunny,
    required this.numbersOfCollect,
  });
}
