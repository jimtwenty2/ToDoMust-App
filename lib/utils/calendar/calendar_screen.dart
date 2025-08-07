import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todomust_app/controllers/translation_controller.dart';
import 'package:todomust_app/utils/calendar/calendar_controller.dart';

class CalendarScreen extends StatelessWidget {
  CalendarScreen({super.key});
  final calendarController = Get.find<CalendarController>();
  final translationController = Get.find<TranslationController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Obx(
              () => Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: calendarController.prevMonth,
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                    Text(
                      calendarController.formatDateWithLocale(
                        translationController.isKhmerValue ? 'km' : 'en',
                      ),
                      style: TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      onPressed: calendarController.nextMonth,
                      icon: Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            const SizedBox(height: 15),
            buildDayLabels(),
            const SizedBox(height: 15),
            Obx(() => buildCalendarGrid(calendarController)),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  Widget buildDayLabels() {
    final days = [
      'sun'.tr,
      'mon'.tr,
      'tue'.tr,
      'wed'.tr,
      'thu'.tr,
      'fri'.tr,
      'sat'.tr,
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: days
          .map(
            (day) => Expanded(
              child: Center(
                child: Text(day, style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget buildCalendarGrid(CalendarController calendarController) {
    final firstDay = calendarController.firstDayOfMonth; // August 1st, 2025
    // It means : 1 = mon , 2 = tue, ... , 7 = sun
    final startingWeekday = firstDay.weekday % 7; //  Sunday = 0
    final totalDays = calendarController.daysInMonth;
    final totalCells = totalDays + startingWeekday;
    final selected = calendarController.selectedDate.value;

    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: totalCells,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
        ),
        itemBuilder: (_, index) {
          if (index < startingWeekday) {
            return const SizedBox.shrink(); // empty cell
          } else {
            final day = index - startingWeekday + 1;
            final currentDate = DateTime(selected.year, selected.month, day);
            final isSelected =
                currentDate.day == selected.day &&
                currentDate.month == selected.month &&
                currentDate.year == selected.year;
            return GestureDetector(
              onTap: () {
                calendarController.selectDate(currentDate);
              },
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.purpleAccent : Colors.yellow,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  day.toString(),
                  style: TextStyle(color: Colors.black),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
