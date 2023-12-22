import 'package:book_easy_admin/features/data/model/travel_articles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TravelArticlesPage extends StatefulWidget {
  const TravelArticlesPage({super.key});
  static const String id = 'TravelArticlesPage';
  @override
  State<TravelArticlesPage> createState() => _TravelArticlesPageState();
}

class _TravelArticlesPageState extends State<TravelArticlesPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();


  Future<String?> createTravelArticlesCollection(TravelArticles travelArticles)async{
    final CollectionReference travelArticle = FirebaseFirestore.instance.collection('TravelArticles');
    await travelArticle.add({
      "title" : travelArticles.title,
      "description" : travelArticles.description,
      "dates" : travelArticles.dates,
      "image" : travelArticles.image,
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
                const Center(
                  child: Text('Enter Article',style: TextStyle(color: Colors.black,fontSize: 24.0),),
                ),
                const SizedBox(height: 12.0,),
                //title
                TextFormField(
                  minLines: 1,
                  maxLines: 10,
                  keyboardType: TextInputType.multiline,
                  controller: titleController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Title of article',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.normal,fontSize: 18))
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter the Title of article';
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
                      label: Text('Description of article',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.normal,fontSize: 18))
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter the article description';
                    }
                    return null;
                  },
                  //autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 12.0,),
                //price
                TextFormField(
                  minLines: 1,
                  maxLines: 2,
                  keyboardType: TextInputType.multiline,
                  controller: dateController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Date of article',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.normal,fontSize: 18))
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter the article data';
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
                //save button
                SizedBox(
                  height: 45,
                  width: 160,
                  child: ElevatedButton(
                      onPressed: ()async{
                        if(_formKey.currentState!.validate()){
                          TravelArticles travelArticles = TravelArticles(
                            title: titleController.text,
                            description: descriptionController.text,
                            dates: dateController.text
                          );
                          createTravelArticlesCollection(travelArticles);
                          titleController.text = '';
                          descriptionController.text = '';
                          dateController.text = '';


                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  backgroundColor: Colors.green,
                                  content:Text('TravelArticles successfully saved',
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
