class SliderInfo {
  final String communityId;
  final String? imageUrl;
  final String? videoUrl;
  final String? title;

  SliderInfo({
    required this.communityId,
    this.imageUrl,
    this.videoUrl,
    this.title,
  });
  factory SliderInfo.fromJson(Map<String, dynamic> json) {
    return SliderInfo(
      communityId: json['communityId'],
      imageUrl: json['imageUrl'],
      videoUrl: json['videoUrl'],
      title: json['title'],
    );
  }
}
