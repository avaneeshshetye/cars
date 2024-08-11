// import 'package:cars/flf.dart';
import 'dart:core';
import 'dart:core';

import 'package:cars/flf.dart';
import 'package:flutter/material.dart';

class DisplayScreen extends StatefulWidget {
  const DisplayScreen({Key? key}) : super(key: key);

  @override
  State<DisplayScreen> createState() {
    return _DisplayScreen();
  }
}

class _DisplayScreen extends State<DisplayScreen> {
  int _selectedIndex = 0; // To keep track of the selected tab index

  // List of tabs for the bottom navigation bar

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: const TextStyle(fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                        const BorderSide(width: 0, style: BorderStyle.none),
                  ),
                  filled: true,
                  fillColor: Colors.grey[50],
                  contentPadding: const EdgeInsets.only(
                    left: 30,
                  ),
                  suffixIcon: const Padding(
                    padding: EdgeInsets.only(right: 24, left: 16),
                    child: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 110, // Adjust the height as needed
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: carOptions.length,
                itemBuilder: (context, index) {
                  return OptionItem(
                    title: carOptions[index]['title'],
                    image: carOptions[index]['image'],
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> carOptions = [
  {'title': 'Browse All', 'image': 'assets/icons/list.png'},
  {'title': 'Classic', 'image': 'assets/icons/classic-car.png'},
  {'title': 'Sedan', 'image': 'assets/icons/Sedan.png'},
  {'title': 'Hatchback', 'image': 'assets/icons/hatchback.png'},
  {'title': 'Hybrid', 'image': 'assets/icons/hybrid-car.png'},
  {'title': 'Convertible', 'image': 'assets/icons/convertible-car.png'},
  {'title': 'SUV', 'image': 'assets/icons/SUV.png'},
  {'title': 'Electric', 'image': 'assets/icons/electric-car.png'},
  {'title': 'Truck', 'image': 'assets/icons/pickup-truck.png'},
];
