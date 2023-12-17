import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../widgets/home/more_item.dart';
import '../../../widgets/home/sales_data.dart';
import '../../../widgets/home/travel_more_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
                      margin: EdgeInsets.all(3.0),
                      padding: EdgeInsets.all(2.0),
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
                          builder: (context, AsyncSnapshot<QuerySnapshot> snapshots){
                            if(snapshots.hasData){
                              return ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshots.data!.docs.length,
                                  itemBuilder: (context, index){
                                  final DocumentSnapshot documentSnapshot = snapshots.data!.docs[index];
                                  return moreForYouItem(context,documentSnapshot);
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
                          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
                            if(snapshot.hasData){
                              return ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index){
                                    final DocumentSnapshot documentSnapshot = snapshot.data!.docs[index];
                                    return salesData(context,documentSnapshot);
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
