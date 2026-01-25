class Namepicture {
  String name;
  String picture;

  Namepicture({required this.name, required this.picture});

  factory Namepicture.fromJson(Map<String, dynamic> json) {
    return Namepicture(
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