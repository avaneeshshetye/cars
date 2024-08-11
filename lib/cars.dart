import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cars/display.dart'; // Assuming DisplayScreen is imported correctly
import 'package:cars/start_screen.dart'; // Assuming StartScreen is imported correctly

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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Container(
            child: Row(
              children: [
                const Icon(
                  Icons.directions_car,
                  color: Colors.amberAccent,
                  size: 40,
                ),
                const SizedBox(width: 8),
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
        ),
        // Drawer is associated with Scaffold, not AppBar directly
        drawer: activeScreen is DisplayScreen? DrawerWidget() : null,
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

// Example of a Drawer Widget
class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
