import 'package:flutter/material.dart';
import 'package:news_app_with_api/controller/bottom_nav_controller.dart';
import 'package:news_app_with_api/controller/category_controller.dart';
import 'package:news_app_with_api/controller/home_screen_controller.dart';
import 'package:news_app_with_api/controller/search_screen_controller.dart';
import 'package:news_app_with_api/view/bottom_nav_bar/nav_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => BottomNavController(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryController(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}
