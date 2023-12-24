class DealsTopDetails {
  String? bookInfo;
  String? scheduleData;
  String? discountInfo;
  DealsTopDetails({this.bookInfo,this.scheduleData,this.discountInfo});

  DealsTopDetails.fromJson(Map map){
    bookInfo = map['bookInfo'];
    scheduleData = map['scheduleData'];
    discountInfo = map['discountInfo'];

  }

  Map<String, dynamic> toJson(){
    final map = <String, dynamic>{};
    map['bookInfo'] = bookInfo;
    map['scheduleData'] = scheduleData;
    map['discountInfo'] = discountInfo;
    return map;
  }
}