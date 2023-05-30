import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_app/data/repositories/project_repository.dart';
import 'package:task_app/data/repositories/task_repository.dart';
import 'package:task_app/domain/repositories/models/project.dart';
import 'package:task_app/domain/repositories/models/task.dart';
import 'package:task_app/utils/extensions/list_extensions.dart';

part 'board_state.dart';
part 'board_cubit.freezed.dart';

class BoardCubit extends Cubit<BoardState> {
  BoardCubit(this.projectRepository, this.taskRepository)
      : super(const BoardState(projects: [], tasks: []));
  final ProjectRepository projectRepository;
  final TaskRepository taskRepository;
  void listenProjects() {
    projectRepository.listenAllProjects().listen((event) {
      emit(
        state.copyWith(
          projects: event,
        ),
      );
    });
  }

  StreamSubscription<List<Task>>? subscription;
  void listenTasksByProjectId(int projectId) {
    subscription = taskRepository.listenTasksByProjectId(projectId).listen((
      event,
    ) {
      emit(
        state.copyWith(
          tasks: event,
        ),
      );
    });
  }

  void changeSelectedProject(Project? item) {
    if (item != null) {
      subscription?.cancel();
      listenTasksByProjectId(item.id!);
    }
    emit(
      state.copyWith(
        selectedProject: item,
      ),
    );
  }

  void reorderProjects(int index, int index2) {
    final projects = [...state.projects]..reOrder(index, index2);
    emit(state.copyWith(projects: projects));
  }

  void toggleTask(Task task) {
    taskRepository.updateTask(task.copyWith(isCompleted: !task.isCompleted));
    final tasks =
        taskRepository.getTasksByProjectId(state.selectedProject!.id!);
    emit(state.copyWith(tasks: tasks));
  }
}
