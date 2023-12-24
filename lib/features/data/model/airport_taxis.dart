class AirportTaxisModel {
  String? title;
  String? description;
  String? pickUpLocation;
  String? destination;
  String? tellUsWhen;

  AirportTaxisModel(
      {this.title,
      this.description,
      this.pickUpLocation,
      this.destination,
      this.tellUsWhen});

  AirportTaxisModel.fromJson(Map map) {
    title = map['title'];
    description = map['description'];
    pickUpLocation = map['pickUpLocation'];
    destination = map['destination'];
    tellUsWhen = map['tellUsWhen'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['description'] = description;
    map['pickUpLocation'] = pickUpLocation;
    map['destination'] = destination;
    map['tellUsWhen'] = tellUsWhen;
    return map;
  }
}
