part of 'board_cubit.dart';

@freezed
class BoardState  with _$BoardState {
  const factory BoardState({
    required List<Project> projects
    , Project? selectedProject,
  }) = _BoardState;
}
