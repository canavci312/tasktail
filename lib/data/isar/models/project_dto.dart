import 'package:isar/isar.dart';
import 'package:task_app/data/isar/models/task_dto.dart';
import 'package:task_app/domain/repositories/models/project.dart';
import 'package:task_app/domain/repositories/models/sort_by.dart';
import 'package:task_app/domain/repositories/models/tag.dart';
part 'project_dto.g.dart';

@collection
class ProjectDto {
  ProjectDto({
    this.id,
    required this.title,
    required this.createdOn,
    this.color = TagColor.noColor,
    this.updatedOn,
    this.archived = false,
    this.sortyBy = SortBy.createdDateAsc,
  });
  factory ProjectDto.fromDomainModel(Project project) {
    return ProjectDto(
      id: project.id,
      title: project.title,
      createdOn: project.createdOn ?? DateTime.now(),
      color: project.color,
      sortyBy: project.sortyBy,
      archived: project.archived,
      updatedOn: project.updatedOn,
    );
  }
  Id? id;
  final String title;
  final tasks = IsarLinks<TaskDto>();
  @enumerated
  final TagColor color;
  @enumerated
  final SortBy sortyBy;
  final bool archived;
  final DateTime createdOn;
  final DateTime? updatedOn;

  //from to domain model
  Project toDomainModel() {
    return Project(
      id: id,
      title: title,
      createdOn: createdOn,
      sortyBy: sortyBy,
      archived: archived,
      tasks: tasks.map((e) => e.toDomainModel()).toList(),
      color: color,
      updatedOn: updatedOn,
    );
  }
}
