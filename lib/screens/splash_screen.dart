import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_screen.dart'; // Import GetX package for navigation.

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the main screen after 3 seconds using GetX.
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() => const LoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Use a linear gradient for the background color.
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF8D6E63), // Brownish color resembling wood.
              Color(0xFFD7CCC8), // Lighter brownish tone for gradient effect.
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              // Chip Widget for centered text.
              Chip(
                label: Text(
                  'Chip Source',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: Color(0xFF5D4037), // Darker brown background for chip.
              ),
              SizedBox(height: 20),
              CircularProgressIndicator(
                color: Colors.white, // Set the indicator color to white for contrast.
              ),
            ],
          ),
        ),
      ),
    );
  }
}

