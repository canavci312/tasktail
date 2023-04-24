part of 'add_edit_task_cubit.dart';

@freezed
class AddEditTaskState with _$AddEditTaskState {
  const factory AddEditTaskState({
    required List<CheckListItem> checkListItems,
    required String? title,
    required String? description,
    required Project? project,
    required DateTime? dueDate,
    required Priority? priority,
    required List<Tag>? tags,
  }) = _AddEditTaskState;
}
