import 'dart:ui';
import 'package:get/get.dart';
import 'package:todomust_app/controllers/persistent/global_controller.dart';

class TranslationController extends GetxController {
  RxBool isKhmer = false.obs;
  final globalController = Get.find<GlobalController>();
  get isKhmerValue => isKhmer.value;

  void switchLanguage(bool value) {
    isKhmer(value);
    globalController.switchLanguage(value);
  }
}

// persistent for switch_locale feature
/*

class TranslationController extends GetxController {
  RxBool isKhmer = false.obs;
  final _box = GetStorage();

  get isKhmerValue => isKhmer.value;

  @override
  void onInit() {
    // TODO: implement onInit
    isKhmer.value = _box.read('isKhmer') ?? false;
    Get.updateLocale(isKhmer.value ? Locale('km', 'KH') : Locale('en', 'US'));
    super.onInit();
  }

  void switchLanguage(bool value) {
    isKhmer(value);
    Get.updateLocale(isKhmer.value ? Locale('km', 'KH') : Locale('en', 'US'));
    _box.write('isKhmer', value);
  }
}


*/
