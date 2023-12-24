class DealsHotel {
  String? hotelPlaceName;
  String? hotelName;
  String? hotelPrice;
  String? hotelTitle;

  String? hotelFoodDescription;
  String? hotelPriceDescription;
  String? hotelRoomDescription;
  String? hotelTaxDescription;
  String? hotelFreeCancellationDescription;
  String? hotelPaymentDescription;

  String? hotelDealsStartedAt;
  String? hotelImage;
  ExtraDealsDetails? extraDealsDetails;

  DealsHotel(
      {this.hotelPlaceName,
      this.hotelName,
      this.hotelPrice,
      this.hotelTitle,
      this.hotelFoodDescription,
      this.hotelPriceDescription,
      this.hotelRoomDescription,
      this.hotelTaxDescription,
      this.hotelFreeCancellationDescription,
      this.hotelPaymentDescription,
      this.hotelDealsStartedAt,
      this.hotelImage,
      this.extraDealsDetails});

  DealsHotel.fromJson(Map map) {
    hotelPlaceName = map['hotelPlaceName'];
    hotelName = map['hotelName'];
    hotelPrice = map['hotelPrice'];
    hotelTitle = map['hotelTitle'];

    hotelFoodDescription = map['hotelPaymentDescription'];
    hotelPriceDescription = map['hotelPriceDescription'];
    hotelRoomDescription = map['hotelRoomDescription'];
    hotelTaxDescription = map['hotelTaxDescription'];
    hotelFreeCancellationDescription = map['hotelFreeCancellationDescription'];
    hotelPaymentDescription = map['hotelPaymentDescription'];
    hotelDealsStartedAt = map['hotelDealsStartedAt'];
    hotelImage = map['hotelImage'];
    extraDealsDetails = map['extraDealsDetails'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['hotelPlaceName'] = hotelPlaceName;
    map['hotelName'] = hotelName;
    map['hotelPrice'] = hotelPrice;
    map['hotelTitle'] = hotelTitle;

    map['hotelFoodDescription'] = hotelFoodDescription;
    map['hotelPaymentDescription'] = hotelPaymentDescription;
    map['hotelPriceDescription'] = hotelPriceDescription;
    map['hotelRoomDescription'] = hotelRoomDescription;
    map['hotelTaxDescription'] = hotelTaxDescription;
    map['hotelFreeCancellationDescription'] = hotelFreeCancellationDescription;
    map['hotelPaymentDescription'] = hotelPaymentDescription;

    map['hotelDealsStartedAt'] = hotelDealsStartedAt;
    map['hotelImage'] = hotelImage;
    map['extraDealsDetails'] = extraDealsDetails;
    return map;
  }
}

class ExtraDealsDetails {
  String? hotelDistance;
  String? hotelMerit;

  ExtraDealsDetails({this.hotelDistance, this.hotelMerit});

  ExtraDealsDetails.fromJson(Map map) {
    hotelDistance = map['hotelDistance'];
    hotelMerit = map['hotelMerit'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['hotelDistance'] = hotelDistance;
    map['hotelMerit'] = hotelMerit;
    return map;
  }
}
