import 'package:dart_date/dart_date.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_app/domain/repositories/models/checklist_item.dart';
import 'package:task_app/domain/repositories/models/project.dart';
import 'package:task_app/domain/repositories/models/reminder.dart';
import 'package:task_app/domain/repositories/models/tag.dart';
import 'package:task_app/features/timeline/view/timeline_view.dart';

part 'task.freezed.dart';

@freezed
class Task with _$Task {
  const factory Task({
    int? id,
    String? title,
    String? description,
    @Default(false) bool isCompleted,
    @Default(false) bool isNote,
    DateTime? dueDate,
    @Default(Priority.noPriority) Priority priority,
    Project? project,
    @Default(false) bool fromCalendar,
    String? calendarId,
    List<Tag>? tags,
    List<CheckListItem>? checklist,
    DateTime? createdOn,
    DateTime? updatedOn,
    @Default(<Reminder>[]) List<Reminder> reminders,
  }) = _Task;
}

extension TaskExtension on Task {
  bool get isOverdue =>
      dueDate != null &&
      dueDate!.isBefore(DateTime.now().setHour(23).setMinute(59).setSecond(59));
  bool get isUnplanned => project == null && dueDate == null;
}

extension TaskListExtensions on List<Task> {
  List<Task> get todaysTasks =>
      where((element) => element.dueDate?.isToday ?? false).toList();
  List<Task> get overdueTasks => where((element) => element.isOverdue).toList();
  List<Task> get unplannedTasks =>
      where((element) => element.isUnplanned).toList();
}
