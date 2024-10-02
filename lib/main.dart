import 'package:chip_source/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/theme_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeController _themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
          () {
        return GetMaterialApp(
          title: 'Admin Dashboard',
          theme: _themeController.theme,
          home: const SplashScreen(),
        );
      },
    );
  }
}
