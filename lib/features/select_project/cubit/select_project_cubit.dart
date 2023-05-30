import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_app/data/repositories/project_repository.dart';
import 'package:task_app/domain/repositories/models/project.dart';

part 'select_project_state.dart';
part 'select_project_cubit.freezed.dart';

class SelectProjectCubit extends Cubit<SelectProjectState> {
  SelectProjectCubit(this.projectRepository)
      : super(const SelectProjectState(projects: []));
  final ProjectRepository projectRepository;
  StreamSubscription<List<Project>>? subs;
  void listenProjects() {
    subs = projectRepository.listenActiveProjects().listen((event) {
      emit(
        state.copyWith(
          projects: event,
        ),
      );
    });
  }

  @override
  Future<void> close() {
    subs?.cancel();
    return super.close();
  }
}
