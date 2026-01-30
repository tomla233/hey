import 'package:flutter/material.dart';
import 'package:hey/components/common/CustomDivider.dart';
import 'package:hey/components/common/CustomOutlinedButton.dart';
import 'package:hey/components/common/Search.dart';
import 'package:hey/models/home/CommunityInfo.dart';

class PreferenceSetting extends StatefulWidget {
  const PreferenceSetting({super.key});

  @override
  State<PreferenceSetting> createState() => _PreferenceSettingState();
}

class _PreferenceSettingState extends State<PreferenceSetting> {
  // 编辑状态标记
  bool isEditing = false;
  void _onBtnClick() {
    setState(() {
      // 切换编辑状态
      isEditing = !isEditing;
    });
  }

  // 已关注
  List<CommunityInfo> followedCommunityList = [
    CommunityInfo(
      communityId: '1',
      communityName: '千恋*万花1',
      picture: 'https://qianlianwanhua.com/gsbj.webp',
    ),
    CommunityInfo(
      communityId: '2',
      communityName: '千恋*万花2',
      picture: 'https://qianlianwanhua.com/gsbj.webp',
    ),
  ];
  // 点击减号
  void _onMinusClick(CommunityInfo community) {
    setState(() {
      followedCommunityList.remove(community);
      unFollowedCommunityList.insert(0, community);
    });
  }

  // 点击加号
  void _onPlusClick(CommunityInfo community) {
    setState(() {
      unFollowedCommunityList.remove(community);
      followedCommunityList.add(community);
    });
  }

  // 长按卡片触发图标显示
  void _onCardLongPress() {
    if (!isEditing) {
      setState(() {
        isEditing = true;
      });
    }
  }

  // 未关注列表
  List<CommunityInfo> unFollowedCommunityList = [
    CommunityInfo(
      communityId: '6',
      communityName: '千恋*万花6',
      picture: 'https://qianlianwanhua.com/gsbj.webp',
    ),
    CommunityInfo(
      communityId: '7',
      communityName: '千恋*万花7',
      picture: 'https://qianlianwanhua.com/gsbj.webp',
    ),
    CommunityInfo(
      communityId: '8',
      communityName: '千恋*万花8',
      picture: 'https://qianlianwanhua.com/gsbj.webp',
    ),
    CommunityInfo(
      communityId: '9',
      communityName: '千恋*万花9',
      picture: 'https://qianlianwanhua.com/gsbj.webp',
    ),
    CommunityInfo(
      communityId: '10',
      communityName: '千恋*万花10',
      picture: 'https://qianlianwanhua.com/gsbj.webp',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    // 统一padding
    final double hPadding = 20;
    // 计算每个卡片的宽度
    final double screenWidth = MediaQuery.of(context).size.width;
    final double cardWidth = (screenWidth - hPadding * 2 - 24) / 4;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '偏好设置',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: hPadding,
              left: hPadding,
              right: hPadding,
            ),
            child: SizedBox(
              height: 30,
              child: Search(
                onTextChanged: (String value) {
                  print('搜索内容变化：$value');
                },
              ),
            ),
          ),
          //我的偏好
          Padding(
            padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: 10),
            child: _buildCardView(followedCommunityList, true, cardWidth),
          ),
          const CustomDivider(),
          // 更多推荐
          Padding(
            padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: 10),
            child: _buildCardView(unFollowedCommunityList, false, cardWidth),
          ),
        ],
      ),
    );
  }

  Widget _buildCardView(
    List<CommunityInfo> communityList,
    bool isFollowed,
    double cardWidth,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              isFollowed ? '我的偏好' : '更多推荐',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            if (isFollowed)
              GestureDetector(
                onTap: _onBtnClick,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (!isEditing) const Icon(Icons.settings, size: 16),
                    const SizedBox(width: 4),
                    if (!isEditing)
                      const Text(
                        '管理',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    else
                      CustomOutlinedButton(onPressed: _onBtnClick),
                  ],
                ),
              ),
          ],
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 8, // 列之间的水平间距
          runSpacing: 12, // 行之间的垂直间距
          children: communityList.map((community) {
            return SizedBox(
              width: cardWidth,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onLongPress: _onCardLongPress,
                  onTap: () {
                    if (isEditing) {
                      if (isFollowed) {
                        _onMinusClick(community);
                      } else {
                        _onPlusClick(community);
                      }
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        // clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8, right: 8),
                              child: Image.network(
                                community.picture,
                                width: 48,
                                height: 48,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(
                                      Icons.image,
                                      size: 48,
                                      color: Colors.grey,
                                    ),
                              ),
                            ),
                          ),
                          if (isEditing)
                            Positioned(
                              top: 0,
                              right: 0,
                              child: GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () {
                                  if (isFollowed) {
                                    _onMinusClick(community);
                                  } else {
                                    _onPlusClick(community);
                                  }
                                },
                                child: Container(
                                  width: 16,
                                  height: 16,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: isFollowed
                                        ? const Color(0xFFC9CED2)
                                        : Colors.black,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    isFollowed ? Icons.remove : Icons.add,
                                    size: 10,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      SizedBox(
                        width: 48,
                        child: Text(
                          community.communityName,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
