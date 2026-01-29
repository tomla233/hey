import 'package:hey/models/home/AttentionUserInfo.dart';
import 'package:hey/models/home/CommunityInfo.dart';
import 'package:hey/models/home/PostBase.dart';

/// 数据服务类
class PostService {
  PostService._();

  static final PostService _instance = PostService._();
  factory PostService() => _instance;

  //全局共享的帖子列表
  final List<PostBase> postList = [
    PostBase(
      postId: '1',
      postType: 'recommend',
      rank: 1,
      title: '有没有互动性强的galgame推荐一下',
      shortContent: '前阵子千恋万花不是史低嘛，然后煮啵就去买了，画风挺可爱的，但是选项太少了，看了很久的剧情才弹出...',
      contentImages: [
        'https://so1.360tres.com/t01900439c6c79694db.jpg',
        'https://qianlianwanhua.com/gsbj.webp',
        'https://storage.moegirl.org.cn/moegirl/commons/8/85/%E5%8F%A2%E9%9B%A8_%E8%A7%92%E8%89%B2%E5%B0%88%E8%BC%AF%E5%B0%81%E9%9D%A2.jpg',
      ],
      imageCount: 1,
      authorId: '1',
      authorAvatar:
          'https://c-ssl.dtstatic.com/uploads/blog/202206/12/20220612164733_72d8b.thumb.400_0.jpg',
      authorNickName: '小怪兽',
      authorLevel: '1',
      communityId: '2',
      communityName: '千恋 * 万花',
      communityLogo:
          'https://store.ymgal.games/topic/content/84/845c878a5d8a43188dce03adef76760f.jpeg',
      commentCount: 52,
      likeCount: 200,
    ),
    PostBase(
      postId: '2',
      postType: 'recommend',
      rank: 2,
      title: '我是柚子大王😎',
      shortContent: '我是柚子大王，我很喜欢这个游戏，我很想和其他玩家分享我的游戏经历。',
      contentImages: [
        'https://i.bobopic.com/small/115366189.jpg',
        'https://qianlianwanhua.com/2.webp',
        'https://i.bobopic.com/small/107089863.jpg',
      ],
      imageCount: 4,
      authorId: '2',
      authorAvatar:
          'https://c-ssl.dtstatic.com/uploads/blog/202206/12/20220612164733_72d8b.thumb.400_0.jpg',
      authorNickName: '小怪兽',
      authorLevel: '4',
      communityId: '2',
      communityName: '千恋 * 万花',
      communityLogo:
          'https://store.ymgal.games/topic/content/84/845c878a5d8a43188dce03adef76760f.jpeg',
      commentCount: 52,
      likeCount: 200,
    ),
    PostBase(
      postId: '3',
      postType: 'recommend',
      rank: 3,
      title: '戒妹妹第一天，失败了',
      shortContent: '认识我的朋友都知道，我戒妹妹失败了，但是我很想知道，失败的原因是什么？',
      contentImages: [
        'https://qianlianwanhua.com/gsbj.webp',
        'https://qianlianwanhua.com/2.webp',
        'https://qianlianwanhua.com/4.webp',
      ],
      imageCount: 3,
      authorId: '3',
      authorAvatar:
          'https://c-ssl.dtstatic.com/uploads/blog/202206/12/20220612164733_72d8b.thumb.400_0.jpg',
      authorNickName: '小怪兽',
      authorLevel: '2',
      communityId: '2',
      communityName: 'Gal游戏综合区',
      communityLogo:
          'https://store.ymgal.games/topic/content/84/845c878a5d8a43188dce03adef76760f.jpeg',
      commentCount: 52,
      likeCount: 200,
    ),
    PostBase(
      postId: '4',
      postType: 'recommend',
      rank: 4,
      title: '难道我是旮旯给木高手？',
      shortContent: '我是一个 galgame 玩家，我很喜欢这个游戏，我很想和其他玩家分享我的游戏经历。',
      contentImages: [
        'https://qianlianwanhua.com/gsbj.webp',
        'https://qianlianwanhua.com/2.webp',
        'https://qianlianwanhua.com/4.webp',
      ],
      imageCount: 3,
      authorId: '3',
      authorAvatar:
          'https://c-ssl.dtstatic.com/uploads/blog/202206/12/20220612164733_72d8b.thumb.400_0.jpg',
      authorNickName: '小怪兽',
      authorLevel: '2',
      communityId: '2',
      communityName: 'Gal游戏综合区',
      communityLogo:
          'https://store.ymgal.games/topic/content/84/845c878a5d8a43188dce03adef76760f.jpeg',
      commentCount: 52,
      likeCount: 200,
    ),
    PostBase(
      postId: '5',
      postType: 'recommend',
      rank: 5,
      title: '我是不是触发坏结局了',
      shortContent: '我在游戏中触发了一个坏结局，我很想知道，这是为什么？',
      contentImages: [
        'https://qianlianwanhua.com/gsbj.webp',
        'https://qianlianwanhua.com/2.webp',
        'https://qianlianwanhua.com/4.webp',
      ],
      imageCount: 3,
      authorId: '3',
      authorAvatar:
          'https://c-ssl.dtstatic.com/uploads/blog/202206/12/20220612164733_72d8b.thumb.400_0.jpg',
      authorNickName: '小怪兽',
      authorLevel: '2',
      communityId: '2',
      communityName: 'Gal游戏综合区',
      communityLogo:
          'https://store.ymgal.games/topic/content/84/845c878a5d8a43188dce03adef76760f.jpeg',
      commentCount: 52,
      likeCount: 200,
    ),
    PostBase(
      postId: '6',
      postType: 'recommend',
      rank: 6,
      title: '有没有互动性强的galgame推荐一下',
      shortContent: '前阵子千恋万花不是史低嘛，然后煮啵就去买了，画风挺可爱的，但是选项太少了，看了很久的剧情才弹出...',
      contentImages: [
        'https://so1.360tres.com/t01900439c6c79694db.jpg',
        'https://qianlianwanhua.com/gsbj.webp',
        'https://storage.moegirl.org.cn/moegirl/commons/8/85/%E5%8F%A2%E9%9B%A8_%E8%A7%92%E8%89%B2%E5%B0%88%E8%BC%AF%E5%B0%81%E9%9D%A2.jpg',
      ],
      imageCount: 1,
      authorId: '1',
      authorAvatar:
          'https://c-ssl.dtstatic.com/uploads/blog/202206/12/20220612164733_72d8b.thumb.400_0.jpg',
      authorNickName: '小怪兽',
      authorLevel: '1',
      communityId: '2',
      communityName: '千恋 * 万花',
      communityLogo:
          'https://store.ymgal.games/topic/content/84/845c878a5d8a43188dce03adef76760f.jpeg',
      commentCount: 52,
      likeCount: 200,
    ),
    PostBase(
      postId: '7',
      postType: 'recommend',
      rank: 7,
      title: '我是柚子大王😎',
      shortContent: '我是柚子大王，我很喜欢这个游戏，我很想和其他玩家分享我的游戏经历。',
      contentImages: [
        'https://i.bobopic.com/small/115366189.jpg',
        'https://qianlianwanhua.com/2.webp',
        'https://i.bobopic.com/small/107089863.jpg',
      ],
      imageCount: 4,
      authorId: '2',
      authorAvatar:
          'https://c-ssl.dtstatic.com/uploads/blog/202206/12/20220612164733_72d8b.thumb.400_0.jpg',
      authorNickName: '小怪兽',
      authorLevel: '4',
      communityId: '2',
      communityName: '千恋 * 万花',
      communityLogo:
          'https://store.ymgal.games/topic/content/84/845c878a5d8a43188dce03adef76760f.jpeg',
      commentCount: 52,
      likeCount: 200,
    ),
  ];
  //全局共享的关注的人帖子列表
  final List<PostBase> attentionPostList = [
    PostBase(
      postId: '1',
      postType: 'attention',
      postTime: '2小时前',
      title: '妹控牛福',
      shortContent: '妹控闻着味来评论区了',
      contentImages: [
        'https://storage.moegirl.org.cn/moegirl/commons/6/60/%E8%95%BE%E5%A8%9C%C2%B7%E8%8E%89%E5%B8%8C%E7%89%B9%E5%A8%9C%E7%93%A6_%E8%A7%92%E8%89%B2%E5%B0%88%E8%BC%AF%E5%B0%81%E9%9D%A2.jpg',
        'https://qianlianwanhua.com/2.webp',
      ],
      imageCount: 1,
      authorId: '1',
      authorAvatar:
          'https://storage.moegirl.org.cn/moegirl/commons/6/64/%E5%B8%B8%E9%99%B8%E8%8C%89%E5%AD%90_%E8%A7%92%E8%89%B2%E5%B0%88%E8%BC%AF%E5%B0%81%E9%9D%A2.jpg',
      authorNickName: '茉子',
      authorLevel: '1',
      communityId: '2',
      communityName: '千恋 * 万花',
      communityLogo:
          'https://store.ymgal.games/topic/content/84/845c878a5d8a43188dce03adef76760f.jpeg',
      commentCount: 52,
      likeCount: 200,
    ),
    PostBase(
      postId: '2',
      postType: 'attention',
      postTime: '昨天18:11',
      title: '今年玩过的最有深度的作品，还得是柚子社',
      shortContent:
          '抱歉，刚刚腾不出手，今天给大家介绍一款很有深度的作品，柚子社的《我是个机器人》，他探讨了机器人的未来，以及机器人与人类的关系。',
      contentImages: [
        'https://storage.moegirl.org.cn/moegirl/commons/6/64/%E5%B8%B8%E9%99%B8%E8%8C%89%E5%AD%90_%E8%A7%92%E8%89%B2%E5%B0%88%E8%BC%AF%E5%B0%81%E9%9D%A2.jpg',
        'https://storage.moegirl.org.cn/moegirl/commons/e/e3/%E5%8D%83%E6%81%8B%E4%B8%87%E8%8A%B1_%E8%8C%89%E5%AD%90A00_%E5%BE%AE%E7%AC%91.png!/fw/480/watermark/url/L21vZWdpcmwvd2F0ZXJtYXJrLnBuZw==/align/southeast/margin/10x10/opacity/50?v=20170326042512',
        'https://storage.moegirl.org.cn/moegirl/commons/2/2c/%E5%8D%83%E6%81%8B%E4%B8%87%E8%8A%B1_%E8%8A%B3%E4%B9%83A00_%E5%BE%AE%E7%AC%91.png!/fw/480/watermark/url/L21vZWdpcmwvd2F0ZXJtYXJrLnBuZw==/align/southeast/margin/10x10/opacity/50?v=20170326050112',
      ],
      imageCount: 4,
      authorId: '2',
      authorAvatar:
          'https://storage.moegirl.org.cn/moegirl/commons/6/64/%E5%B8%B8%E9%99%B8%E8%8C%89%E5%AD%90_%E8%A7%92%E8%89%B2%E5%B0%88%E8%BC%AF%E5%B0%81%E9%9D%A2.jpg',
      authorNickName: '茉子',
      authorLevel: '4',
      communityId: '2',
      communityName: '千恋 * 万花',
      communityLogo:
          'https://store.ymgal.games/topic/content/84/845c878a5d8a43188dce03adef76760f.jpeg',
      commentCount: 52,
      likeCount: 200,
    ),
    PostBase(
      postId: '3',
      postType: 'attention',
      postTime: '01-22',
      title: '我不行了😭',
      shortContent: '这是我在游戏社区里的最后一次互动，我很遗憾，我不能继续和其他玩家互动了，我很想知道，其他玩家是否有和我一样的体验。',
      contentImages: [
        'https://storage.moegirl.org.cn/moegirl/commons/8/85/%E5%8F%A2%E9%9B%A8_%E8%A7%92%E8%89%B2%E5%B0%88%E8%BC%AF%E5%B0%81%E9%9D%A2.jpg',
        'https://storage.moegirl.org.cn/moegirl/commons/6/60/%E8%95%BE%E5%A8%9C%C2%B7%E8%8E%89%E5%B8%8C%E7%89%B9%E5%A8%9C%E7%93%A6_%E8%A7%92%E8%89%B2%E5%B0%88%E8%BC%AF%E5%B0%81%E9%9D%A2.jpg',
        'https://qianlianwanhua.com/4.webp',
      ],
      imageCount: 3,
      authorId: '3',
      authorAvatar:
          'https://storage.moegirl.org.cn/moegirl/commons/6/64/%E5%B8%B8%E9%99%B8%E8%8C%89%E5%AD%90_%E8%A7%92%E8%89%B2%E5%B0%88%E8%BC%AF%E5%B0%81%E9%9D%A2.jpg',
      authorNickName: '茉子',
      authorLevel: '2',
      communityId: '2',
      communityName: 'Gal游戏综合区',
      communityLogo:
          'https://store.ymgal.games/topic/content/84/845c878a5d8a43188dce03adef76760f.jpeg',
      commentCount: 52,
      likeCount: 200,
    ),
    PostBase(
      postId: '4',
      postType: 'attention',
      postTime: '01-22',
      title: '我不行了😭',
      shortContent: '这是我在游戏社区里的最后一次互动，我很遗憾，我不能继续和其他玩家互动了，我很想知道，其他玩家是否有和我一样的体验。',
      contentImages: [
        'https://storage.moegirl.org.cn/moegirl/commons/8/85/%E5%8F%A2%E9%9B%A8_%E8%A7%92%E8%89%B2%E5%B0%88%E8%BC%AF%E5%B0%81%E9%9D%A2.jpg',
        'https://storage.moegirl.org.cn/moegirl/commons/6/60/%E8%95%BE%E5%A8%9C%C2%B7%E8%8E%89%E5%B8%8C%E7%89%B9%E5%A8%9C%E7%93%A6_%E8%A7%92%E8%89%B2%E5%B0%88%E8%BC%AF%E5%B0%81%E9%9D%A2.jpg',
        'https://qianlianwanhua.com/4.webp',
      ],
      imageCount: 3,
      authorId: '3',
      authorAvatar:
          'https://storage.moegirl.org.cn/moegirl/commons/6/64/%E5%B8%B8%E9%99%B8%E8%8C%89%E5%AD%90_%E8%A7%92%E8%89%B2%E5%B0%88%E8%BC%AF%E5%B0%81%E9%9D%A2.jpg',
      authorNickName: '茉子',
      authorLevel: '2',
      communityId: '2',
      communityName: 'Gal游戏综合区',
      communityLogo:
          'https://store.ymgal.games/topic/content/84/845c878a5d8a43188dce03adef76760f.jpeg',
      commentCount: 52,
      likeCount: 200,
    ),
    PostBase(
      postId: '5',
      postType: 'attention',
      postTime: '01-22',
      title: '我不行了😭',
      shortContent: '这是我在游戏社区里的最后一次互动，我很遗憾，我不能继续和其他玩家互动了，我很想知道，其他玩家是否有和我一样的体验。',
      contentImages: [
        'https://storage.moegirl.org.cn/moegirl/commons/8/85/%E5%8F%A2%E9%9B%A8_%E8%A7%92%E8%89%B2%E5%B0%88%E8%BC%AF%E5%B0%81%E9%9D%A2.jpg',
        'https://storage.moegirl.org.cn/moegirl/commons/6/60/%E8%95%BE%E5%A8%9C%C2%B7%E8%8E%89%E5%B8%8C%E7%89%B9%E5%A8%9C%E7%93%A6_%E8%A7%92%E8%89%B2%E5%B0%88%E8%BC%AF%E5%B0%81%E9%9D%A2.jpg',
        'https://qianlianwanhua.com/4.webp',
      ],
      imageCount: 3,
      authorId: '3',
      authorAvatar:
          'https://storage.moegirl.org.cn/moegirl/commons/6/64/%E5%B8%B8%E9%99%B8%E8%8C%89%E5%AD%90_%E8%A7%92%E8%89%B2%E5%B0%88%E8%BC%AF%E5%B0%81%E9%9D%A2.jpg',
      authorNickName: '茉子',
      authorLevel: '2',
      communityId: '2',
      communityName: 'Gal游戏综合区',
      communityLogo:
          'https://store.ymgal.games/topic/content/84/845c878a5d8a43188dce03adef76760f.jpeg',
      commentCount: 52,
      likeCount: 200,
    ),
  ];
  // 全局共享的游戏社区列表
  final List<CommunityInfo> gameList = [
    CommunityInfo(name: '全部', picture: 'https://qianlianwanhua.com/gsbj.webp'),
    CommunityInfo(
      name: 'CS2',
      picture:
          'https://media.cdn.queniuqe.com/apps/csgo/images/csgo_react//cs2/header_ctt.png',
    ),
    CommunityInfo(
      name: 'Wallpaper...',
      picture:
          'https://www.wallpaperengine.io/assets/img/wpe/wallpaper_engine.gif',
    ),
    CommunityInfo(
      name: 'Steam',
      picture:
          'https://ts2.tc.mm.bing.net/th/id/OIP-C.UC56kzwDjCf3o1uc_hpYyAHaHa?w=108&h=108&c=1&bgcl=6cfca9&r=0&o=7&dpr=1.3&pid=ImgRC&rm=3',
    ),
    CommunityInfo(
      name: '千恋 * 万花',
      picture: 'https://qianlianwanhua.com/gsbj.webp',
    ),
    CommunityInfo(
      name: 'PC游戏',
      picture: 'https://qianlianwanhua.com/gsbj.webp',
    ),
    CommunityInfo(
      name: '刀塔2',
      picture:
          'https://bkimg.cdn.bcebos.com/pic/58ee3d6d55fbb2fb1d69a212464a20a44623dc74?x-bce-process=image/format,f_auto/watermark,image_d2F0ZXIvYmFpa2UyNzI,g_7,xp_5,yp_5,P_20/resize,m_lfit,limit_1,h_1080',
    ),
    CommunityInfo(
      name: '古墓丽影',
      picture:
          'https://bkimg.cdn.bcebos.com/pic/d8f9d72a6059252dbe52cc48379b033b5bb5b931?x-bce-process=image/format,f_auto/watermark,image_d2F0ZXIvYmFpa2UyNzI,g_7,xp_5,yp_5,P_20/resize,m_lfit,limit_1,h_1080',
    ),
  ];
  // 全局共享的关注好友
  final List<AttentionUserInfo> attentionUserList = [
    AttentionUserInfo(
      newMessage: true,
      name: '常陆 茉子',
      picture:
          'https://storage.moegirl.org.cn/moegirl/commons/6/64/%E5%B8%B8%E9%99%B8%E8%8C%89%E5%AD%90_%E8%A7%92%E8%89%B2%E5%B0%88%E8%BC%AF%E5%B0%81%E9%9D%A2.jpg',
    ),
    AttentionUserInfo(
      newMessage: false,
      name: '常陆 茉子',
      picture:
          'https://storage.moegirl.org.cn/moegirl/commons/6/64/%E5%B8%B8%E9%99%B8%E8%8C%89%E5%AD%90_%E8%A7%92%E8%89%B2%E5%B0%88%E8%BC%AF%E5%B0%81%E9%9D%A2.jpg',
    ),
    AttentionUserInfo(
      newMessage: true,
      name: '常陆 茉子',
      picture:
          'https://storage.moegirl.org.cn/moegirl/commons/6/64/%E5%B8%B8%E9%99%B8%E8%8C%89%E5%AD%90_%E8%A7%92%E8%89%B2%E5%B0%88%E8%BC%AF%E5%B0%81%E9%9D%A2.jpg',
    ),
    AttentionUserInfo(
      newMessage: false,
      name: '常陆 茉子',
      picture:
          'https://storage.moegirl.org.cn/moegirl/commons/6/64/%E5%B8%B8%E9%99%B8%E8%8C%89%E5%AD%90_%E8%A7%92%E8%89%B2%E5%B0%88%E8%BC%AF%E5%B0%81%E9%9D%A2.jpg',
    ),
    AttentionUserInfo(
      newMessage: false,
      name: '常陆 茉子',
      picture:
          'https://storage.moegirl.org.cn/moegirl/commons/6/64/%E5%B8%B8%E9%99%B8%E8%8C%89%E5%AD%90_%E8%A7%92%E8%89%B2%E5%B0%88%E8%BC%AF%E5%B0%81%E9%9D%A2.jpg',
    ),
    AttentionUserInfo(
      newMessage: false,
      name: '常陆 茉子',
      picture:
          'https://storage.moegirl.org.cn/moegirl/commons/6/64/%E5%B8%B8%E9%99%B8%E8%8C%89%E5%AD%90_%E8%A7%92%E8%89%B2%E5%B0%88%E8%BC%AF%E5%B0%81%E9%9D%A2.jpg',
    ),
    AttentionUserInfo(
      newMessage: true,
      name: '常陆 茉子',
      picture:
          'https://storage.moegirl.org.cn/moegirl/commons/6/64/%E5%B8%B8%E9%99%B8%E8%8C%89%E5%AD%90_%E8%A7%92%E8%89%B2%E5%B0%88%E8%BC%AF%E5%B0%81%E9%9D%A2.jpg',
    ),
    AttentionUserInfo(
      newMessage: false,
      name: '常陆 茉子',
      picture:
          'https://storage.moegirl.org.cn/moegirl/commons/6/64/%E5%B8%B8%E9%99%B8%E8%8C%89%E5%AD%90_%E8%A7%92%E8%89%B2%E5%B0%88%E8%BC%AF%E5%B0%81%E9%9D%A2.jpg',
    ),
    AttentionUserInfo(
      newMessage: false,
      name: '常陆 茉子M',
      picture:
          'https://storage.moegirl.org.cn/moegirl/commons/6/64/%E5%B8%B8%E9%99%B8%E8%8C%89%E5%AD%90_%E8%A7%92%E8%89%B2%E5%B0%88%E8%BC%AF%E5%B0%81%E9%9D%A2.jpg',
    ),
    AttentionUserInfo(
      newMessage: false,
      name: '常陆 茉子N',
      picture:
          'https://storage.moegirl.org.cn/moegirl/commons/6/64/%E5%B8%B8%E9%99%B8%E8%8C%89%E5%AD%90_%E8%A7%92%E8%89%B2%E5%B0%88%E8%BC%AF%E5%B0%81%E9%9D%A2.jpg',
    ),
  ];
}
