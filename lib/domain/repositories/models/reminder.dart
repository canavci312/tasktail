class Reminder {
  Reminder({
    required this.type,
    this.date,
  });
  final DateTime? date;
  final ReminderType type;
}

enum ReminderType {
  onTime,
  fiveMinutes,
  tenMinutes,
  oneHour,
  atSpecificTime,
  atSpecificTimeAndDate,
}
