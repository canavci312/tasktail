part of 'project_settings_cubit.dart';

@freezed
class ProjectSettingsState  with _$ProjectSettingsState {
  const factory ProjectSettingsState(
   {required Project project,}
  ) = _ProjectSettingsState;
}
