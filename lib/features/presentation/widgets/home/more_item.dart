import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget moreForYouItem(BuildContext context, DocumentSnapshot documentSnapshot) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  final CollectionReference exploreDeals =
      FirebaseFirestore.instance.collection('ExploreDeals');

  Future<void> delete(String productID) async {
    await exploreDeals.doc(productID).delete();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.greenAccent,
        content: Text('Deleted successfully')));
  }

  return Container(
    margin: const EdgeInsets.only(left: 3.0, right: 3.0, top: 6.0),
    height: height * 0.16,
    width: width * 0.30,
    child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: const DecorationImage(
                image: NetworkImage(
                    'https://media.istockphoto.com/id/104731717/photo/luxury-resort.jpg?s=612x612&w=0&k=20&c=cODMSPbYyrn1FHake1xYz9M8r15iOfGz9Aosy9Db7mI='),
                fit: BoxFit.cover),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              gradient: LinearGradient(begin: Alignment.bottomLeft, colors: [
                Colors.black.withOpacity(0.9),
                Colors.black.withOpacity(0.6),
                Colors.black.withOpacity(0.4),
                Colors.black.withOpacity(0.2),
              ]),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                documentSnapshot['dealsDiscountTitle'],
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Text(
                documentSnapshot['dealsTitle'],
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.white,
                      )),
                  const SizedBox(height: 18.0),
                  IconButton(
                      onPressed: () {
                        delete(documentSnapshot.id);
                      },
                      icon: const Icon(Icons.delete, color: Colors.white)),
                ],
              ),
            ],
          ),
        )
      ],
    ),
  );
}
