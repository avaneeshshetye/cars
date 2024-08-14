import 'package:cars/model/carsForSale.dart';
import 'package:cars/whichCar.dart';
import 'package:flutter/material.dart';
import 'package:cars/data.dart';
import 'package:cars/flf.dart';

// cardDesign.dart
// Import WhichCar

// cardDesign.dart
// Import WhichCar

// Update with the correct import path

class CardDesign extends StatelessWidget {
  final Item item;

  const CardDesign(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Find the details of the selected item
        final vehicle = vehicles.firstWhere(
          (v) => v.name == item.name,
          orElse: () => Vehicle(
            name: '',
            details: '',
            imagePath: [],
          ),
        );

        // Find all cars for sale that match the selected item name
        final saleCars = carsForSale.where(
          (car) => car.salename == item.name,
        ).toList();

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WhichCar(
              vehicle: vehicle,
              sales: saleCars, // Pass the list of Sale objects
            ),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                item.name,
                style: Theme.of(context).textTheme.titleLarge,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(width: 10),
              Image.asset(item.imagePath,
                  fit: BoxFit.cover, height: 80, width: 80),
            ],
          ),
        ),
      ),
    );
  }
}
