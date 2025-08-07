import 'dart:io';

import 'package:flutter/material.dart';
import 'package:todomust_app/controllers/imagepicker_controller.dart';
import 'package:todomust_app/controllers/persistent/global_controller.dart';
import 'package:todomust_app/utils/custom_appbar.dart';
import 'package:get/get.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});
  final text = lorem(paragraphs: 3, words: 120);
  final ImagePickerController imageController =
      Get.find<ImagePickerController>();
  final globalController = Get.find<GlobalController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'profile'.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * .3,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Obx(
                        () => Stack(
                          children: [
                            Container(
                              width: Get.width,
                              height: Get.height * .243,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                image: globalController.coverImage!.value == ''
                                    ? null
                                    : DecorationImage(
                                        image: FileImage(
                                          File(
                                            globalController.coverImage!.value,
                                          ),
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                            Positioned(
                              right: 5,
                              bottom: 10,
                              child: SizedBox(
                                width: 110,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {
                                    imageController.pickCoverImage();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white.withOpacity(
                                      0.60,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    'add_cover'.tr,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -50,
                      child: Column(
                        children: [
                          SizedBox(
                            height:
                                130, // Make sure this is enough to see everything
                            child: Stack(
                              clipBehavior: Clip.none, // this is key
                              children: [
                                Obx(
                                  () => CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 70,
                                    backgroundImage:
                                        globalController
                                            .profileImage!
                                            .value
                                            .isEmpty
                                        ? NetworkImage(
                                            scale: 0.5,
                                            'https://cdn-icons-png.flaticon.com/128/11107/11107521.png',
                                          )
                                        : FileImage(
                                                File(
                                                  globalController
                                                      .profileImage!
                                                      .value,
                                                ),
                                              )
                                              as ImageProvider,
                                  ),
                                ),
                                Positioned(
                                  right: -10,
                                  bottom: -5,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      imageController.getImage();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: CircleBorder(),
                                    ),
                                    child: Icon(Icons.camera_alt),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 10),
                          Text(
                            'TT Hicuup',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border(),
                ),
                child: Text(
                  text,
                  style: TextStyle(fontFamily: 'GoogleSansCode'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
