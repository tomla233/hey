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
      title: '有没有互动性强的galgame推荐一下',
      shortContent: '前阵子千恋万花不是史低嘛，然后煮啵就去买了，画风挺可爱的，但是选项太少了，看了很久的剧情才弹出...',
      contentImages: [
        'https://qianlianwanhua.com/gsbj.webp',
        'https://qianlianwanhua.com/2.webp',
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
      title: '有没有互动性强的galgame推荐一下',
      shortContent: '前阵子千恋万花不是史低嘛，然后煮啵就去买了，画风挺可爱的，但是选项太少了，看了很久的剧情才弹出...',
      contentImages: [
        'https://qianlianwanhua.com/gsbj.webp',
        'https://qianlianwanhua.com/2.webp',
        'https://qianlianwanhua.com/4.webp',
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
      title: '有没有互动性强的galgame推荐一下',
      shortContent: '前阵子千恋万花不是史低嘛，然后煮啵就去买了，画风挺可爱的，但是选项太少了，看了很久的剧情才弹出...',
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
    CommunityInfo(name: 'PC游戏', picture: 'https://qianlianwanhua.com/gsbj.webp'),
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
    AttentionUserInfo(name: '常陆 茉子', picture: 'https://storage.moegirl.org.cn/moegirl/commons/6/64/%E5%B8%B8%E9%99%B8%E8%8C%89%E5%AD%90_%E8%A7%92%E8%89%B2%E5%B0%88%E8%BC%AF%E5%B0%81%E9%9D%A2.jpg'),
    AttentionUserInfo(name: '常陆 茉子', picture: 'https://storage.moegirl.org.cn/moegirl/commons/6/64/%E5%B8%B8%E9%99%B8%E8%8C%89%E5%AD%90_%E8%A7%92%E8%89%B2%E5%B0%88%E8%BC%AF%E5%B0%81%E9%9D%A2.jpg'),
    AttentionUserInfo(name: '常陆 茉子', picture: 'https://storage.moegirl.org.cn/moegirl/commons/6/64/%E5%B8%B8%E9%99%B8%E8%8C%89%E5%AD%90_%E8%A7%92%E8%89%B2%E5%B0%88%E8%BC%AF%E5%B0%81%E9%9D%A2.jpg'),
    AttentionUserInfo(name: '常陆 茉子', picture: 'https://storage.moegirl.org.cn/moegirl/commons/6/64/%E5%B8%B8%E9%99%B8%E8%8C%89%E5%AD%90_%E8%A7%92%E8%89%B2%E5%B0%88%E8%BC%AF%E5%B0%81%E9%9D%A2.jpg'),
    AttentionUserInfo(name: '常陆 茉子', picture: 'https://storage.moegirl.org.cn/moegirl/commons/6/64/%E5%B8%B8%E9%99%B8%E8%8C%89%E5%AD%90_%E8%A7%92%E8%89%B2%E5%B0%88%E8%BC%AF%E5%B0%81%E9%9D%A2.jpg'),
    AttentionUserInfo(name: '常陆 茉子', picture: 'https://storage.moegirl.org.cn/moegirl/commons/6/64/%E5%B8%B8%E9%99%B8%E8%8C%89%E5%AD%90_%E8%A7%92%E8%89%B2%E5%B0%88%E8%BC%AF%E5%B0%81%E9%9D%A2.jpg'),
    AttentionUserInfo(name: '常陆 茉子', picture: 'https://storage.moegirl.org.cn/moegirl/commons/6/64/%E5%B8%B8%E9%99%B8%E8%8C%89%E5%AD%90_%E8%A7%92%E8%89%B2%E5%B0%88%E8%BC%AF%E5%B0%81%E9%9D%A2.jpg'),
    AttentionUserInfo(name: '常陆 茉子', picture: 'https://storage.moegirl.org.cn/moegirl/commons/6/64/%E5%B8%B8%E9%99%B8%E8%8C%89%E5%AD%90_%E8%A7%92%E8%89%B2%E5%B0%88%E8%BC%AF%E5%B0%81%E9%9D%A2.jpg'),
    AttentionUserInfo(name: '常陆 茉子M', picture: 'https://storage.moegirl.org.cn/moegirl/commons/6/64/%E5%B8%B8%E9%99%B8%E8%8C%89%E5%AD%90_%E8%A7%92%E8%89%B2%E5%B0%88%E8%BC%AF%E5%B0%81%E9%9D%A2.jpg'),
    AttentionUserInfo(name: '常陆 茉子N', picture: 'https://storage.moegirl.org.cn/moegirl/commons/6/64/%E5%B8%B8%E9%99%B8%E8%8C%89%E5%AD%90_%E8%A7%92%E8%89%B2%E5%B0%88%E8%BC%AF%E5%B0%81%E9%9D%A2.jpg'),
  ];
}
