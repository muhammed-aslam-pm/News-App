import 'package:flutter/material.dart';
import 'package:news_app_with_api/controller/bottom_nav_controller.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.of<BottomNavController>(context)
          .myPages[Provider.of<BottomNavController>(context).selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: Provider.of<BottomNavController>(context).selectedIndex,
          onTap: Provider.of<BottomNavController>(context, listen: false)
              .onItemTap,
          elevation: 0,
          selectedIconTheme: IconThemeData(
            color: Colors.black,
            size: 25,
          ),
          unselectedIconTheme: IconThemeData(
            size: 25,
          ),
          selectedItemColor: Colors.black,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: "Category"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          ]),
    );
  }
}
