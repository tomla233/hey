class AttentionUserInfo {
  String name;
  String picture;
  // 是否有新动态
  bool newMessage;

  AttentionUserInfo({required this.name, required this.picture, required this.newMessage});

  factory AttentionUserInfo.fromJson(Map<String, dynamic> json) {
    return AttentionUserInfo(
      name: json['name'],
      picture: json['picture'],
      newMessage: json['newMessage'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'picture': picture,
      'newMessage': newMessage,
    };
  }
}