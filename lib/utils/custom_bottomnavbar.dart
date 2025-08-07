import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todomust_app/controllers/bottomnavbar_controller.dart';
import 'package:todomust_app/data/list_CustomNavBar.dart';

class CustomBottomNavbar extends StatelessWidget {
  CustomBottomNavbar({super.key});
  final BottomNavigationBarController bottomNavBarController =
      Get.find<BottomNavigationBarController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      height: 80,
      margin: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(offset: Offset(2, 2))],
      ),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: listCustomBottomNavBar.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              bottomNavBarController.changeTabIndex(index);
            },
            child: Obx(() {
              bool isSelected =
                  index == bottomNavBarController.currentScreen.value;
              return Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 50, top: 3),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // <-- add this
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      listCustomBottomNavBar[index]['icon'],
                      width: isSelected ? 35 : 25,
                      height: isSelected ? 30 : 20,
                      color: isSelected ? Colors.purple : Colors.black,
                    ),
                    Text(
                      listCustomBottomNavBar[index]['label'].toString().tr,
                      style: TextStyle(color: Colors.black, fontSize: 11),
                    ),
                  ],
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
