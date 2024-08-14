import 'dart:async';
import 'package:cars/data.dart';
import 'package:cars/model/carsForSale.dart';
import 'package:flutter/material.dart';
import 'package:cars/saleCard.dart'; // Ensure this import is correct

class WhichCar extends StatefulWidget {
  final Vehicle vehicle;
  final List<Sale> sales;

  const WhichCar({
    Key? key,
    required this.vehicle,
    required this.sales,
  }) : super(key: key);

  @override
  _WhichCarState createState() => _WhichCarState();
}

class _WhichCarState extends State<WhichCar> {
  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < widget.vehicle.imagePath.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.vehicle.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Slideshow
            SizedBox(
              height: widget.vehicle.name == 'BMW' ||
                      widget.vehicle.name == 'Audi' ||
                      widget.vehicle.name == 'Acura'
                  ? 600
                  : 400,
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.vehicle.imagePath.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset(widget.vehicle.imagePath[index]),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                widget.vehicle.name,
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Times New Roman',
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                widget.vehicle.details,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Conditionally display SaleCard widgets or "No cars for sale"
            widget.sales.isNotEmpty
                ? SizedBox(
                    height: 400, // Adjust height as needed
                    child: GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 6, // 6 cards per row
                        crossAxisSpacing: 8.0, // Adjust spacing as needed
                        mainAxisSpacing: 8.0, // Adjust spacing as needed
                        childAspectRatio: 0.75, // Adjust aspect ratio as needed
                      ),
                      itemCount: widget.sales.length,
                      itemBuilder: (context, index) {
                        final sale = widget.sales[index];
                        return SaleCard(
                          name: sale.salename,
                          model: sale.model,
                          price: sale.price,
                          image: sale.image,
                        );
                      },
                    ),
                  )
                : const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'No cars for sale',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
