import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget dealsData(BuildContext context,DocumentSnapshot documentSnapshot) {


  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  final CollectionReference exploreDeals =
  FirebaseFirestore.instance.collection('ExploreDeals');

  TextEditingController dealsDiscountTitleController = TextEditingController();
  TextEditingController dealsTitleController = TextEditingController();

  Future<void> showData()async{
    dealsDiscountTitleController.text = documentSnapshot['dealsDiscountTitle'];
    dealsTitleController.text = documentSnapshot['dealsTitle'];
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
                  controller: dealsTitleController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('deals title')
                  ),
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  controller: dealsDiscountTitleController,
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
                        String discount = dealsDiscountTitleController.text;
                        String title = dealsTitleController.text;

                        await exploreDeals.doc(documentSnapshot.id).update({
                          'dealsDiscountTitle': discount, 'dealsTitle':title
                        });
                        dealsDiscountTitleController.text = '';
                        dealsTitleController.text = '';

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

  Future<void> delete(String productID) async {
    await exploreDeals.doc(productID).delete();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.greenAccent,
        content: Text('Deleted successfully')));
  }

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
                    Text(documentSnapshot['dealsDiscountTitle'], style: const TextStyle(color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),),
                    const SizedBox(height: 8.0),
                    Text(documentSnapshot['dealsTitle'],
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
                              showData();
                             // Navigator.push(context, MaterialPageRoute(builder: (_)=> UpdateHomeSalesPage(title: documentSnapshot['dealsTitle'],description: documentSnapshot['dealsDiscountTitle'],)));
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