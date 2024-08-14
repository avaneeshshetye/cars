import 'package:flutter/material.dart';

class SaleCard extends StatelessWidget {
  final String name;
  final String model;
  final String price;
  final String image;

  const SaleCard({
    required this.name,
    required this.model,
    required this.price,
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              "For Sale",
              style: TextStyle(
                fontSize: 18,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Image from network or asset, depending on your data
          // Network image example
          Container(
            height: 150,
            child: Image.network(image),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                model,
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                price,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Icon(Icons.monetization_on_rounded,
                  color: Colors.green, size: 28),
            ],
          ),
        ],
      ),
    );
  }
}
