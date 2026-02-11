import 'package:hey/models/game/GameComment.dart';

class GameInfo {
  // 游戏ID
  String gameId;
  // 游戏中文名称
  String gameChineseName;
  // 游戏英文名称
  String gameEnglishName;
  //游戏价格
  String gamePrice;
  //价格右侧标签数组,固定四个元素，示例：['券后价','80','-90%','新史低']，如果为空则用null表示，不可省略，例如['券后价',null,'-90%','新史低']
  List<String?> priceRightTags;
  // 游戏简介
  String gameDesc;
  //游戏截图
  List<String> gameScreenshots;
  //游戏评分
  String gameScore;
  //评分人数
  int gameScoreNum;
  //外部首个标签
  String outFirstTag;
  //游戏标签
  List<String> gameTags;
  //是否支持中文
  bool isSupportChinese;
  //是否支持Steam Deck
  bool isSupportSteamDeck;
  //是否支持手柄
  bool isSupportController;
  //是否支持家庭共享
  bool isSupportFamilySharing;
  //支持同时游玩人数
  String supportPlayerNum;
  //发布时间
  String releaseTime;
  //开发商
  String developer;
  //发行商
  String publisher;
  //交流群
  String qqGroup;
  //系列
  String series;
  //游戏安利墙评论
  GameComment? gameComment;

  GameInfo({
    required this.gameId,
    required this.gameChineseName,
    required this.gameEnglishName,
    required this.gamePrice,
    required this.priceRightTags,
    required this.gameDesc,
    required this.gameScreenshots,
    required this.gameScore,
    required this.gameScoreNum,
    required this.outFirstTag,
    required this.gameTags,
    required this.isSupportChinese,
    required this.isSupportSteamDeck,
    required this.isSupportController,
    required this.isSupportFamilySharing,
    required this.supportPlayerNum,
    required this.releaseTime,
    required this.developer,
    required this.publisher,
    required this.qqGroup,
    required this.series,
    this.gameComment
  }) : assert(priceRightTags.length == 4, 'priceRightTags 必须有四个元素');

  //todo factory
}
