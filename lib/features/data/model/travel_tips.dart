class TravelTips {
  String? title;
  String? description;
  String? image;

  TravelTips({this.title, this.description, this.image});

  TravelTips.fromJson(Map map) {
    title = map['title'];
    description = map['description'];
    image = map['image'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['description'] = description;
    map['image'] = image;
    return map;
  }
}
