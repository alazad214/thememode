import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.amber,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.amber,
      disabledColor: Colors.grey,
    ),
  );

  final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blue,
      disabledColor: Colors.grey,
    ),
  );

  final isLightTheme = true.obs;
  late SharedPreferences _prefs;

  @override
  void onInit() {
    super.onInit();
    _loadThemeFromPrefs();
  }

  Future<void> _loadThemeFromPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    isLightTheme.value = _prefs.getBool('isLightTheme') ?? true;
    updateTheme();
  }

  void updateTheme() {
    Get.changeThemeMode(isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
  }

  void toggleTheme() {
    isLightTheme.value = !isLightTheme.value;
    _prefs.setBool('isLightTheme', isLightTheme.value);
    updateTheme();
  }
}
