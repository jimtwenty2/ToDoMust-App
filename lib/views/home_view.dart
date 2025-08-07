import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todomust_app/controllers/todo_controller.dart';
import 'package:todomust_app/utils/calendar/calendar_controller.dart';
import 'package:todomust_app/utils/calendar/calendar_screen.dart';
import 'package:todomust_app/utils/custom_appbar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final CalendarController calendarController =
        Get.find<CalendarController>();
    final TodoController todoController = Get.find<TodoController>();

    return Scaffold(
      appBar: customAppBar(title: 'todo'.tr),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: Get.height * .55, child: CalendarScreen()),

          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              todoController.filterListByDate(calendarController.formattedDate);
              Get.toNamed(
                '/todo_view',
                arguments: calendarController.formattedDate,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text('your_todo'.tr),
          ),
        ],
      ),
    );
  }
}
