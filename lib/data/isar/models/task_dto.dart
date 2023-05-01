import 'package:isar/isar.dart';
import 'package:task_app/data/isar/models/checklist_item_dto.dart';
import 'package:task_app/data/isar/models/project_dto.dart';
import 'package:task_app/data/isar/models/reminder_dto.dart';
import 'package:task_app/data/isar/models/tag_dto.dart';
import 'package:task_app/domain/repositories/models/task.dart';
import 'package:task_app/features/timeline/view/timeline_view.dart';
part 'task_dto.g.dart';

@collection
class TaskDto {
  TaskDto({
    required this.title,
    this.id,
    this.description,
    this.dueDate,
    this.priority = Priority.noPriority,
    this.createdOn,
    this.updatedOn,
    this.isNote = false,
    this.isCompleted = false,
    this.reminders = const [],
    this.checklist,
  });
  factory TaskDto.fromDomainModel(Task task) {
    final taskDto = TaskDto(
      id: task.id,
      title: task.title!,
      description: task.description,
      dueDate: task.dueDate,
      priority: task.priority,
      createdOn: task.createdOn,
      updatedOn: task.updatedOn,
      isNote: task.isNote,
      isCompleted: task.isCompleted,
      reminders:
          task.reminders.map((e) => ReminderDto.fromDomainModel(e)).toList(),
      checklist: task.checklist
          ?.map((e) => CheckListItemDto.fromDomainModel(e))
          .toList(),
    )..project.value =
        task.project != null ? ProjectDto.fromDomainModel(task.project!) : null;
    if (task.tags != null) {
      taskDto.tags.addAll(task.tags!.map((e) => TagDto.fromDomainModel(e)));
    }
    return taskDto;
  }
  Id? id;
  final String title;
  final String? description;
  final bool isCompleted;
  final bool isNote;
  final DateTime? dueDate;
  @enumerated
  final Priority priority;
  @Backlink(to: 'tasks')
  final project = IsarLink<ProjectDto>();
  final tags = IsarLinks<TagDto>();
  final List<CheckListItemDto>? checklist;
  final DateTime? createdOn;
  final DateTime? updatedOn;
  final List<ReminderDto> reminders;

  //from to domain model
  Task toDomainModel() {
    return Task(
      id: id,
      title: title,
      description: description,
      dueDate: dueDate,
      priority: priority,
      createdOn: createdOn,
      updatedOn: updatedOn,
      isNote: isNote,
      isCompleted: isCompleted,
      project: project.value?.toDomainModel(),
      tags: tags.map((e) => e.toDomainModel()).toList(),
      reminders: reminders.map((e) => e.toDomainModel()).toList(),
      checklist: checklist?.map((e) => e.toDomainModel()).toList(),
    );
  }
}
