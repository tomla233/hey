class SliderInfo {
  final String communityId;
  final String imageUrl;
  final String? title;

  SliderInfo({
    required this.communityId,
    required this.imageUrl,
    this.title,
  });
  factory SliderInfo.fromJson(Map<String, dynamic> json) {
    return SliderInfo(
      communityId: json['communityId'],
      imageUrl: json['imageUrl'],
      title: json['title'],
    );
  }
}
