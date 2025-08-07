import 'package:get/get.dart';
import 'package:todomust_app/controllers/todo_controller.dart';
import 'package:todomust_app/utils/calendar/calendar_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => CalendarController(), fenix: true);
    Get.lazyPut(() => TodoController(), fenix: true);
  }
}
