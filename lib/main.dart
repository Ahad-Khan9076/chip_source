import 'package:chip_source/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import the GetX package.


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
