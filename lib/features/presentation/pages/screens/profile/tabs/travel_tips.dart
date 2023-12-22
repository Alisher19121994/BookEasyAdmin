import 'package:book_easy_admin/features/data/model/travel_tips.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TravelTipsPage extends StatefulWidget {
  const TravelTipsPage({super.key});
  static const String id = 'TravelTipsPage';
  @override
  State<TravelTipsPage> createState() => _TravelTipsPageState();
}

class _TravelTipsPageState extends State<TravelTipsPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();


  Future<String?> createTravelArticlesCollection(TravelTips travelTips)async{
    final CollectionReference travelTip = FirebaseFirestore.instance.collection('TravelTips');
    await travelTip.add({
      "title" : travelTips.title,
      "description" : travelTips.description,
      "image" : travelTips.image,
    });
    return 'Created';
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
                //title of tips
                TextFormField(
                  minLines: 1,
                  maxLines: 10,
                  keyboardType: TextInputType.multiline,
                  controller: titleController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Title of tips',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.normal,fontSize: 18))
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter the Title of tips';
                    }
                    return null;
                  },
                  //autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 12.0,),
                //article description
                TextFormField(
                  minLines: 1,
                  maxLines: 70,
                  keyboardType: TextInputType.multiline,
                  controller: descriptionController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Description of tips',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.normal,fontSize: 18))
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter the tips description';
                    }
                    return null;
                  },
                  //autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 12.0,),
                //image
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
                //save button
                SizedBox(
                  height: 45,
                  width: 160,
                  child: ElevatedButton(
                      onPressed: ()async{
                        if(_formKey.currentState!.validate()){
                          TravelTips travelTips = TravelTips(
                              title: titleController.text,
                              description: descriptionController.text,

                          );
                          createTravelArticlesCollection(travelTips);
                          titleController.text = '';
                          descriptionController.text = '';

                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  backgroundColor: Colors.green,
                                  content:Text('Travel tips successfully saved',
                                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 14),))
                          );
                        }

                      },
                      child: const Text('Save',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)),
                ),
                const SizedBox(height: 52.0,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
