import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../widgets/home/sales_item.dart';
import '../../../widgets/home/deal_data.dart';
import '../../../widgets/home/travel_more_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<String?> addCollection(String hotelPlaceName)async{
    final CollectionReference destinations = FirebaseFirestore.instance.collection('Destinations');
    var response = await destinations.add({
      "hotel_place_name" : hotelPlaceName
    });
    addMultiCollection(id: response.id);
    return 'Created';
  }

  Future<String?> addMultiCollection({String? id,String? hotelName,})async{
    final CollectionReference destinations = FirebaseFirestore.instance.collection('Destinations');
    destinations.doc(id).collection('CitiesDetails').add({
      "id":id,
      "hotel_name":hotelName,
      "hotel_price":"\$ 45",
      "hotel_title":"287 properties",
      "hotel_description":"64 Late Escape Deals",
      "hotel_deals_started_at":"\$ 9",
      "hotel_image":"https://media.istockphoto.com/id/104731717/photo/luxury-resort.jpg?s=612x612&w=0&k=20&c=cODMSPbYyrn1FHake1xYz9M8r15iOfGz9Aosy9Db7mI=",
      "hotel_details":
      {
        "distance":"123 miles far from the center",
        "merit":"Top level 5 stars",

      }
    }).then((value){
      print('addMultiCollection fun id: ---> ${value.id}');
    });
    return 'Success';
  }


  TextEditingController discountTitleController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  TextEditingController dealsDiscountTitleController = TextEditingController();
  TextEditingController dealsTitleController = TextEditingController();

  TextEditingController salesDiscountTitleController = TextEditingController();
  TextEditingController salesTitleController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _formKeyDeals = GlobalKey<FormState>();
  final _formKeySales = GlobalKey<FormState>();

  final CollectionReference _travelMoreList = FirebaseFirestore.instance.collection('TravelMoreList');
  final CollectionReference _exploreDeals  = FirebaseFirestore.instance.collection('ExploreDeals');
  final CollectionReference _salesData = FirebaseFirestore.instance.collection('SalesData');

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Row(
        children: [
          Container(
            height: 9000,
            width: 300,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //Travel more, spend less
                  Form(
                    key: _formKey,
                    child: Container(
                      margin: EdgeInsets.all(3.0),
                      padding: EdgeInsets.all(2.0),
                      height: 300,
                      width: 300,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Center(
                            child: Text('Travel more, spend less',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 21.0)),
                          ),
                          const SizedBox(height: 12.0,),
                          TextFormField(
                            controller: discountTitleController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text('Discount with percent',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.normal,fontSize: 18))
                            ),
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return 'Please enter the discount with percent';
                              }
                              return null;
                            },
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                          ),
                          const SizedBox(height: 12.0,),
                          TextFormField(
                            controller: titleController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                                label: Text('Title',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.normal,fontSize: 18))
                            ),
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return 'Please enter the title';
                              }
                              return null;
                            },
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                          ),
                          const SizedBox(height: 18.0,),
                          SizedBox(
                            height: 45,
                            width: 160,
                            child: ElevatedButton(
                                onPressed: ()async{
                                  String discount = discountTitleController.text;
                                  String title = titleController.text;

                                  if(_formKey.currentState!.validate()){
                                    await _travelMoreList.add({
                                      'discountTitle': discount, 'title':title
                                    });
                                    discountTitleController.text = '';
                                    titleController.text = '';

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        backgroundColor: Colors.green,
                                          content:Text('Inserted data successfully saved',
                                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 14),))
                                    );
                                  }

                                },
                                child: const Text('Save',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Divider(thickness: 2.0),
                  //Explore deals
                  Form(
                    key: _formKeyDeals,
                    child: Container(
                      margin: const EdgeInsets.all(3.0),
                      padding: const EdgeInsets.all(2.0),
                      height: 500,
                      width: 300,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Center(
                            child: Text('Explore deals',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 21.0)),
                          ),
                          const SizedBox(height: 12.0,),
                          TextFormField(
                            controller: dealsDiscountTitleController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text('Deals discount',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.normal,fontSize: 18))
                            ),
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return 'Please enter the deals discount';
                              }
                              return null;
                            },
                            //autovalidateMode: AutovalidateMode.always,
                          ),
                          const SizedBox(height: 12.0,),
                          TextFormField(
                            controller: dealsTitleController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text('Deals title',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.normal,fontSize: 18))
                            ),
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return 'Please enter the deals title';
                              }
                              return null;
                            },
                           // autovalidateMode: AutovalidateMode.onUserInteraction,
                          ),
                          const SizedBox(height: 18.0,),
                          Container(
                            height: 180.0,
                            width: 300,
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
                                        icon: Icon(Icons.image,size: 50.0,)),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 18.0,),
                          SizedBox(
                            height: 45,
                            width: 160,
                            child: ElevatedButton(
                                onPressed: ()async{
                                  String discount = dealsDiscountTitleController.text;
                                  String title = dealsTitleController.text;

                                  if(_formKeyDeals.currentState!.validate()){
                                    await _exploreDeals.add({
                                      'dealsDiscountTitle': discount, 'dealsTitle':title
                                    });
                                    dealsDiscountTitleController.text = '';
                                    dealsTitleController.text = '';

                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            backgroundColor: Colors.green,
                                            content:Text('Deals data successfully saved',
                                              style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 14),))
                                    );
                                  }

                                },
                                child: const Text('Save',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Divider(thickness: 2.0),
                  //More for you
                  Form(
                    key: _formKeySales,
                    child: Container(
                      margin: const EdgeInsets.all(3.0),
                      padding: const EdgeInsets.all(2.0),
                      height: 500,
                      width: 300,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Center(
                            child: Text('More for you',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 21.0)),
                          ),
                          const SizedBox(height: 12.0,),
                          TextFormField(
                            controller: salesDiscountTitleController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text('Sales title',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.normal,fontSize: 18))
                            ),
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return 'Please enter the sales title';
                              }
                              return null;
                            },
                            //autovalidateMode: AutovalidateMode.onUserInteraction,
                          ),
                          const SizedBox(height: 12.0,),
                          TextFormField(
                            controller: salesTitleController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text('Sales description',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.normal,fontSize: 18))
                            ),
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return 'Please enter the sales description';
                              }
                              return null;
                            },
                          //  autovalidateMode: AutovalidateMode.onUserInteraction,
                          ),
                          const SizedBox(height: 18.0,),
                          Container(
                            height: 180.0,
                            width: 300,
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
                                        icon: Icon(Icons.image,size: 50.0,)),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 18.0,),
                          SizedBox(
                            height: 45,
                            width: 160,
                            child: ElevatedButton(
                                onPressed: ()async{

                                  //addCollection();

                                  String discount = salesDiscountTitleController.text;
                                  String title = salesTitleController.text;

                                  if(_formKeySales.currentState!.validate()){
                                    await _salesData.add({
                                      'salesTitle': discount, 'salesDescription':title
                                    });
                                    salesDiscountTitleController.text = '';
                                    salesTitleController.text = '';

                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            backgroundColor: Colors.green,
                                            content:Text('Sales data successfully saved',
                                              style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 14),))
                                    );
                                  }

                                },
                                child: const Text('Save',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Divider(thickness: 2.0),
                  const SizedBox(height: 50,)
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
            color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //_travelMoreList
                      SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: StreamBuilder(
                          stream: _travelMoreList.snapshots(),
                          builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
                            if(snapshot.hasData){
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index){
                                  final DocumentSnapshot documentSnapshot = snapshot.data!.docs[index];
                                  return travelMoreList(context,documentSnapshot);
                                },
                              );
                            }
                            return const Center(child: CircularProgressIndicator());
                          },
                        ),
                      ),
                      const Divider(thickness: 2.0,),
                      //_exploreDeals
                      SizedBox(
                        height: 300,
                        width: double.infinity,
                        child:  StreamBuilder(
                          stream: _exploreDeals.snapshots(),
                          builder: (context, AsyncSnapshot<QuerySnapshot> snapshotss){
                            if(snapshotss.hasData){
                              return ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshotss.data!.docs.length,
                                  itemBuilder: (context, index){
                                    final DocumentSnapshot documentSnapshot = snapshotss.data!.docs[index];
                                    return dealsData(context,documentSnapshot);
                                  }
                              );
                            }
                            return const Center(child: CircularProgressIndicator());
                          },
                        ),
                      ),
                      const Divider(thickness: 2.0,),
                      //_salesData
                      SizedBox(
                        height: 300,
                        width: double.infinity,
                        child:  StreamBuilder(
                          stream: _salesData.snapshots(),
                          builder: (context, AsyncSnapshot<QuerySnapshot> snapshots){
                            if(snapshots.hasData){
                              return ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshots.data!.docs.length,
                                  itemBuilder: (context, index){
                                  final DocumentSnapshot documentSnapshot = snapshots.data!.docs[index];
                                  return salesItem(context,documentSnapshot);
                                  }
                              );
                            }
                            return const Center(child: CircularProgressIndicator());
                          },
                        ),
                      ),
                      const Divider(thickness: 2.0,),

                    ],
                  ),
                ),
          ))
      ],
    ),
        );
  }
}
