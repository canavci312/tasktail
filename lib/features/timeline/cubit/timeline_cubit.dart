import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:task_app/data/repositories/task_repository.dart';
import 'package:task_app/domain/repositories/models/task.dart';
import 'package:task_app/utils/date_utils.dart';

part 'timeline_state.dart';
part 'timeline_cubit.freezed.dart';

class TimelineCubit extends Cubit<TimelineState> {
  TimelineCubit(this._taskRepository)
      : super(
          TimelineState(
            timeLineFormat: CalendarFormat.week,
            tasks: [],
            viewMode: ViewMode.timeline,
            searchedTasks: [],
            selectedDate: DateTime.now(),
            unplannedTasksCount: 0,
            overdueCount: 0,
          ),
        );
  final TaskRepository _taskRepository;
  StreamSubscription<List<Task>>? subs;
  @override
  Future<void> close() {
    subs?.cancel();
    return super.close();
  }

  void listenTasks() {
    subs = _taskRepository.listenTasks().listen((event) {
      emit(
        state.copyWith(
          tasks: event,
          unplannedTasksCount: event.unplannedTasks.length,
          overdueCount: event.overdueTasks.length,
        ),
      );
    });
  }
  
  void toggleDone(Task task) {
    _taskRepository.updateTask(task.copyWith(isCompleted: !task.isCompleted));
  }

  void toggleViewMode() {
    emit(
      state.copyWith(
        viewMode: state.viewMode == ViewMode.timeline
            ? ViewMode.day
            : ViewMode.timeline,
      ),
    );
  }

  void onDateSelected(DateTime date) {
    emit(
      state.copyWith(
        selectedDate: AppDateUtils.setAddTaskDate(date),
        timeLineFormat: CalendarFormat.week,
      ),
    );
  }

  void onFormatChanged(CalendarFormat format) {
    emit(state.copyWith(timeLineFormat: format));
  }

  void onSearch(String query) {
    emit(
      state.copyWith(
        searchedTasks: state.tasks
            .where((element) => element.title!.contains(query))
            .toList(),
      ),
    );
  }
}
