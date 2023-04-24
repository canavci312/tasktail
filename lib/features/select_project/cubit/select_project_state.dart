part of 'select_project_cubit.dart';

@freezed
class SelectProjectState with _$SelectProjectState {
  const factory SelectProjectState({
    required List<Project> projects,
  }) = _SelectProjectState;
}
