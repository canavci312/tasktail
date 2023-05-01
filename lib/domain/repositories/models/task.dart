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
    List<Tag>? tags,
    List<CheckListItem>? checklist,
    DateTime? createdOn,
    DateTime? updatedOn,
    @Default(<Reminder>[]) List<Reminder> reminders,
  }) = _Task;
}
