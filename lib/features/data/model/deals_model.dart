class DealsHotel {
  String? hotelPlaceName;
  String? hotelName;
  String? hotelPrice;
  String? hotelTitle;
  String? hotelDescription;
  String? hotelDealsStartedAt;
  String? hotelImage;
  ExtraDealsDetails? extraDealsDetails;

  DealsHotel({this.hotelPlaceName,this.hotelName,this.hotelPrice,this.hotelTitle,
  this.hotelDescription,this.hotelDealsStartedAt,this.hotelImage, this.extraDealsDetails});

  DealsHotel.fromJson(Map map){
    hotelPlaceName = map['hotelPlaceName'];
    hotelName = map['hotelName'];
    hotelPrice = map['hotelPrice'];
    hotelTitle = map['hotelTitle'];
    hotelDescription = map['hotelDescription'];
    hotelDealsStartedAt = map['hotelDealsStartedAt'];
    hotelImage = map['hotelImage'];
    extraDealsDetails = map['extraDealsDetails'];
  }

  Map<String, dynamic> toJson(){
    final map = <String, dynamic>{};
    map['hotelPlaceName'] = hotelPlaceName;
    map['hotelName'] = hotelName;
    map['hotelPrice'] = hotelPrice;
    map['hotelTitle'] = hotelTitle;
    map['hotelDescription'] = hotelDescription;
    map['hotelDealsStartedAt'] = hotelDealsStartedAt;
    map['hotelImage'] = hotelImage;
    map['extraDealsDetails'] = extraDealsDetails;
    return map;
  }

}


class ExtraDealsDetails {
  String? hotelDistance;
  String? hotelMerit;
  ExtraDealsDetails({this.hotelDistance,this.hotelMerit});

  ExtraDealsDetails.fromJson(Map map){
    hotelDistance = map['hotelDistance'];
    hotelMerit = map['hotelMerit'];

  }

  Map<String, dynamic> toJson(){
    final map = <String, dynamic>{};
    map['hotelDistance'] = hotelDistance;
    map['hotelMerit'] = hotelMerit;
    return map;
  }
}
