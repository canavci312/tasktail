import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_app/data/repositories/project_repository.dart';
import 'package:task_app/domain/repositories/models/project.dart';
import 'package:task_app/domain/repositories/models/tag.dart';

part 'add_edit_project_state.dart';
part 'add_edit_project_cubit.freezed.dart';

class AddEditProjectCubit extends Cubit<AddEditProjectState> {
  AddEditProjectCubit(this.repository) : super(const AddEditProjectState());
  final ProjectRepository repository;
  void changeName(String value) {
    emit(state.copyWith(name: value));
  }

  void changeColor(TagColor? color) {
    emit(state.copyWith(color: color));
  }

  void saveProject() {
    repository.insertProject(
      Project(
        createdOn: DateTime.now(),
        title: state.name!,
        color: state.color ?? TagColor.noColor,
      ),
    );
  }
}
