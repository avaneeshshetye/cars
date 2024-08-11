import 'package:flutter/material.dart';

abstract class ItemListScreen extends StatelessWidget {
   ItemListScreen({Key? key}) : super(key: key);

// final List<Item> items = [
//   Item(name: 'Item 1', imagePath: 'assets/images/image1.jpeg'),
//   Item(name: 'Item 2', imagePath: 'assets/images/image2.jpeg'),
//   // Add more items here
// ];

}

class Item {
  final String name;
  final String imagePath;

  Item({required this.name, required this.imagePath});
}
