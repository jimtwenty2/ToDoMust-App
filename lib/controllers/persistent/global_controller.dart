import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class GlobalController extends GetxController {
  final _box = GetStorage();

  // Add-Wide states
  RxBool isDarkTheme = false.obs;
  RxBool isKhmer = false.obs;

  RxString? profileImage = ''.obs;
  RxString? coverImage = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit

    // Restore saved preferences
    isDarkTheme.value = _box.read('isDarkTheme') ?? false;
    isKhmer.value = _box.read('isKhmer') ?? false;
    profileImage?.value = _box.read('profileImage') ?? '';
    coverImage?.value = _box.read('coverImage') ?? '';
    // apply theme and locale ( language ) immediately
    Get.changeThemeMode(isDarkTheme.value ? ThemeMode.dark : ThemeMode.light);
    Get.updateLocale(isKhmer.value ? Locale('km', 'KH') : Locale('en', 'US'));

    super.onInit();
  }

  // toggle theme change
  void toggleTheme(bool value) {
    isDarkTheme.value = value;
    _box.write('isDarkTheme', value);
    Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
  }

  // toggle locale change
  void switchLanguage(bool value) {
    isKhmer.value = value;
    _box.write('isKhmer', value);
    Get.updateLocale(value ? Locale('km', 'KH') : Locale('en', 'US'));
  }

  ImagePicker imagePicker = ImagePicker();

  Future getImage() async {
    final imagePicked = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (imagePicked != null) {
      profileImage!.value = imagePicked.path.toString();
      _box.write('profileImage', profileImage!.value);
    }
  }

  // for Cover image
  Future<void> pickCoverImage() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      coverImage!.value = pickedFile.path.toString();
      _box.write('coverImage', coverImage!.value);
    }
  }
}
