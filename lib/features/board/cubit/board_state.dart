part of 'board_cubit.dart';

@freezed
class BoardState  with _$BoardState {
  const factory BoardState({
    required List<Project> projects,
    required List<Task> tasks
    , Project? selectedProject,
  }) = _BoardState;
}
