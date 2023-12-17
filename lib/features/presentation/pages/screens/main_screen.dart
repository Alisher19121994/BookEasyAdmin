import 'package:book_easy_admin/features/presentation/pages/screens/bookings/bookings_page.dart';
import 'package:book_easy_admin/features/presentation/pages/screens/profile/profile_page.dart';
import 'package:book_easy_admin/features/presentation/pages/screens/saved/saved_page.dart';
import 'package:flutter/material.dart';

import 'home/home_page.dart';

class MainScreenPage extends StatefulWidget {
  const MainScreenPage({super.key});
static const String id = 'MainScreenPage';
  @override
  State<MainScreenPage> createState() => _MainScreenPageState();
}

class _MainScreenPageState extends State<MainScreenPage> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0.0,
        centerTitle: true,
        title: const Text('BookEasy Admin',style: TextStyle(color: Colors.white,fontSize: 24.0,fontWeight: FontWeight.bold),),
      ),
      body: Row(
        children: <Widget>[
          NavigationRail(
            labelType: NavigationRailLabelType.selected,
            selectedLabelTextStyle: const TextStyle(color: Colors.blue),
            unselectedLabelTextStyle: const TextStyle(color: Colors.black),
              onDestinationSelected:(int index){
                setState(() {
                  selectedIndex = index;
                });
              } ,
              selectedIndex: selectedIndex,
            destinations: const [
              NavigationRailDestination(
                  indicatorColor: Colors.blue,
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: Text('Home',style: TextStyle(color: Colors.blue,fontSize: 12.0,fontWeight: FontWeight.bold),)),
              NavigationRailDestination(
                  indicatorColor: Colors.blue,
                  icon: Icon(Icons.favorite_border),
                  selectedIcon: Icon(Icons.favorite),
                  label: Text('Saved',style: TextStyle(color: Colors.blue,fontSize: 12.0,fontWeight: FontWeight.bold),)),
              NavigationRailDestination(
                  indicatorColor: Colors.blue,
                  icon: Icon(Icons.book_outlined),
                  selectedIcon: Icon(Icons.book),
                  label: Text('Bookings',style: TextStyle(color: Colors.blue,fontSize: 12.0,fontWeight: FontWeight.bold),)),
              NavigationRailDestination(
                indicatorColor: Colors.blue,
                  icon: Icon(Icons.perm_identity_rounded),
                  selectedIcon: Icon(Icons.person),
                  label: Text('Profile',style: TextStyle(color: Colors.blue,fontSize: 12.0,fontWeight: FontWeight.bold),)),

            ],),
          const VerticalDivider(thickness: 1.0,width: 1.0,),
          Expanded(child: _build(selectedIndex))
        ],
      ),
    );
  }

  _build(int index){
    switch(index){
      case 0: return const HomePage();
      case 1: return const SavedPage();
      case 2: return const BookingsPage();
      case 3: return const ProfilePage();
    }
  }
}
