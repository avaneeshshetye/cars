import 'package:flutter/material.dart';

abstract class ItemListScreen extends StatelessWidget {
  ItemListScreen({Key? key}) : super(key: key);

// final List<Item> items = [
//   Item(name: 'Item 1', imagePath: 'assets/images/image1.jpeg'),
//   Item(name: 'Item 2', imagePath: 'assets/images/image2.jpeg'),
//   // Add more items here
// ];
}

// data.dart
class Item {
  final String name;
  final String imagePath;

  Item({required this.name, required this.imagePath});
}

class Vehicle {
  final String name;
  final String details;
  final List<String> imagePath;

  Vehicle({required this.name, required this.details, required this.imagePath});
}

// List of items for CardDesign
final List<Item> items = [
  Item(name: 'Acura', imagePath: 'assets/images/Acura-Logo-500x281.png'),
  Item(name: 'Audi', imagePath: 'assets/images/AL090142_web_2880.jpg'),
  Item(name: 'BMW', imagePath: 'assets/images/BMW.svg.png'),
  Item(name: 'Mercedes', imagePath: 'assets/images/Mercedes.png'),
  // Add more items as needed
];

// List of detailed vehicle information
final List<Vehicle> vehicles = [
  Vehicle(
      name: 'Acura',
      details: 'Acura is a luxury vehicle division of Honda.',
      imagePath: [
        'assets/images/2024-acura-tlx-type-s-103-6526dc4fd881e.jpg',
        'assets/images/Acura-MDX-luggage-test-ezgif.com-webp-to-jpg-converter.jpg',
        'assets/images/concept_2024_08_09_00.jpg'
      ]),
  Vehicle(
      name: 'BMW',
      details:
          'Forget what you think you know about BMW being the "Ultimate Driving Machine" brand—those days are fading fast. The automaker has lost its way in recent years, prioritizing luxury and in-car technology versus satisfying driving characteristics and cars that communicate road feel and handling nuance to their drivers. Sure, if you look hard enough, you can find BMWs that live up to the hype—we'
          're looking at you, 2-series and M2—but something clearly is amiss when the brand'
          's X3 and X5 SUVs drive better than some of its cars. However, the latest 3-series has earned its way back into our good graces and currently sits atop its segment.',
      imagePath: [
        'assets/images/2023-BMW-7-Series-G70-Aventurine-Red-5.jpg',
        'assets/images/2025_bmw_m5_m_performance_parts_001.jpg',
        'assets/images/IMG_6046.jpg',
        'assets/images/IMG_6047.jpg'
      ]),
  Vehicle(
    name: 'Mercedes',
    details:
        'Mercedes-Benz is a global automobile marque and a division of Daimler AG.',
    imagePath: [],
  ),
  Vehicle(
      name: 'Audi',
      details:
          'Audi is a German luxury brand that has been leading the way in technology innovation and supremely well-built luxury cars for the last two decades. It'
          's known for its diverse range of cars, SUVs, coupes and high-performance models that compete with the likes of BMW and Mercedes-Benz. The A4, A6 and A8 are staples of the sedan range, and the swoopy A7 has long been one of the sleekest cars in its class. Its huge range of SUVs includes the large and long-standing Q7, the compact Q5 and the pint-size Q3. It also includes a range of electric SUVs like the Q8 e-tron, Q4 e-tron and the newly released Q6 e-tron. If performance cars are more to your taste, the V8-powered RS 6 Avant and small-but-mighty RS 3 are there to fuel your need for adrenaline. If you want a vehicle that embodies luxury in look and feel and puts tech and sleek design first, Audi has something for you.',
      imagePath: [
        'assets/images/4cad0a102a3f4805b60219559c5370d4.jpg',
        'assets/images/A243274_large.jpg',
      ]),
  // Add more vehicles as needed
];
