import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/theme_controller.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => Text(
                  'Click on switch to change to ${themeController.isLightTheme.value ? 'Dark' : 'Light'} theme',
                ),
              ),
              ObxValue(
                (data) => Switch(
                  value: themeController.isLightTheme.value,
                  onChanged: (val) {
                    themeController.toggleTheme();
                  },
                ),
                false.obs,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
