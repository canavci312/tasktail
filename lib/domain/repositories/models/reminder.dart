import 'package:task_app/utils/date_utils.dart';

class Reminder {
  Reminder({
    required this.type,
    this.date,
  });
  final DateTime? date;
  final ReminderType type;
  @override
  String toString() {
    switch (type) {
      case ReminderType.onTime:
        return 'On Time';
      case ReminderType.fiveMinutes:
        return '5 minutes before';
      case ReminderType.tenMinutes:
        return '10 minutes before';
      case ReminderType.oneHour:
        return '1 hour before';
      case ReminderType.atSpecificTime:
        return AppDateUtils.formatHour(date!);
      case ReminderType.atSpecificTimeAndDate:
        return AppDateUtils.formatHour(date!);
    }
  }
}

enum ReminderType {
  onTime,
  fiveMinutes,
  tenMinutes,
  oneHour,
  atSpecificTime,
  atSpecificTimeAndDate;
}
