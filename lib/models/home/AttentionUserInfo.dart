class AttentionUserInfo {
  String name;
  String picture;

  AttentionUserInfo({required this.name, required this.picture});

  factory AttentionUserInfo.fromJson(Map<String, dynamic> json) {
    return AttentionUserInfo(
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