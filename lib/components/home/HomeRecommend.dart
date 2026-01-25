import 'package:flutter/material.dart';
import 'package:hey/constant/ColorConstants.dart';
import 'package:hey/models/home/NamePicture.dart';
import 'package:hey/models/home/PostBase.dart';
import 'package:hey/utils/ToastUtils.dart';

class HomeRecommend extends StatefulWidget {
  const HomeRecommend({super.key});

  @override
  State<HomeRecommend> createState() => _HomeRecommendState();
}

class _HomeRecommendState extends State<HomeRecommend> {
  final List<Namepicture> _gameList = [
    Namepicture(name: '全部', picture: 'https://qianlianwanhua.com/gsbj.webp'),
    Namepicture(
      name: 'CS2',
      picture:
          'https://media.cdn.queniuqe.com/apps/csgo/images/csgo_react//cs2/header_ctt.png',
    ),
    Namepicture(
      name: 'Wallpaper...',
      picture:
          'https://www.wallpaperengine.io/assets/img/wpe/wallpaper_engine.gif',
    ),
    Namepicture(
      name: 'Steam',
      picture:
          'https://ts2.tc.mm.bing.net/th/id/OIP-C.UC56kzwDjCf3o1uc_hpYyAHaHa?w=108&h=108&c=1&bgcl=6cfca9&r=0&o=7&dpr=1.3&pid=ImgRC&rm=3',
    ),
    Namepicture(
      name: '千恋 * 万花',
      picture: 'https://qianlianwanhua.com/gsbj.webp',
    ),
    Namepicture(name: 'PC游戏', picture: 'https://qianlianwanhua.com/gsbj.webp'),
    Namepicture(
      name: '刀塔2',
      picture:
          'https://bkimg.cdn.bcebos.com/pic/58ee3d6d55fbb2fb1d69a212464a20a44623dc74?x-bce-process=image/format,f_auto/watermark,image_d2F0ZXIvYmFpa2UyNzI,g_7,xp_5,yp_5,P_20/resize,m_lfit,limit_1,h_1080',
    ),
    Namepicture(
      name: '古墓丽影',
      picture:
          'https://bkimg.cdn.bcebos.com/pic/d8f9d72a6059252dbe52cc48379b033b5bb5b931?x-bce-process=image/format,f_auto/watermark,image_d2F0ZXIvYmFpa2UyNzI,g_7,xp_5,yp_5,P_20/resize,m_lfit,limit_1,h_1080',
    ),
  ];
  final List<dynamic> _postList = [
    PostBase(
      postId: '1',
      title: '有没有互动性强的galgame推荐一下',
      shortContent: '前阵子千恋万花不是史低嘛，然后煮啵就去买了，画风挺可爱的，但是选项太少了，看了很久的剧情才弹出...',
      contentImages: [
        'https://qianlianwanhua.com/gsbj.webp',
        'https://qianlianwanhua.com/2.webp',
        'https://qianlianwanhua.com/4.webp',
      ],
      authorAvatar:
          'https://c-ssl.dtstatic.com/uploads/blog/202206/12/20220612164733_72d8b.thumb.400_0.jpg',
      authorNickName: '小怪兽',
      authorLevel: '8',
      communityName: '千恋 * 万花',
      communityLogo: 'https://qianlianwanhua.com/222.webp',
      commentCount: 52,
      likeCount: 200,
    ).toJson(),
    PostBase(
      postId: '2',
      title: '有没有互动性强的galgame推荐一下',
      shortContent: '前阵子千恋万花不是史低嘛，然后煮啵就去买了，画风挺可爱的，但是选项太少了，看了很久的剧情才弹出...',
      contentImages: [
        'https://qianlianwanhua.com/gsbj.webp',
        'https://qianlianwanhua.com/2.webp',
        'https://qianlianwanhua.com/4.webp',
      ],
      authorAvatar:
          'https://c-ssl.dtstatic.com/uploads/blog/202206/12/20220612164733_72d8b.thumb.400_0.jpg',
      authorNickName: '小怪兽',
      authorLevel: '4',
      communityName: '千恋 * 万花',
      communityLogo: 'https://qianlianwanhua.com/222.webp',
      commentCount: 52,
      likeCount: 200,
    ).toJson(),
    PostBase(
      postId: '3',
      title: '有没有互动性强的galgame推荐一下',
      shortContent: '前阵子千恋万花不是史低嘛，然后煮啵就去买了，画风挺可爱的，但是选项太少了，看了很久的剧情才弹出...',
      contentImages: [
        'https://qianlianwanhua.com/gsbj.webp',
        'https://qianlianwanhua.com/2.webp',
        'https://qianlianwanhua.com/4.webp',
      ],
      authorAvatar:
          'https://c-ssl.dtstatic.com/uploads/blog/202206/12/20220612164733_72d8b.thumb.400_0.jpg',
      authorNickName: '小怪兽',
      authorLevel: '2',
      communityName: '千恋 * 万花',
      communityLogo: 'https://qianlianwanhua.com/222.webp',
      commentCount: 52,
      likeCount: 200,
    ).toJson(),
  ];
  // 下拉刷新
  Future<void> _onRefresh() async {
    await Future.delayed(
      const Duration(seconds: 2),
      () => {
        if (mounted) {ToastUtils.showToast(context, '已推荐10条新内容')},
      },
    );
  }

  Widget _buildPostItem() {
    return const Text('data');
  }

  Widget _buildGameCardList() {
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(top: 16),
            itemCount: _gameList.length,
            itemBuilder: (context, index) {
              //index为0时，显示全部
              if (index == 0) {
                return Column(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          'lib/assets/all.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      _gameList[index].name,
                      style: const TextStyle(
                        fontSize: 10,
                        color: ColorConstants.primaryBlack,
                      ),
                    ),
                  ],
                );
              }
              return Column(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        _gameList[index].picture,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'lib/assets/box.png',
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          );
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return Image.asset(
                              'lib/assets/box.png',
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    _gameList[index].name,
                    style: const TextStyle(
                      fontSize: 10,
                      color: ColorConstants.primaryBlack,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Divider(height: 1, thickness: 4, color: ColorConstants.dividerColor),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView.builder(
        itemCount: 1 + _postList.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildGameCardList();
          } else {
            return _buildPostItem();
          }
        },
      ),
    );
  }
}
