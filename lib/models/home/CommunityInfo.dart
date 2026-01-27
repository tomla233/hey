class CommunityInfo {
  String name;
  String picture;

  CommunityInfo({required this.name, required this.picture});

  factory CommunityInfo.fromJson(Map<String, dynamic> json) {
    return CommunityInfo(
      name: json['name'],
      picture: json['picture'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'picture': picture,
    };
  }
}