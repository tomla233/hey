import 'package:flutter/material.dart';
import 'package:hey/components/common/CustomDivider.dart';
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
  // 已关注
  List<CommunityInfo> followedCommunityList = [
    CommunityInfo(
      communityId: '1',
      communityName: '案例1',
      picture: 'lib/assets/box.png',
    ),
    CommunityInfo(
      communityId: '2',
      communityName: '案例2',
      picture: 'lib/assets/box.png',
    ),
    CommunityInfo(
      communityId: '3',
      communityName: '案例3',
      picture: 'lib/assets/box.png',
    ),
    CommunityInfo(
      communityId: '4',
      communityName: '案例4',
      picture: 'lib/assets/box.png',
    ),
    CommunityInfo(
      communityId: '5',
      communityName: '案例5',
      picture: 'lib/assets/box.png',
    ),
  ];
  // 未关注列表
  List<CommunityInfo> unFollowedCommunityList = [
    CommunityInfo(
      communityId: '6',
      communityName: '案例6',
      picture: 'lib/assets/box.png',
    ),
    CommunityInfo(
      communityId: '7',
      communityName: '案例7',
      picture: 'lib/assets/box.png',
    ),
    CommunityInfo(
      communityId: '8',
      communityName: '案例8',
      picture: 'lib/assets/box.png',
    ),
    CommunityInfo(
      communityId: '9',
      communityName: '案例9',
      picture: 'lib/assets/box.png',
    ),
    CommunityInfo(
      communityId: '10',
      communityName: '案例10',
      picture: 'lib/assets/box.png',
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
                onTap: () {
                  setState(() {
                    // 切换编辑状态
                    isEditing = !isEditing;
                  });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.edit_outlined, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      isEditing ? '完成' : '管理',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(
                      community.picture,
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.image, size: 48, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    width: 48,
                    child: Text(
                      community.communityName,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  /// 构建单个社区卡片
}
