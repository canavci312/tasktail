part of 'workspace_cubit.dart';

@freezed
class WorkspaceState  with _$WorkspaceState {
  const factory WorkspaceState(
    {
      required bool isCalendarImportOpen,
    }
  ) = _WorkspaceState;
}
