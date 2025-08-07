import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todomust_app/controllers/translation_controller.dart';
import 'package:todomust_app/services/switch_theme.dart';
import 'package:todomust_app/utils/custom_appbar.dart';

import '../controllers/persistent/global_controller.dart';

class SettingView extends StatelessWidget {
  SettingView({super.key});
  final GlobalController globalController = Get.find<GlobalController>();
  final SwitchThemeService themeController = Get.find<SwitchThemeService>();
  final TranslationController translationController =
      Get.find<TranslationController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'setting'.tr),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Card(
              color: Colors.yellow,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'dark_mode'.tr,
                      style: TextStyle(fontSize: 22, color: Colors.black),
                    ),
                    Obx(
                      () => Switch(
                        activeColor: Colors.black,
                        value: globalController.isDarkTheme.value,
                        onChanged: (value) {
                          themeController.toggleSwitchTheme(value);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: Colors.yellow,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'switch_to_khmer_language'.tr,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    Obx(
                      () => Switch(
                        activeColor: Colors.black,
                        value: globalController.isKhmer.value,
                        onChanged: (value) {
                          translationController.switchLanguage(value);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: Colors.yellow,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'other_settings'.tr,
                      style: TextStyle(fontSize: 22, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              height: 60,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'log_out'.tr,
                    style: TextStyle(fontSize: 22, color: Colors.black),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.defaultDialog(
                        buttonColor: Colors.white,
                        backgroundColor: Colors.yellow,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        titleStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        title: 'Logging out',
                        middleTextStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        middleText: 'Are you sure to log out?',
                        textConfirm: 'Yes',
                        textCancel: 'No',
                        cancelTextColor: Colors.black,
                        confirmTextColor: Colors.black,
                        onCancel: () => Get.back(),
                        onConfirm: () {
                          Get.offAllNamed('/');
                        },
                      );
                    },
                    icon: Icon(Icons.arrow_forward_ios, color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
