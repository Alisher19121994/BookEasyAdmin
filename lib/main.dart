import 'package:book_easy_admin/features/presentation/pages/screens/home/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'features/presentation/pages/screens/bookings/bookings_page.dart';
import 'features/presentation/pages/screens/home/update_page/update_sales_page.dart';
import 'features/presentation/pages/screens/main_screen.dart';
import 'features/presentation/pages/screens/profile/profile_page.dart';
import 'features/presentation/pages/screens/profile/tabs/deals_page.dart';
import 'features/presentation/pages/screens/profile/tabs/eat_and_drink.dart';
import 'features/presentation/pages/screens/profile/tabs/travel_articles.dart';
import 'features/presentation/pages/screens/profile/tabs/travel_tips.dart';
import 'features/presentation/pages/screens/saved/saved_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyD6QU0M8dv0sLZzHsIkANhZUDfSNeVDr-Q",
          appId: "1:887844536975:web:e3b7a819611091bc7866fa",
          messagingSenderId: "887844536975",
          projectId: "bookeasy-9fd9c"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const MainScreenPage(), routes: {
      HomePage.id: (context) => const HomePage(),
      SavedPage.id: (context) => const SavedPage(),
      BookingsPage.id: (context) => const BookingsPage(),
      ProfilePage.id: (context) => const ProfilePage(),
      UpdateHomeSalesPage.id: (context) =>  const UpdateHomeSalesPage(),
      TravelArticlesPage.id: (context) =>  const TravelArticlesPage(),
      EatAndDrinkPage.id: (context) =>  const EatAndDrinkPage(),
      TravelTipsPage.id: (context) =>  const TravelTipsPage(),
      DealsPage.id: (context) =>  const DealsPage(),
    });
  }
}
