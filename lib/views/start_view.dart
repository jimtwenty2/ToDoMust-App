import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:todomust_app/routes/app_Route.dart';
import 'package:todomust_app/views/main_view.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(height: Get.height * .5, color: Colors.purple),
              Container(
                height: Get.height * .5,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(150),
                  ),
                ),
              ),
              Positioned(
                left: 110,
                top: 170,
                child: Image.network(
                  'https://cdn-icons-png.flaticon.com/128/4557/4557251.png',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(height: Get.height * .5, color: Colors.yellow),
              Container(
                height: Get.height * .5,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(150),
                  ),
                ),
              ),
              Positioned(
                left: 45,
                top: 150,
                child: Column(
                  children: [
                    SizedBox(
                      width: Get.width * .8,
                      child: Text(
                        textAlign: TextAlign.center,
                        'Stay focused, fuel your passion, and finish strong—your engineering goals are just a task away!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        Get.offAllNamed('/main_view');
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 5,
                        backgroundColor: Colors.yellow,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text('get_start'.tr),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
