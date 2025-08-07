import 'package:get/get.dart';
import 'package:todomust_app/controllers/imagepicker_controller.dart';
import 'package:todomust_app/controllers/todo_controller.dart';
import 'package:todomust_app/services/switch_theme.dart';
import 'package:todomust_app/utils/calendar/calendar_controller.dart';

class BottomNavigationBarController extends GetxController {
  RxInt currentScreen = 0.obs;

  void changeTabIndex(int newIndex) {
    // Delete the controller of the current (old) tab before switching
    _deleteControllerForTab(newIndex);

    currentScreen.value = newIndex;
  }

  void _deleteControllerForTab(int index) {
    switch (index) {
      case 0:
        if (Get.isRegistered<ImagePickerController>()) {
          Get.delete<ImagePickerController>();
        }
        break;
      case 1:
        if (Get.isRegistered<TodoController>()) {
          Get.delete<TodoController>();
        }
        if (Get.isRegistered<SwitchThemeService>()) {
          Get.delete<SwitchThemeService>();
        }
        if (Get.isRegistered<CalendarController>()) {
          Get.delete<CalendarController>();
        }
        break;
      case 2:
        if (Get.isRegistered<ImagePickerController>()) {
          Get.delete<ImagePickerController>();
        }
        if (Get.isRegistered<TodoController>()) {
          Get.delete<TodoController>();
        }
        if (Get.isRegistered<CalendarController>()) {
          Get.delete<CalendarController>();
        }
        break;
    }
  }
}
