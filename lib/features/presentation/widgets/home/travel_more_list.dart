import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget travelMoreList(BuildContext context,DocumentSnapshot documentSnapshot){

  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  final CollectionReference travelMoreList =
  FirebaseFirestore.instance.collection('TravelMoreList');

  Future<void> delete(String productId)async{
    await travelMoreList.doc(productId).delete();

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

                },
                icon:Icon( Icons.edit)),
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