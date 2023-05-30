import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_app/data/repositories/task_repository.dart';
import 'package:task_app/domain/repositories/models/project.dart';
import 'package:task_app/domain/repositories/models/task.dart';

part 'unplanned_state.dart';
part 'unplanned_cubit.freezed.dart';

class UnplannedCubit extends Cubit<UnplannedState> {
  UnplannedCubit(this.repository) : super(const UnplannedState(tasks: []));
  final TaskRepository repository;
  void listenUnplannedTasks() {
    repository.listenUnplannedTasks().listen((event) {
      emit(state.copyWith(tasks: event));
    });
  }

  void assignToProject(Task task, Project project) {
    repository.updateTask(task.copyWith(project: project));
  }

  void reschedule(Task task, DateTime date) {
    repository.updateTask(task.copyWith(dueDate: date));
  }
}
