import 'package:cars/display.dart';
import 'package:cars/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cars extends StatefulWidget {
  const Cars({Key? key}) : super(key: key);

  @override
  State<Cars> createState() {
    return _CarsState();
  }
}

class _CarsState extends State<Cars> {
  late Widget activeScreen;

  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(switchScreen);
  }

  switchScreen() {
    setState(() {
      activeScreen = const DisplayScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const Icon(
                Icons.directions_car, // Add your car icon here
                color: Colors.amberAccent,
                size: 40,
              ),
              const SizedBox(width: 8), // Adjust the spacing as needed
              Text(
                "Avaneesh's Car App",
                style: GoogleFonts.acme(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blueAccent,
                Colors.blueGrey,
              ],
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
