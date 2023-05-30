part of 'overdue_tasks_cubit.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class OverdueTasksState  with _$OverdueTasksState {
  const factory OverdueTasksState({
    required List<Task> tasks,
    required List<Task> selectedTasks,
    required bool isSelectionMode,
  }) = _OverdueTasksState;
}
