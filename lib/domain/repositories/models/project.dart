import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_app/domain/repositories/models/sort_by.dart';
import 'package:task_app/domain/repositories/models/tag.dart';
import 'package:task_app/domain/repositories/models/task.dart';

part 'project.freezed.dart';

@freezed
class Project with _$Project {
  const factory Project({
    int? id,
    required String title,
    List<Task>? tasks,
    @Default(SortBy.createdDateAsc) SortBy sortyBy,
    @Default(TagColor.noColor) TagColor color,
    @Default(false) bool archived,
    DateTime? createdOn,
    DateTime? updatedOn,
  }) = _Project;
}
