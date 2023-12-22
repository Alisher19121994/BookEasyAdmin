class EatAndDrinks {
  String? foodTitle;
  String? foodDescription;
  String? foodName;
  String? drinkName;
  String? foodImage;

  EatAndDrinks(
      {this.foodTitle,
      this.foodDescription,
      this.foodName,
      this.drinkName,
      this.foodImage});

  EatAndDrinks.fromJson(Map map) {
    foodTitle = map['foodTitle'];
    foodDescription = map['foodDescription'];
    foodName = map['foodName'];
    drinkName = map['drinkName'];
    foodImage = map['foodImage'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    map['foodTitle'] = foodTitle;
    map['foodDescription'] = foodDescription;
    map['foodName'] = foodName;
    map['drinkName'] = drinkName;
    map['foodImage'] = foodImage;
    return map;
  }
}
