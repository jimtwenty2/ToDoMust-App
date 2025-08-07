import 'package:get/get.dart';
import 'package:todomust_app/controllers/imagepicker_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ImagePickerController(), fenix: true);
  }
}
