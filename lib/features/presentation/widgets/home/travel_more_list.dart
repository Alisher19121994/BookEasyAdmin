import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget travelMoreList(BuildContext context,DocumentSnapshot documentSnapshot){

  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  final CollectionReference travelMoreList =
  FirebaseFirestore.instance.collection('TravelMoreList');

  TextEditingController travelDiscountTitleController = TextEditingController();
  TextEditingController travelTitleController = TextEditingController();

  Future<void> showData()async{
    travelDiscountTitleController.text = documentSnapshot['discountTitle'];
    travelTitleController.text = documentSnapshot['title'];
    showAdaptiveDialog(
      context: context,
      builder: (context){
        return Scaffold(
          body: Container(
            padding: const EdgeInsets.all(50),
            margin: const EdgeInsets.all(50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: travelTitleController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('deals title')
                  ),
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  controller: travelDiscountTitleController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('deals discount title')
                  ),
                ),

                const SizedBox(height: 20,),
                SizedBox(
                  height: 50,
                  width: 120,
                  child: ElevatedButton(
                      onPressed: ()async{
                        String discount = travelDiscountTitleController.text;
                        String title = travelTitleController.text;

                        await travelMoreList.doc(documentSnapshot.id).update({
                          'discountTitle': discount, 'title':title
                        });
                        travelDiscountTitleController.text = '';
                        travelTitleController.text = '';

                      },
                      child: Text('Press')),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  delete(String productId){
     travelMoreList.doc(productId).delete();
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.greenAccent,
            content: Text('Deleted successfully')));
  }


  return Container(
    margin: const EdgeInsets.all(6.0),
    padding: const EdgeInsets.all(12.0),
    height: height * 0.16,
    width: width * 0.30,
    decoration: BoxDecoration(
      border: Border.all(width: 1.2, color: Colors.blue),
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(documentSnapshot['discountTitle'],style: const TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
        const SizedBox(height: 8.0),
        Expanded(child: Text(documentSnapshot['title'],style: const TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.normal),)),
        const SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                onPressed: (){
                    showData();
                },
                icon:const Icon( Icons.edit)),
            const SizedBox(height: 18.0),
            IconButton(
                onPressed: (){
                  delete(documentSnapshot.id);
                },
                icon:const Icon( Icons.delete)),
          ],
        ),
      ],
    ),
  );
}