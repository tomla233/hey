import 'package:hey/models/game/GameInfo.dart';
import 'package:hey/models/game/TagCardEntity.dart';

class GameService {
  GameService._();

  static final GameService _instance = GameService._();
  factory GameService() => _instance;

  //游戏信息列表
  final List<GameInfo> gameInfoList = [
    GameInfo(
      gameId: '1',
      gameChineseName: '千恋万花',
      gameEnglishName: 'Senren * Banka',
      gamePrice: '88',
      isDiscountPrice: true,
      gameDesc:
          '《千恋万花》是日本美少女游戏品牌Yuzusoft（柚子社）制作的一款和风恋爱题材作品。本作也是柚子社创立十周年的纪念作，在发售当年除展现出势如破竹的高人气外还赢得了大量奖项。',
      gameScreenshots: ['', '', '', '', ''],
      gameScore: '9.8',
      gameScoreNum: 5799,
      gameTags: ['恋爱', '和风', '角色'],
      isSupportChinese: true,
      isSupportSteamDeck: true,
      isSupportController: true,
      isSupportFamilySharing: true,
      supportPlayerNum: '单人',
      releaseTime: '2023-01-01',
      developer: 'Yuzusoft',
      publisher: 'Yuzusoft',
      qqGroup: '123456',
      series: '千恋万花',
    ),
    GameInfo(
      gameId: '2',
      gameChineseName: '千恋万花',
      gameEnglishName: 'Senren * Banka',
      gamePrice: '88',
      isDiscountPrice: false,
      gameDesc:
          '《千恋万花》是日本美少女游戏品牌Yuzusoft（柚子社）制作的一款和风恋爱题材作品。本作也是柚子社创立十周年的纪念作，在发售当年除展现出势如破竹的高人气外还赢得了大量奖项。',
      gameScreenshots: ['', '', '', '', ''],
      gameScore: '9.8',
      gameScoreNum: 5799,
      gameTags: ['恋爱', '和风', '角色'],
      isSupportChinese: true,
      isSupportSteamDeck: true,
      isSupportController: true,
      isSupportFamilySharing: true,
      supportPlayerNum: '单人',
      releaseTime: '2023-01-01',
      developer: 'Yuzusoft',
      publisher: 'Yuzusoft',
      qqGroup: '123456',
      series: '千恋万花',
    ),
    GameInfo(
      gameId: '3',
      gameChineseName: '千恋万花',
      gameEnglishName: 'Senren * Banka',
      gamePrice: '88',
      isDiscountPrice: true,
      gameDesc:
          '《千恋万花》是日本美少女游戏品牌Yuzusoft（柚子社）制作的一款和风恋爱题材作品。本作也是柚子社创立十周年的纪念作，在发售当年除展现出势如破竹的高人气外还赢得了大量奖项。',
      gameScreenshots: ['', '', '', '', ''],
      gameScore: '9.8',
      gameScoreNum: 5799,
      gameTags: ['恋爱', '和风', '角色'],
      isSupportChinese: true,
      isSupportSteamDeck: true,
      isSupportController: true,
      isSupportFamilySharing: true,
      supportPlayerNum: '单人',
      releaseTime: '2023-01-01',
      developer: 'Yuzusoft',
      publisher: 'Yuzusoft',
      qqGroup: '123456',
      series: '千恋万花',
    ),
    GameInfo(
      gameId: '4',
      gameChineseName: '千恋万花',
      gameEnglishName: 'Senren * Banka',
      gamePrice: '88',
      isDiscountPrice: true,
      gameDesc:
          '《千恋万花》是日本美少女游戏品牌Yuzusoft（柚子社）制作的一款和风恋爱题材作品。本作也是柚子社创立十周年的纪念作，在发售当年除展现出势如破竹的高人气外还赢得了大量奖项。',
      gameScreenshots: ['', '', '', '', ''],
      gameScore: '9.8',
      gameScoreNum: 5799,
      gameTags: ['恋爱', '和风', '角色'],
      isSupportChinese: true,
      isSupportSteamDeck: true,
      isSupportController: true,
      isSupportFamilySharing: true,
      supportPlayerNum: '单人',
      releaseTime: '2023-01-01',
      developer: 'Yuzusoft',
      publisher: 'Yuzusoft',
      qqGroup: '123456',
      series: '千恋万花',
    ),
  ];
  //标签卡片列表
  final List<TagCardEntity> tagCardList = [
    TagCardEntity(tagName: '黑盒商城', tagIcon: 'lib/assets/game/shopify.png'),
    TagCardEntity(tagName: '喜加一', tagIcon: 'lib/assets/game/gift.png'),
    TagCardEntity(tagName: '赛事中心', tagIcon: 'lib/assets/game/match.png'),
    TagCardEntity(tagName: '黑盒语音', tagIcon: 'lib/assets/game/voice.png'),
    TagCardEntity(tagName: '刀塔战绩', tagIcon: 'lib/assets/box.png'),
    TagCardEntity(tagName: 'CS2战绩', tagIcon: 'lib/assets/box.png'),
    TagCardEntity(tagName: '开箱统计', tagIcon: 'lib/assets/box.png'),
    TagCardEntity(tagName: '更多', tagIcon: 'lib/assets/all.png'),
  ];
}
