import 'package:get/get.dart';
import 'package:todomust_app/controllers/bottomnavbar_controller.dart';

class BottomNavBarBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => BottomNavigationBarController());
  }
}
