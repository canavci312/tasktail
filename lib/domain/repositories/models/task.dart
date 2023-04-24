import 'package:task_app/domain/repositories/models/checklist_item.dart';
import 'package:task_app/domain/repositories/models/project.dart';
import 'package:task_app/domain/repositories/models/reminder.dart';
import 'package:task_app/domain/repositories/models/tag.dart';

import 'package:task_app/features/timeline/view/timeline_view.dart';

class Task {
  Task({
    this.title,
    this.description,
    this.dueDate,
    this.priority = Priority.noPriority,
    this.tags,
    required this.createdOn,
    this.updatedOn,
    this.isNote = false,
    this.isCompleted = false,
    this.project,
    this.reminders = const [],
    this.checklist,
  });
  final String? title;
  final String? description;
  final bool isCompleted;
  final bool isNote;
  final DateTime? dueDate;
  final Priority priority;
  final Project? project;
  final List<Tag>? tags;
  final List<CheckListItem>? checklist;
  final DateTime createdOn;
  final DateTime? updatedOn;
  final List<Reminder> reminders;
}
