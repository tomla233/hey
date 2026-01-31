import 'package:flutter/material.dart';
import 'package:hey/components/common/CustomDivider.dart';
import 'package:hey/components/common/CustomOutlinedButton.dart';
import 'package:hey/components/common/Search.dart';
import 'package:hey/models/home/CommunityInfo.dart';
import 'package:hey/utils/MsgUtil.dart';
import 'package:hey/utils/StrUtil.dart';
import 'package:hey/utils/VibrationUtil.dart';

/// 偏好设置
class PreferenceSetting extends StatefulWidget {
  const PreferenceSetting({super.key});

  @override
  State<PreferenceSetting> createState() => _PreferenceSettingState();
}

class _PreferenceSettingState extends State<PreferenceSetting> {
  // 编辑状态标记
  bool isEditing = false;
  //图片宽度
  double imageWidth = 58;
  // 搜索关键词
  String _searchKeyword = '';
  void _onBtnClick() {
    if (isEditing) {
        MsgUtil.show('点击了【完成】按钮');
      }
    setState(() {
      // 切换编辑状态
      isEditing = !isEditing;
    });
  }

  // 已关注
  List<CommunityInfo> followedCommunityList = [
    CommunityInfo(
      communityId: '1',
      communityName: '千恋*万花',
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
      // 添加到原始未关注列表
      _originalUnFollowedCommunityList.insert(0, community);
      // 重新筛选
      _filterUnFollowedList();
    });
  }

  // 点击加号
  void _onPlusClick(CommunityInfo community) {
    setState(() {
      _originalUnFollowedCommunityList.remove(community);
      followedCommunityList.add(community);
      // 重新筛选
      _filterUnFollowedList();
    });
  }

  // 长按卡片触发图标显示
  void _onCardLongPress() {
    if (!isEditing) {
      //震动
      VibrationUtil.lightVibrate();
      setState(() {
        isEditing = true;
      });
    }
  }

  // 原始未关注列表（数据源）
  final List<CommunityInfo> _originalUnFollowedCommunityList = [
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

  // 筛选后的未关注列表
  late List<CommunityInfo> _filteredUnFollowedCommunityList;
  @override
  void initState() {
    super.initState();
    // 初始化筛选列表
    _filteredUnFollowedCommunityList = List.from(
      _originalUnFollowedCommunityList,
    );
  }

  // 根据搜索关键词筛选
  void _filterUnFollowedList() {
    if (_searchKeyword.isEmpty) {
      _filteredUnFollowedCommunityList = List.from(
        _originalUnFollowedCommunityList,
      );
    } else {
      _filteredUnFollowedCommunityList = _originalUnFollowedCommunityList
          .where(
            (community) => community.communityName.startsWith(_searchKeyword),
          )
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    // 统一padding
    final double hPadding = 10;
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
                  setState(() {
                    _searchKeyword = value;
                    // 重新筛选列表
                    _filterUnFollowedList();
                  });
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
            child: _buildCardView(
              _filteredUnFollowedCommunityList,
              false,
              cardWidth,
            ),
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
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
        // const SizedBox(height: 10),
        Wrap(
          spacing: 6, // 列之间的水平间距
          runSpacing: 10, // 行之间的垂直间距
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
                    } else {
                      MsgUtil.show("点击了【${community.communityName}】");
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8, right: 8),
                            child: Container(
                              width: imageWidth,
                              height: imageWidth,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Image.network(
                                community.picture,
                                width: imageWidth,
                                height: imageWidth,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(
                                      Icons.image,
                                      size: 48,
                                      color: Colors.grey,
                                    ),
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      } else {
                                        return const Icon(
                                          Icons.image,
                                          size: 48,
                                          color: Colors.grey,
                                        );
                                      }
                                    },
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
                      Padding(
                        // 补偿图片的right:8偏移
                        padding: const EdgeInsets.only(right: 8),
                        child: SizedBox(
                          width: imageWidth,
                          child: Text(
                            StrUtil.limitTextLength(
                              community.communityName,
                              maxLength: 8,
                            ),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
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
