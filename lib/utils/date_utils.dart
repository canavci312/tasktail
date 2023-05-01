import 'package:dart_date/dart_date.dart';

class AppDateUtils {
  static DateTime setAddTaskDate(DateTime date) {
    if (date.isToday) {
      return date.setHour(DateTime.now().hour + 1, 0, 0, 0);
    } else {
      return date.setHour(9, 0, 0, 0);
    }
  }
}
