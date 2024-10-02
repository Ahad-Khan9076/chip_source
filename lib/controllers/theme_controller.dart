import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ThemeController extends GetxController {
  // Default theme is light
  var isDarkMode = false.obs;

  // Method to toggle the theme
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
  }

  ThemeData get theme => isDarkMode.value ? ThemeData.dark() : ThemeData.light();
}
