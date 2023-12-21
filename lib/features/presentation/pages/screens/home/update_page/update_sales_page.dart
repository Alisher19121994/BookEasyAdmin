import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateHomeSalesPage extends StatefulWidget {
  final String title;
  final String description;

  const UpdateHomeSalesPage(
      {super.key, required this.title, required this.description});

  static const String id = 'UpdateHomeSalesPage';

  @override
  State<UpdateHomeSalesPage> createState() => _UpdateHomeSalesPageState();
}

class _UpdateHomeSalesPageState extends State<UpdateHomeSalesPage> {
  TextEditingController salesDiscountTitleController = TextEditingController();
  TextEditingController salesTitleController = TextEditingController();

  final _formKeySales = GlobalKey<FormState>();

  final CollectionReference _salesData = FirebaseFirestore.instance.collection('SalesData');

  Future<void> showData([DocumentSnapshot? documentSnapshot])async{
    if(documentSnapshot != null){
      salesDiscountTitleController.text = widget.description;
      salesTitleController.text = widget.title;
    }}
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Center(
          child: Form(
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
        ),
      ),
    );
  }
}
