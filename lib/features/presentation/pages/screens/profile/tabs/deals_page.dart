import 'package:book_easy_admin/features/data/model/deals_book_details_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../../data/model/deals_model.dart';
import '../../../../widgets/profile/deals_items.dart';

class DealsPage extends StatefulWidget {
  const DealsPage({super.key});
  static const String id = 'DealsPage';
  @override
  State<DealsPage> createState() => _DealsPageState();
}

class _DealsPageState extends State<DealsPage> {

  final CollectionReference destinations = FirebaseFirestore.instance.collection('Destinations');

  final _formKeyBook = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();

  TextEditingController hotelPlaceNameController = TextEditingController();
  TextEditingController hotelNameController = TextEditingController();
  TextEditingController hotelPriceController = TextEditingController();
  TextEditingController hotelTitleController = TextEditingController();

  TextEditingController hotelFoodDescription = TextEditingController();
  TextEditingController hotelPriceDescription = TextEditingController();
  TextEditingController hotelRoomDescription = TextEditingController();
  TextEditingController hotelTaxDescription = TextEditingController();
  TextEditingController hotelFreeCancellationDescription = TextEditingController();
  TextEditingController hotelPaymentDescription = TextEditingController();

  TextEditingController hotelDealsStartedAtController = TextEditingController();
  TextEditingController hotelDistanceController = TextEditingController();
  TextEditingController hotelMeritController = TextEditingController();

  TextEditingController bookDetailsController = TextEditingController();
  TextEditingController scheduleDataController = TextEditingController();
  TextEditingController discountInfoController = TextEditingController();

  Future<String?> addCollection(DealsHotel dealsHotel)async{
    final CollectionReference destinations = FirebaseFirestore.instance.collection('Destinations');
    var response = await destinations.add({
      "hotel_place_name" : dealsHotel.hotelPlaceName
    });
    addMultiCollection(id: response.id,dealsHotel:dealsHotel);
    return 'Created';
  }

  Future<String?> addMultiCollection({String? id,required DealsHotel dealsHotel})async {
    final CollectionReference destinations = FirebaseFirestore.instance.collection('Destinations');
    destinations.doc(id).collection('CitiesDetails').add({
      "id":id,
      "hotel_name":dealsHotel.hotelName,//1
      "hotel_price":dealsHotel.hotelPrice,//6
      "hotel_title":dealsHotel.hotelTitle,//3

      "hotel_food_description":dealsHotel.hotelFoodDescription,//0
      "hotel_price_description":dealsHotel.hotelPriceDescription,//5
      "hotel_room_description":dealsHotel.hotelRoomDescription,//4
      "hotel_tax_description":dealsHotel.hotelTaxDescription,//7
      "hotel_free_cancellation_description":dealsHotel.hotelFreeCancellationDescription,//8
      "hotel_payment_description":dealsHotel.hotelPaymentDescription,//9

      "hotel_deals_started_at":dealsHotel.hotelDealsStartedAt,//11
      //"hotel_image":"https://media.istockphoto.com/id/104731717/photo/luxury-resort.jpg?s=612x612&w=0&k=20&c=cODMSPbYyrn1FHake1xYz9M8r15iOfGz9Aosy9Db7mI=",
      "hotel_image":dealsHotel.hotelImage,
      "hotel_details":
      {
        "distance":dealsHotel.extraDealsDetails?.hotelDistance,//2
        "merit":dealsHotel.extraDealsDetails?.hotelMerit,//10

      }
    }).then((value){
      print('addMultiCollection fun id: ---> ${value.id}');
    });
    return 'Success';
  }

  Future<String?> addBookCollection(DealsTopDetails dealsTopDetails)async{
    final CollectionReference booksDetails = FirebaseFirestore.instance.collection('DealsBookDetails');
    await booksDetails.add({
      "deals_top_details": {
        "bookInfo":dealsTopDetails.bookInfo,
        "scheduleData":dealsTopDetails.scheduleData,
        "discountInfo":dealsTopDetails.discountInfo,
      },

    }).then((value){
      print('addBookCollection fun id: ---> ${value.id}');
    });
    return 'Success';
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: const EdgeInsets.only(left: 20.0,right: 20.0),
          child: SingleChildScrollView(
            child: Column(
                  children: [
                    Column(
                   children: [
                     Form(
                       key: _formKeyBook,
                       child: Column(
                         children: [
                           const SizedBox(height: 20.0,),
                           const Center(
                             child: Text('Book details',style: TextStyle(color: Colors.black,fontSize: 24.0),),
                           ),
                           const SizedBox(height: 20.0,),
                           //Book details
                           TextFormField(
                             controller: bookDetailsController,
                             decoration: const InputDecoration(
                                 border: OutlineInputBorder(),
                                 label: Text('Book details',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.normal,fontSize: 18))
                             ),
                             validator: (value){
                               if(value == null || value.isEmpty){
                                 return 'Please enter the Book details';
                               }
                               return null;
                             },
                             //autovalidateMode: AutovalidateMode.onUserInteraction,
                           ),
                           const SizedBox(height: 12.0,),
                           //scheduleDataController
                           TextFormField(
                             controller: scheduleDataController,
                             decoration: const InputDecoration(
                                 border: OutlineInputBorder(),
                                 label: Text('Schedule data',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.normal,fontSize: 18))
                             ),
                             validator: (value){
                               if(value == null || value.isEmpty){
                                 return 'Please enter the Schedule data';
                               }
                               return null;
                             },
                             //autovalidateMode: AutovalidateMode.onUserInteraction,
                           ),
                           const SizedBox(height: 12.0,),
                           //discountInfoController
                           TextFormField(
                             controller: discountInfoController,
                             decoration: const InputDecoration(
                                 border: OutlineInputBorder(),
                                 label: Text('Discount info',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.normal,fontSize: 18))
                             ),
                             validator: (value){
                               if(value == null || value.isEmpty){
                                 return 'Please enter the Discount info';
                               }
                               return null;
                             },
                             //autovalidateMode: AutovalidateMode.onUserInteraction,
                           ),
                           const SizedBox(height: 12.0,),
                           //save botton
                           SizedBox(
                             height: 45,
                             width: 160,
                             child: ElevatedButton(
                                 onPressed: ()async{
                                   if(_formKeyBook.currentState!.validate()){
                                     var dealsTopDetails = DealsTopDetails(
                                         bookInfo: bookDetailsController.text,
                                         scheduleData: scheduleDataController.text,
                                         discountInfo: discountInfoController.text
                                     );
                                     addBookCollection(dealsTopDetails);
                                     bookDetailsController.text = '';
                                     scheduleDataController.text = '';
                                     discountInfoController.text = '';


                                     ScaffoldMessenger.of(context).showSnackBar(
                                         const SnackBar(
                                             backgroundColor: Colors.green,
                                             content:Text('Deals Top Details data successfully saved',
                                               style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 14),))
                                     );
                                   }

                                 },
                                 child: const Text('Save',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)),
                           ),
                           const SizedBox(height: 12.0,),
                         ],
                       ),
                     ),
                     Form(
                       key: _formKey,
                       child: Column(
                         children: [
                           const Center(
                             child: Text('City name',style: TextStyle(color: Colors.black,fontSize: 24.0),),
                           ),
                           const SizedBox(height: 12.0,),
                           //City name
                           TextFormField(
                             controller: hotelPlaceNameController,
                             decoration: const InputDecoration(
                                 border: OutlineInputBorder(),
                                 label: Text('City name',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.normal,fontSize: 18))
                             ),
                             validator: (value){
                               if(value == null || value.isEmpty){
                                 return 'Please enter the City name';
                               }
                               return null;
                             },
                             //autovalidateMode: AutovalidateMode.onUserInteraction,
                           ),
                           const SizedBox(height: 12.0,),
                           const Center(
                             child: Text('Hotel details',style: TextStyle(color: Colors.black,fontSize: 24.0),),
                           ),
                           //hotel name
                           TextFormField(
                             controller: hotelNameController,
                             decoration: const InputDecoration(
                                 border: OutlineInputBorder(),
                                 label: Text('Hotel name',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.normal,fontSize: 18))
                             ),
                             validator: (value){
                               if(value == null || value.isEmpty){
                                 return 'Please enter the hotel name';
                               }
                               return null;
                             },
                             //autovalidateMode: AutovalidateMode.onUserInteraction,
                           ),
                           const SizedBox(height: 12.0,),
                           //price
                           TextFormField(
                             controller: hotelPriceController,
                             decoration: const InputDecoration(
                                 border: OutlineInputBorder(),
                                 label: Text('Hotel price',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.normal,fontSize: 18))
                             ),
                             validator: (value){
                               if(value == null || value.isEmpty){
                                 return 'Please enter the hotel price';
                               }
                               return null;
                             },
                             //autovalidateMode: AutovalidateMode.onUserInteraction,
                           ),
                           const SizedBox(height: 12.0,),
                           //title
                           TextFormField(
                             controller: hotelTitleController,
                             decoration: const InputDecoration(
                                 border: OutlineInputBorder(),
                                 label: Text('Hotel title',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.normal,fontSize: 18))
                             ),
                             validator: (value){
                               if(value == null || value.isEmpty){
                                 return 'Please enter the hotel title';
                               }
                               return null;
                             },
                             //autovalidateMode: AutovalidateMode.onUserInteraction,
                           ),


                           const SizedBox(height: 12.0,),
                           //food available  Description
                           TextFormField(
                             controller: hotelFoodDescription,
                             decoration: const InputDecoration(
                                 border: OutlineInputBorder(),
                                 label: Text('Hotel food available description',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.normal,fontSize: 18))
                             ),
                             validator: (value){
                               if(value == null || value.isEmpty){
                                 return 'Please enter the hotel food available description';
                               }
                               return null;
                             },
                             //autovalidateMode: AutovalidateMode.onUserInteraction,
                           ),
                           const SizedBox(height: 12.0,),


                           const SizedBox(height: 12.0,),
                           //hotelPriceDescription
                           TextFormField(
                             controller: hotelPriceDescription,
                             decoration: const InputDecoration(
                                 border: OutlineInputBorder(),
                                 label: Text('Hotel price description',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.normal,fontSize: 18))
                             ),
                             validator: (value){
                               if(value == null || value.isEmpty){
                                 return 'Please enter the hotel price description';
                               }
                               return null;
                             },
                             //autovalidateMode: AutovalidateMode.onUserInteraction,
                           ),
                           const SizedBox(height: 12.0,),


                           const SizedBox(height: 12.0,),
                           //hotelRoomDescription
                           TextFormField(
                             controller: hotelRoomDescription,
                             decoration: const InputDecoration(
                                 border: OutlineInputBorder(),
                                 label: Text('Hotel room description',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.normal,fontSize: 18))
                             ),
                             validator: (value){
                               if(value == null || value.isEmpty){
                                 return 'Please enter the hotel room description';
                               }
                               return null;
                             },
                             //autovalidateMode: AutovalidateMode.onUserInteraction,
                           ),
                           const SizedBox(height: 12.0,),



                           const SizedBox(height: 12.0,),
                           //hotelTaxDescription
                           TextFormField(
                             controller: hotelTaxDescription,
                             decoration: const InputDecoration(
                                 border: OutlineInputBorder(),
                                 label: Text('Hotel tax description',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.normal,fontSize: 18))
                             ),
                             validator: (value){
                               if(value == null || value.isEmpty){
                                 return 'Please enter the hotel tax description';
                               }
                               return null;
                             },
                             //autovalidateMode: AutovalidateMode.onUserInteraction,
                           ),
                           const SizedBox(height: 12.0,),


                           const SizedBox(height: 12.0,),
                           //hotelFreeCancellationDescription
                           TextFormField(
                             controller: hotelFreeCancellationDescription,
                             decoration: const InputDecoration(
                                 border: OutlineInputBorder(),
                                 label: Text('Hotel free or not description',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.normal,fontSize: 18))
                             ),
                             validator: (value){
                               if(value == null || value.isEmpty){
                                 return 'Please enter the hotel free or not description';
                               }
                               return null;
                             },
                             //autovalidateMode: AutovalidateMode.onUserInteraction,
                           ),
                           const SizedBox(height: 12.0,),


                           const SizedBox(height: 12.0,),
                           //hotelPaymentDescription
                           TextFormField(
                             controller: hotelPaymentDescription,
                             decoration: const InputDecoration(
                                 border: OutlineInputBorder(),
                                 label: Text('Hotel payment description',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.normal,fontSize: 18))
                             ),
                             validator: (value){
                               if(value == null || value.isEmpty){
                                 return 'Please enter the hotel payment description';
                               }
                               return null;
                             },
                             //autovalidateMode: AutovalidateMode.onUserInteraction,
                           ),
                           const SizedBox(height: 12.0,),


                           //deals_started_at
                           TextFormField(
                             controller: hotelDealsStartedAtController,
                             decoration: const InputDecoration(
                                 border: OutlineInputBorder(),
                                 label: Text('Hotel deals started at',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.normal,fontSize: 18))
                             ),
                             validator: (value){
                               if(value == null || value.isEmpty){
                                 return 'Please enter the hotel deals started at';
                               }
                               return null;
                             },
                             //autovalidateMode: AutovalidateMode.onUserInteraction,
                           ),
                           const SizedBox(height: 12.0,),
                           //distance
                           TextFormField(
                             controller: hotelDistanceController,
                             decoration: const InputDecoration(
                                 border: OutlineInputBorder(),
                                 label: Text('Hotel distance',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.normal,fontSize: 18))
                             ),
                             validator: (value){
                               if(value == null || value.isEmpty){
                                 return 'Please enter the hotel distance';
                               }
                               return null;
                             },
                             //autovalidateMode: AutovalidateMode.onUserInteraction,
                           ),
                           const SizedBox(height: 12.0,),
                           //merit
                           TextFormField(
                             controller: hotelMeritController,
                             decoration: const InputDecoration(
                                 border: OutlineInputBorder(),
                                 label: Text('Hotel merit',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.normal,fontSize: 18))
                             ),
                             validator: (value){
                               if(value == null || value.isEmpty){
                                 return 'Please enter the hotel merit';
                               }
                               return null;
                             },
                             //autovalidateMode: AutovalidateMode.onUserInteraction,
                           ),
                           const SizedBox(height: 12.0,),
                           Container(
                             height: 400,
                             width: 450,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(8.0),
                               color: Colors.black12,
                             ),
                             child: Center(
                               child: Stack(
                                 children: [
                                   Center(
                                     child: IconButton(
                                         onPressed: (){

                                         },
                                         icon: const Center(child: Icon(Icons.image,size: 50.0,))),
                                   ),

                                 ],
                               ),
                             ),
                           ),
                           const SizedBox(height: 12.0,),
                           //save botton
                           SizedBox(
                             height: 45,
                             width: 160,
                             child: ElevatedButton(
                                 onPressed: ()async{
                                   if(_formKey.currentState!.validate()){
                                     DealsHotel dealsModel = DealsHotel(
                                         hotelPlaceName: hotelPlaceNameController.text,
                                         hotelName: hotelNameController.text,
                                         hotelPrice: hotelPriceController.text,
                                         hotelTitle: hotelTitleController.text,
                                         hotelFoodDescription: hotelFoodDescription.text,
                                         hotelPriceDescription: hotelPriceDescription.text,
                                         hotelRoomDescription: hotelRoomDescription.text,
                                         hotelTaxDescription: hotelTaxDescription.text,
                                         hotelFreeCancellationDescription: hotelFreeCancellationDescription.text,
                                         hotelPaymentDescription: hotelPaymentDescription.text,
                                         hotelDealsStartedAt: hotelDealsStartedAtController.text,
                                         extraDealsDetails: ExtraDealsDetails(
                                             hotelDistance: hotelDistanceController.text,
                                             hotelMerit:hotelMeritController.text
                                         )
                                     );
                                     addCollection(dealsModel);
                                     hotelPlaceNameController.text = '';
                                     hotelNameController.text = '';
                                     hotelPriceController.text = '';
                                     hotelTitleController.text = '';
                                     hotelFoodDescription.text = '';
                                     hotelPriceDescription.text = '';
                                     hotelRoomDescription.text = '';
                                     hotelTaxDescription.text = '';
                                     hotelFreeCancellationDescription.text = '';
                                     hotelPaymentDescription.text = '';
                                     hotelDealsStartedAtController.text = '';
                                     hotelDistanceController.text = '';
                                     hotelMeritController.text = '';

                                     ScaffoldMessenger.of(context).showSnackBar(
                                         const SnackBar(
                                             backgroundColor: Colors.green,
                                             content:Text('Destination data successfully saved',
                                               style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 14),))
                                     );
                                   }

                                 },
                                 child: const Text('Save',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)),
                           ),
                           const SizedBox(height: 50.0,),
                         ],
                       ),
                     ),
                   ],
                 ),
                    // SizedBox(
                    //   height: 400,
                    //   child: StreamBuilder(
                    //     stream: destinations.snapshots(),
                    //     builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
                    //       if(snapshot.hasData){
                    //         return ListView.builder(
                    //           primary: true,
                    //           scrollDirection: Axis.vertical,
                    //           itemCount: snapshot.data!.docs.length,
                    //           itemBuilder: (context, index){
                    //             final DocumentSnapshot documentSnapshot = snapshot.data!.docs[index];
                    //             return dealsItemList(context,documentSnapshot);
                    //           },
                    //         );
                    //       }
                    //       return const Center(child: CircularProgressIndicator());
                    //     },
                    //   ),
                    // ),
                  ],
                ),
          ),
          ),
    );
  }
}
