import 'package:cars/cars.dart';
import 'package:cars/display.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      routes: {'/displayScreen': (context) => const DisplayScreen()},
      home: Cars(),
    ),
  );
}
