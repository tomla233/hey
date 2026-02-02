class TagCardEntity {
  final String tagName;
  final String tagIcon;

  TagCardEntity({required this.tagName, required this.tagIcon});

  factory TagCardEntity.fromJson(Map<String, dynamic> json) {
    return TagCardEntity(tagName: json['tagName'], tagIcon: json['tagIcon']);
  }
}
