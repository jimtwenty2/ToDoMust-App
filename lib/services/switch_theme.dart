import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todomust_app/controllers/persistent/global_controller.dart';

class SwitchThemeService extends GetxController {
  RxBool isDarkTheme = false.obs;

  final globalController = Get.find<GlobalController>();

  ThemeMode get currentTheme =>
      isDarkTheme.value ? ThemeMode.dark : ThemeMode.light;

  void toggleSwitchTheme(bool value) {
    isDarkTheme.value = value;
    globalController.toggleTheme(value);
  }
}

// persistent for switch_theme feature
/*
class SwitchThemeService extends GetxController {
  RxBool isDarkTheme = false.obs;
  final _box = GetStorage();

  ThemeMode get currentTheme =>
      isDarkTheme.value ? ThemeMode.dark : ThemeMode.light;

  @override
  void onInit() {
    // TODO: implement onInit
    isDarkTheme.value = _box.read('isDarkTheme') ?? false;
    Get.changeThemeMode(currentTheme);
    super.onInit();
  }

  void toggleSwitchTheme(bool value) {
    isDarkTheme.value = value;
    Get.changeThemeMode(currentTheme);
    _box.write('isDarkTheme', value);
  }
}

 */
