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
       gameScreenshots: [
        'https://img6.donews.com/img/2021/08/27/img_pic_171630034638.jpg',
        'https://storage.moegirl.org.cn/moegirl/commons/6/60/%E8%95%BE%E5%A8%9C%C2%B7%E8%8E%89%E5%B8%8C%E7%89%B9%E5%A8%9C%E7%93%A6_%E8%A7%92%E8%89%B2%E5%B0%88%E8%BC%AF%E5%B0%81%E9%9D%A2.jpg',
        'https://i0.hdslb.com/bfs/new_dyn/5fe72304a5b46efb51d27724a0065807626510519.jpg@1192w.avif',
        'https://so1.360tres.com/t01900439c6c79694db.jpg',
        'https://qianlianwanhua.com/gsbj.webp',
      ],
      gameScore: '9.8',
      gameScoreNum: 5799,
      outFirstTag: '黑盒热搜',
      gameTags: ['恋爱养成', '和风', '角色'],
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
      gameScreenshots: [
        'https://storage.moegirl.org.cn/moegirl/commons/6/60/%E8%95%BE%E5%A8%9C%C2%B7%E8%8E%89%E5%B8%8C%E7%89%B9%E5%A8%9C%E7%93%A6_%E8%A7%92%E8%89%B2%E5%B0%88%E8%BC%AF%E5%B0%81%E9%9D%A2.jpg',
        'https://img6.donews.com/img/2021/08/27/img_pic_171630034638.jpg',
        'https://i0.hdslb.com/bfs/new_dyn/5fe72304a5b46efb51d27724a0065807626510519.jpg@1192w.avif',
        'https://so1.360tres.com/t01900439c6c79694db.jpg',
        'https://qianlianwanhua.com/gsbj.webp',
      ],
      gameScore: '9.8',
      gameScoreNum: 5799,
      outFirstTag: '黑盒热搜',
      gameTags: ['恋爱养成', '和风', '角色'],
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
      gameScreenshots: [
        'https://i0.hdslb.com/bfs/new_dyn/5fe72304a5b46efb51d27724a0065807626510519.jpg@1192w.avif',
        'https://img6.donews.com/img/2021/08/27/img_pic_171630034638.jpg',
        'https://storage.moegirl.org.cn/moegirl/commons/6/60/%E8%95%BE%E5%A8%9C%C2%B7%E8%8E%89%E5%B8%8C%E7%89%B9%E5%A8%9C%E7%93%A6_%E8%A7%92%E8%89%B2%E5%B0%88%E8%BC%AF%E5%B0%81%E9%9D%A2.jpg',
        'https://so1.360tres.com/t01900439c6c79694db.jpg',
        'https://qianlianwanhua.com/gsbj.webp',
      ],
      gameScore: '9.8',
      gameScoreNum: 5799,
      outFirstTag: '小黑盒热销',
      gameTags: ['恋爱', '和风', '角色互动'],
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
      gameScreenshots: [
        'https://so1.360tres.com/t01900439c6c79694db.jpg',
        'https://img6.donews.com/img/2021/08/27/img_pic_171630034638.jpg',
        'https://storage.moegirl.org.cn/moegirl/commons/6/60/%E8%95%BE%E5%A8%9C%C2%B7%E8%8E%89%E5%B8%8C%E7%89%B9%E5%A8%9C%E7%93%A6_%E8%A7%92%E8%89%B2%E5%B0%88%E8%BC%AF%E5%B0%81%E9%9D%A2.jpg',
        'https://i0.hdslb.com/bfs/new_dyn/5fe72304a5b46efb51d27724a0065807626510519.jpg@1192w.avif',
        'https://qianlianwanhua.com/gsbj.webp',
      ],
      gameScore: '9.8',
      gameScoreNum: 5799,
      outFirstTag: '大家都在玩',
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
