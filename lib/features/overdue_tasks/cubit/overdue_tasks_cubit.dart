import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_app/data/repositories/task_repository.dart';
import 'package:task_app/domain/repositories/models/project.dart';
import 'package:task_app/domain/repositories/models/task.dart';

part 'overdue_tasks_state.dart';
part 'overdue_tasks_cubit.freezed.dart';

class OverdueTasksCubit extends Cubit<OverdueTasksState> {
  OverdueTasksCubit(this._taskRepository)
      : super(
          const OverdueTasksState(
            tasks: [],
            isSelectionMode: false,
            selectedTasks: [],
          ),
        );
  final TaskRepository _taskRepository;
  late StreamSubscription<List<Task>>? _tasksSubscription;
  void listenTasks() {
    _tasksSubscription = _taskRepository.listenOverdueTasks().listen((event) {
      emit(
        state.copyWith(
          tasks: event,
        ),
      );
    });
  }

  void toggleSelectionMode() {
    emit(
      state
          .copyWith(isSelectionMode: !state.isSelectionMode, selectedTasks: []),
    );
  }

  void selectedTask(Task task) {
    if (state.selectedTasks.contains(task)) {
      final newTasks =
          state.selectedTasks.where((element) => element != task).toList();
      emit(
        state.copyWith(
          selectedTasks: newTasks,
        ),
      );
    } else {
      final tasks = [
        ...state.selectedTasks + [task]
      ];

      emit(
        state.copyWith(
          selectedTasks: tasks,
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _tasksSubscription?.cancel();
    return super.close();
  }

  void deleteTask(Task task) {
    _taskRepository.deleteTask(task.id!);
  }

  void reschedule(Task task, DateTime date) {
    _taskRepository.updateTask(task.copyWith(dueDate: date));
  }

  void toggleTask(Task task) {
    _taskRepository.updateTask(task.copyWith(isCompleted: !task.isCompleted));
  }

  void selectAllTasks() {
    emit(
      state.copyWith(
        selectedTasks: state.tasks,
      ),
    );
  }

  void moveSelectedTasks(Project project) {
    for (final task in state.selectedTasks) {
      _taskRepository.updateTask(task.copyWith(project: project));
    }
    toggleSelectionMode();
  }

  void deleteSelectedTasks() {
    for (final task in state.selectedTasks) {
      _taskRepository.deleteTask(task.id!);
    }
    toggleSelectionMode();
  }

  void rescheduleSelectedTasks(DateTime dateTime) {
    for (final task in state.selectedTasks) {
      _taskRepository.updateTask(task.copyWith(dueDate: dateTime));
    }
    toggleSelectionMode();
  }
}
