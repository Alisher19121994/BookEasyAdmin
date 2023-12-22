import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../../data/model/deals_model.dart';

class DealsPage extends StatefulWidget {
  const DealsPage({super.key});
  static const String id = 'DealsPage';
  @override
  State<DealsPage> createState() => _DealsPageState();
}

class _DealsPageState extends State<DealsPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController hotelPlaceNameController = TextEditingController();
  TextEditingController hotelNameController = TextEditingController();
  TextEditingController hotelPriceController = TextEditingController();
  TextEditingController hotelTitleController = TextEditingController();
  TextEditingController hotelDescriptionController = TextEditingController();
  TextEditingController hotelDealsStartedAtController = TextEditingController();
  TextEditingController hotelDistanceController = TextEditingController();
  TextEditingController hotelMeritController = TextEditingController();

  Future<String?> addCollection(DealsHotel dealsHotel)async{
    final CollectionReference destinations = FirebaseFirestore.instance.collection('Destinations');
    var response = await destinations.add({
      "hotel_place_name" : dealsHotel.hotelPlaceName
    });
    addMultiCollection(id: response.id,dealsHotel:dealsHotel);
    return 'Created';
  }

  Future<String?> addMultiCollection({String? id,required DealsHotel dealsHotel})async{
    final CollectionReference destinations = FirebaseFirestore.instance.collection('Destinations');
    destinations.doc(id).collection('CitiesDetails').add({
      "id":id,
      "hotel_name":dealsHotel.hotelName,
      "hotel_price":dealsHotel.hotelPrice,
      "hotel_title":dealsHotel.hotelTitle,
      "hotel_description":dealsHotel.hotelDescription,
      "hotel_deals_started_at":dealsHotel.hotelDealsStartedAt,
      //"hotel_image":"https://media.istockphoto.com/id/104731717/photo/luxury-resort.jpg?s=612x612&w=0&k=20&c=cODMSPbYyrn1FHake1xYz9M8r15iOfGz9Aosy9Db7mI=",
      "hotel_image":dealsHotel.hotelImage,
      "hotel_details":
      {
        "distance":dealsHotel.extraDealsDetails?.hotelDistance,
        "merit":dealsHotel.extraDealsDetails?.hotelMerit,

      }
    }).then((value){
      print('addMultiCollection fun id: ---> ${value.id}');
    });
    return 'Success';
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.only(left: 20.0,right: 20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 32.0,),
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
                //Description
                TextFormField(
                  controller: hotelDescriptionController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Hotel description',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.normal,fontSize: 18))
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter the hotel description';
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
                              hotelDescription: hotelDescriptionController.text,
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
                          hotelDescriptionController.text = '';
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
        ),
      ),
    );
  }
}
