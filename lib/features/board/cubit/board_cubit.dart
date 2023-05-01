import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_app/data/repositories/project_repository.dart';
import 'package:task_app/domain/repositories/models/project.dart';
import 'package:task_app/domain/repositories/models/task.dart';
import 'package:task_app/utils/extensions/list_extensions.dart';

part 'board_state.dart';
part 'board_cubit.freezed.dart';

class BoardCubit extends Cubit<BoardState> {
  BoardCubit(this.projectRepository) : super(const BoardState(projects: []));
  final ProjectRepository projectRepository;
  void listenProjects() {
    projectRepository.listenAllProjects().listen((event) {
      emit(
        state.copyWith(
          projects: event,
        ),
      );
    });
  }

  void changeSelectedProject(Project? item) {
    emit(state.copyWith(selectedProject: item));
  }

  void reorderProjects(int index, int index2) {
    final projects = [...state.projects]..reOrder(index, index2);
    emit(state.copyWith(projects: projects));
  }

  void toggleTask(Task task) {}
}
