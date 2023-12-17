import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget salesData(BuildContext context,DocumentSnapshot documentSnapshot) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  return Container(
    margin: const EdgeInsets.all(6.0),
    height: height * 0.16,
    width: width * 0.40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: const Color(0xfff2f6fa)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(6.0),
            width: width * 0.20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(documentSnapshot['salesTitle'], style: const TextStyle(color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),),
                    const SizedBox(height: 8.0),
                    Text(documentSnapshot['salesDescription'],
                      style:
                      const TextStyle(color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.normal),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                      onPressed: () {

                      },
                      child: const Text('Explore deals', style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),),

                    ),
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
                             // delete(documentSnapshot.id);
                            },
                            icon:const Icon( Icons.delete)),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0)),
                    image: DecorationImage(
                    image: NetworkImage('https://media.istockphoto.com/id/104731717/photo/luxury-resort.jpg?s=612x612&w=0&k=20&c=cODMSPbYyrn1FHake1xYz9M8r15iOfGz9Aosy9Db7mI='),
                    fit: BoxFit.cover),
              ),
            ),
          )
        ],
      ),);
}