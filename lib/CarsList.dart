import 'package:flutter/material.dart';
import 'package:cars/data.dart';
import 'package:cars/cardDesign.dart'; // Import your cardDesign widget

class CarsList extends StatelessWidget {
  final List<Item> items;

  const CarsList({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(0), // Remove any internal padding
            child: CardDesign(items[index]),
          );
        },
      ),
    );
  }
}
