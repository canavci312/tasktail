import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_app/data/repositories/project_repository.dart';
import 'package:task_app/domain/repositories/models/project.dart';
import 'package:task_app/domain/repositories/models/sort_by.dart';
import 'package:task_app/domain/repositories/models/tag.dart';

part 'project_settings_state.dart';
part 'project_settings_cubit.freezed.dart';

class ProjectSettingsCubit extends Cubit<ProjectSettingsState> {
  ProjectSettingsCubit(this.repository, this.project)
      : super(ProjectSettingsState(project: project));
  final Project project;
  final ProjectRepository repository;

  void deleteProject({required bool deleteTasks}) {
    repository.deleteProject(project.id!, deleteTasks: deleteTasks);
  }

  void changeSortby(SortBy sortBy) {
    repository.updateProject(project.copyWith(sortyBy: sortBy));
    emit(state.copyWith(project: project.copyWith(sortyBy: sortBy)));
  }

  void changeColor(TagColor result) {
    emit(state.copyWith(project: project.copyWith(color: result)));
    repository.updateProject(project.copyWith(color: result));
  }

  void changeName(String value) {
    if (value.isNotEmpty) {
      repository.updateProject(project.copyWith(title: value));
    }
  }

  void archiveProject() {
    repository.updateProject(project.copyWith(archived: true));
    emit(state.copyWith(project: project.copyWith(archived: true)));
  }

  void unArchive() {
    repository.updateProject(project.copyWith(archived: false));
    emit(state.copyWith(project: project.copyWith(archived: false)));
  }

  void duplicateProject(Project project) {
    repository.insertProject(project);
  }
}
