class GameInfo {
  // 游戏ID
  String gameId;
  // 游戏中文名称
  String gameChineseName;
  // 游戏英文名称
  String gameEnglishName;
  //游戏价格
  String gamePrice;
  //是否为券后价
  bool isDiscountPrice;
  // 游戏简介
  String gameDesc;
  //游戏截图
  List<String> gameScreenshots;
  //游戏评分
  String gameScore;
  //评分人数
  int gameScoreNum;
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

  GameInfo({
    required this.gameId,
    required this.gameChineseName,
    required this.gameEnglishName,
    required this.gamePrice,
    required this.isDiscountPrice,
    required this.gameDesc,
    required this.gameScreenshots,
    required this.gameScore,
    required this.gameScoreNum,
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
  });

  //todo factory
}
