import 'package:flutter/material.dart';
import 'package:cars/data.dart';
import 'package:cars/flf.dart';

class cardDesign extends StatelessWidget {
  const cardDesign(this.cars, {super.key});

  final Item cars;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(40.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            cars.name,
            style: Theme.of(context).textTheme.titleLarge,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(width: 10),
          Image.asset(cars.imagePath, fit: BoxFit.cover, height: 80, width: 80),
        ],
      ),
    ));
  }
}
