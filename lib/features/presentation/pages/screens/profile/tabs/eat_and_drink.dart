import 'package:book_easy_admin/features/data/model/deals_eat_&_drinks.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EatAndDrinkPage extends StatefulWidget {
  const EatAndDrinkPage({super.key});
  static const String id = 'EatAndDrinkPage';
  @override
  State<EatAndDrinkPage> createState() => _EatAndDrinkPageState();
}

class _EatAndDrinkPageState extends State<EatAndDrinkPage> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController foodTitleController = TextEditingController();
  TextEditingController foodDescriptionController = TextEditingController();
  TextEditingController foodNameController = TextEditingController();
  TextEditingController drinkNameController = TextEditingController();

  Future<void> addToCollection(EatAndDrinks eatAndDrinks)async{
    final CollectionReference eatsAndDrinks = FirebaseFirestore.instance.collection('EatsAndDrinks');
    await eatsAndDrinks.add(
      {
        "foodTitle": eatAndDrinks.foodTitle,
        "foodDescription":eatAndDrinks.foodDescription,
        "foodName":eatAndDrinks.foodName,
        "drinkName":eatAndDrinks.drinkName
      }
    );
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
                //title
                TextFormField(
                  minLines: 1,
                  maxLines: 10,
                  keyboardType: TextInputType.multiline,
                  controller: foodTitleController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Food title',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.normal,fontSize: 18))
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter the Food title';
                    }
                    return null;
                  },
                  //autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 12.0,),
                //foodDescriptionController
                TextFormField(
                  minLines: 1,
                  maxLines: 70,
                  keyboardType: TextInputType.multiline,
                  controller: foodDescriptionController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Food description',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.normal,fontSize: 18))
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter the food description';
                    }
                    return null;
                  },
                  //autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 12.0,),
                //foodNameController
                TextFormField(
                  minLines: 1,
                  maxLines: 2,
                  keyboardType: TextInputType.multiline,
                  controller: foodNameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Food name',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.normal,fontSize: 18))
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter the food name';
                    }
                    return null;
                  },
                  //autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 12.0,),
                //drinkNameController
                TextFormField(
                  minLines: 1,
                  maxLines: 2,
                  keyboardType: TextInputType.multiline,
                  controller: drinkNameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Drink name',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.normal,fontSize: 18))
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter the drink name';
                    }
                    return null;
                  },
                  //autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 12.0,),
                //Image
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
                          EatAndDrinks eatAndDrinks = EatAndDrinks(
                            foodTitle: foodTitleController.text,
                            foodDescription: foodDescriptionController.text,
                            foodName: foodNameController.text,
                            drinkName: drinkNameController.text
                          );
                          addToCollection(eatAndDrinks);
                          foodTitleController.text = '';
                          foodDescriptionController.text = '';
                          foodNameController.text = '';
                          drinkNameController.text = '';


                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  backgroundColor: Colors.green,
                                  content:Text('Eats & Drinks successfully saved',
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
