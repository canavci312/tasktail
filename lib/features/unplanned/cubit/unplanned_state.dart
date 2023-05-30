part of 'unplanned_cubit.dart';

@freezed
class UnplannedState  with _$UnplannedState {
  const factory UnplannedState({
    required List<Task> tasks,
  }) = _UnplannedState;
}
