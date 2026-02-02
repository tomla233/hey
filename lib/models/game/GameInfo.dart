class GameInfo {
  // 游戏ID
  String gameId;
  // 游戏中文名称
  String gameChineseName;
  // 游戏英文名称
  String gameEnglishName;
  //游戏价格
  String gamePrice;
  // 游戏图标
  String gameIcon;
  // 游戏简介
  String gameDesc;
  //游戏截图
  List<String> gameScreenshots;
  //平台价格
  String platformPrice;
  //折扣百分比
  String discountPercent;
  //原价
  String originalPrice;
  //游戏评分
  String gameScore;
  //评分人数
  int gameScoreNum;
  //游戏标签
  List<String> gameTags;
  //支持游戏的平台
  List<String> gamePlatforms;
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
  //当前在线人数
  int currentOnlineNum;
  //史低价格
  String historyPrice;
  //全语言好评率
  String fullLanguageRating;
  //昨日峰值在线
  int yesterdayPeakOnline;
  //全球销量排行
  int globalSalesRank;
  //平台玩家数
  int platformPlayerNum;
  //平均游戏时间
  String averageGameTime;
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
    required this.gameIcon,
    required this.gameDesc,
    required this.gameScreenshots,
    required this.platformPrice,
    required this.discountPercent,
    required this.originalPrice,
    required this.gameScore,
    required this.gameScoreNum,
    required this.gameTags,
    required this.gamePlatforms,
    required this.isSupportChinese,
    required this.isSupportSteamDeck,
    required this.isSupportController,
    required this.isSupportFamilySharing,
    required this.supportPlayerNum,
    required this.currentOnlineNum,
    required this.historyPrice,
    required this.fullLanguageRating,
    required this.yesterdayPeakOnline,
    required this.globalSalesRank,
    required this.platformPlayerNum,
    required this.averageGameTime,
    required this.releaseTime,
    required this.developer,
    required this.publisher,
    required this.qqGroup,
    required this.series,
  });

  //todo factory
}
