import 'package:get/get.dart';
import 'package:todomust_app/controllers/translation_controller.dart';

class TranslationBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => TranslationController());
  }
}
