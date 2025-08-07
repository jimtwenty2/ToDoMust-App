import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CalendarController extends GetxController {
  var selectedDate = DateTime.now().obs;
  // Get the first day of the current month
  DateTime get firstDayOfMonth =>
      DateTime(selectedDate.value.year, selectedDate.value.month, 1);

  // Get total days in current month
  int get daysInMonth =>
      DateTime(selectedDate.value.year, selectedDate.value.month + 1, 0).day;
  /*
      DateTime(year, month, 0) gives you the last day of the previous month.
      So:
      DateTime(2025, 9, 0).day  // = 31

      DateTime(y, m+1, 0)	Goes to last day of month m
      .day	Extracts the day number (i.e. total days in month)
   */

  // Navigate to next month
  void nextMonth() {
    selectedDate.value = DateTime(
      selectedDate.value.year,
      selectedDate.value.month + 1,
    );
  }

  // void navigate to previous month
  void prevMonth() {
    selectedDate.value = DateTime(
      selectedDate.value.year,
      selectedDate.value.month - 1,
    );
  }

  String get monthYearFormat =>
      DateFormat.yMMMM().format(selectedDate.value); // August 2025

  String get dayMonthYearFormat =>
      DateFormat.yMMMMd().format(selectedDate.value);

  String get formattedDate =>
      DateFormat('yyyy-MM-dd').format(selectedDate.value); // 2025-08-06

  String formatDateWithLocale(String langCode) {
    return DateFormat('d MMMM yyyy', langCode).format(selectedDate.value);
  }

  void selectDate(DateTime date) {
    selectedDate.value = date;
  }
}
