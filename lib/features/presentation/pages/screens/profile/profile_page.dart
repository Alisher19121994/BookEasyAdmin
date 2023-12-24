import 'package:book_easy_admin/features/presentation/pages/screens/profile/tabs/airport_taxis.dart';
import 'package:book_easy_admin/features/presentation/pages/screens/profile/tabs/deals_page.dart';
import 'package:book_easy_admin/features/presentation/pages/screens/profile/tabs/eat_and_drink.dart';
import 'package:book_easy_admin/features/presentation/pages/screens/profile/tabs/travel_articles.dart';
import 'package:book_easy_admin/features/presentation/pages/screens/profile/tabs/travel_tips.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  static const String id = 'ProfilePage';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff003290),
          bottom: const TabBar(
            physics: ScrollPhysics(),
            isScrollable: true,
            indicatorColor: Colors.white,
            unselectedLabelStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 18),
            labelStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20),
            tabs: [
              Tab(
                child: Text(
                  "Deals",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.normal),
                ),
              ),
              Tab(
                child: Text(
                  "Travel Articles",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.normal),
                ),
              ),
              Tab(
                child: Text(
                  "Eats & Drinks",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.normal),
                ),
              ),
              Tab(
                child: Text(
                  "Travel tips",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.normal),
                ),
              ),
              Tab(
                child: Text(
                  "Airport taxis",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
            children: [
              DealsPage(),
              TravelArticlesPage(),
              EatAndDrinkPage(),
              TravelTipsPage(),
              AirportTaxisPages()
            ]),
      ),
    );
  }
}
