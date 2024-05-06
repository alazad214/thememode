import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thememode/screens/home_screen.dart';
import 'controllers/theme_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key, });

  final themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: themeController.lightTheme,
      darkTheme: themeController.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),

    );
  }
}
