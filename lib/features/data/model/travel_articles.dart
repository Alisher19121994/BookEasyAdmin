class TravelArticles {
  String? title;
  String? description;
  String? dates;
  String? image;

  TravelArticles({this.title, this.description, this.dates, this.image});

  TravelArticles.fromJson(Map map) {
    title = map['title'];
    description = map['description'];
    dates = map['dates'];
    image = map['image'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['description'] = description;
    map['dates'] = dates;
    map['image'] = image;
    return map;
  }
}
