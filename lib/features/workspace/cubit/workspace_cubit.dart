import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_app/data/repositories/settings_repository.dart';
import 'package:task_app/data/repositories/task_repository.dart';

part 'workspace_state.dart';
part 'workspace_cubit.freezed.dart';

class WorkspaceCubit extends Cubit<WorkspaceState> {
  WorkspaceCubit(this._taskRepository, this._settingsRepository)
      : super(const WorkspaceState(isCalendarImportOpen: false));
  final TaskRepository _taskRepository;

  final SettingsRepository _settingsRepository;
  void loadSettings() {
    emit(
      state.copyWith(
        isCalendarImportOpen: _settingsRepository.isCalendarImportOpen.value,
      ),
    );
  }

  // ignore: avoid_positional_boolean_parameters
  void toggleCalendarImport(bool value, bool? keepTasks) {
    if (value) {
      _taskRepository.importTasksFromCalendar();
    } else {
      if (keepTasks == false) {
        _taskRepository.deleteCalendarTasks();
      }
    }
    _settingsRepository.setCalenderImport(value: value);
    emit(state.copyWith(isCalendarImportOpen: value));
  }

}
