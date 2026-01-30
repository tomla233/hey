//社区基础类
class CommunityInfo {
  String communityId;
  String communityName;
  String picture;

  CommunityInfo({required this.communityName, required this.picture, required this.communityId});

  factory CommunityInfo.fromJson(Map<String, dynamic> json) {
    return CommunityInfo(
      communityId: json['communityId'],
      communityName: json['communityName'],
      picture: json['picture'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'communityId': communityId,
      'communityName': communityName,
      'picture': picture,
    };
  }
}