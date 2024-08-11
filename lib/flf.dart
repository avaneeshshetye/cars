import 'package:cars/CarsList.dart';
import 'package:flutter/material.dart';
import 'package:cars/data.dart';

class OptionItem extends StatefulWidget {
  final String title;
  final String image; // Provide the path to the image

  const OptionItem({Key? key, required this.title, required this.image})
      : super(key: key);

  @override
  _OptionItemState createState() => _OptionItemState();
}

class _OptionItemState extends State<OptionItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: InkWell(
        onTap: () {
          if (widget.title == 'Browse All') {
            // Replace this with the actual list of items you want to pass
            List<Item> items = [
              Item(
                  name: 'Acura',
                  imagePath: 'assets/images/Acura-Logo-500x281.png'),
              Item(
                  name: 'Audi',
                  imagePath: 'assets/images/AL090142_web_2880.jpg'),
              Item(name: 'BMW', imagePath: 'assets/images/BMW.svg.png'),
              Item(
                  name: 'Mercedes',
                  imagePath:
                      'assets/images/png-transparent-mercedes-benz-logo-mercedes-benz-sprinter-car-mercedes-benz-s-class-mercedes-benz-a-class-mercedes-logo-angle-free-logo-design-template-png-graphics.png')
              // Add more items as needed
            ];
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CarsList(items: items)),
            );
          } else {
            // Handle other options' tap logic if needed
          }
        },
        focusColor: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: widget.title == 'Browse All'
                ? isHovered
                    ? Colors.orange[700] // Dark orange when hovered
                    : Colors.orange[600] // Regular orange
                : isHovered
                    ? Colors.purple[300] // Dark purple when hovered
                    : Colors.purple[200], // Regular purple
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  widget.image,
                  height: 50,
                  width: 50,
                ),
              ),
              //const SizedBox(height: 8),
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// final List<Map<String, dynamic>> carOptions = [
//   {'title': 'Browse All', 'image': 'assets/icons/list.png'},
//   {'title': 'Classic', 'image': 'assets/icons/classic-car.png'},
//   {'title': 'Sedan', 'image': 'assets/icons/Sedan.png'},
//   {'title': 'Hatchback', 'image': 'assets/icons/hatchback.png'},
//   {'title': 'Hybrid', 'image': 'assets/icons/hybrid-car.png'},
//   {'title': 'Convertible', 'image': 'assets/icons/convertible-car.png'},
//   {'title': 'SUV', 'image': 'assets/icons/SUV.png'},
//   {'title': 'Electric Vehicle', 'image': 'assets/icons/electric-car.png'},
//   {'title': 'Truck', 'image': 'assets/icons/pickup-truck.png'},
// ];
