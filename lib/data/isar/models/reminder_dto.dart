import 'package:isar/isar.dart';
import 'package:task_app/domain/repositories/models/reminder.dart';
part 'reminder_dto.g.dart';

@embedded
class ReminderDto {
  ReminderDto({this.date});
  factory ReminderDto.fromDomainModel(Reminder reminder) {
    return ReminderDto(
      date: reminder.date,
    );
  }
  final DateTime? date;
  //from to domain model
  Reminder toDomainModel() {
    return Reminder(
      date: date!,
    );
  }
}
