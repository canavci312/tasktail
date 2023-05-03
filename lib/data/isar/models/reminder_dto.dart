import 'package:isar/isar.dart';
import 'package:task_app/domain/repositories/models/reminder.dart';
part 'reminder_dto.g.dart';

@embedded
class ReminderDto {
  ReminderDto({
    this.type = ReminderType.onTime,
    this.date,
  });
  factory ReminderDto.fromDomainModel(Reminder reminder) {
    return ReminderDto(
      date: reminder.date,
      type: reminder.type,
    );
  }
  final DateTime? date;
  @enumerated
  final ReminderType type;
  //from to domain model
  Reminder toDomainModel() {
    return Reminder(
      date: date,
      type: type,
    );
  }
}
