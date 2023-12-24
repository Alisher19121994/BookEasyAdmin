import 'package:book_easy_admin/features/data/model/airport_taxis.dart';
import 'package:book_easy_admin/features/data/model/travel_tips.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AirportTaxisPages extends StatefulWidget {
  const AirportTaxisPages({super.key});
  static const String id = 'AirportTaxisPages';
  @override
  State<AirportTaxisPages> createState() => _AirportTaxisPagesState();
}

class _AirportTaxisPagesState extends State<AirportTaxisPages> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController pickUpLocationController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  TextEditingController tellUsWhenController = TextEditingController();


  Future<String?> createAirportTaxisCollection(AirportTaxisModel airportTaxisModel)async{
    final CollectionReference airportTaxis = FirebaseFirestore.instance.collection('AirportTaxis');
    await airportTaxis.add({
      "title" : airportTaxisModel.title,
      "description" : airportTaxisModel.description,
      "pickUpLocation" : airportTaxisModel.pickUpLocation,
      "destination" : airportTaxisModel.destination,
      "tellUsWhen" : airportTaxisModel.tellUsWhen,
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
                  maxLines: 2,
                  keyboardType: TextInputType.multiline,
                  controller: titleController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Enter title',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.normal,fontSize: 18))
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter the Enter title';
                    }
                    return null;
                  },
                  //autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 12.0,),
                //article description
                TextFormField(
                  minLines: 1,
                  maxLines: 10,
                  keyboardType: TextInputType.multiline,
                  controller: descriptionController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Description',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.normal,fontSize: 18))
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter the description';
                    }
                    return null;
                  },
                  //autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 12.0,),
                //Enter pick-up location
                TextFormField(
                  minLines: 1,
                  maxLines: 1,
                  keyboardType: TextInputType.multiline,
                  controller: pickUpLocationController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Enter pick-up location',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.normal,fontSize: 18))
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter the Enter pick-up location';
                    }
                    return null;
                  },
                  //autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 12.0,),
                //Enter destination
                TextFormField(
                  minLines: 1,
                  maxLines: 1,
                  keyboardType: TextInputType.multiline,
                  controller: destinationController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Enter destination',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.normal,fontSize: 18))
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter the Enter destination';
                    }
                    return null;
                  },
                  //autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 12.0,),
                //tellUsWhenController
                TextFormField(
                  minLines: 1,
                  maxLines: 1,
                  keyboardType: TextInputType.multiline,
                  controller: tellUsWhenController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Enter tell us',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.normal,fontSize: 18))
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter the Enter tell us';
                    }
                    return null;
                  },
                  //autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 12.0,),
                //save button
                SizedBox(
                  height: 45,
                  width: 160,
                  child: ElevatedButton(
                      onPressed: ()async{
                        if(_formKey.currentState!.validate()){
                          AirportTaxisModel airportTaxisModel  = AirportTaxisModel(
                              title: titleController.text,
                              description: descriptionController.text,
                              pickUpLocation: pickUpLocationController.text,
                              destination: destinationController.text,
                              tellUsWhen: tellUsWhenController.text

                          );
                          createAirportTaxisCollection(airportTaxisModel);
                          titleController.text = '';
                          descriptionController.text = '';

                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  backgroundColor: Colors.green,
                                  content:Text('Airport Taxis data successfully saved',
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
