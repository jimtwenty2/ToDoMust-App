import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todomust_app/controllers/bottomnavbar_controller.dart';
import 'package:todomust_app/data/list_AppScreen.dart';
import 'package:todomust_app/utils/custom_bottomnavbar.dart';

class MainView extends StatelessWidget {
  MainView({super.key});
  final bottomNavBarController = Get.find<BottomNavigationBarController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => listScreen[bottomNavBarController.currentScreen.value]),
      bottomNavigationBar: CustomBottomNavbar(),
    );
  }
}
