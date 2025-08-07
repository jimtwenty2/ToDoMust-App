import 'package:get/get.dart';
import 'package:todomust_app/controllers/bottomnavbar_controller.dart';
import 'package:todomust_app/controllers/imagepicker_controller.dart';
import 'package:todomust_app/controllers/todo_controller.dart';
import 'package:todomust_app/services/api_service/todo_ApiService.dart';
import '../services/switch_theme.dart';

class TodoBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => TodoApiService(), fenix: true);
    Get.lazyPut(() => TodoController(), fenix: true);
  }
}
