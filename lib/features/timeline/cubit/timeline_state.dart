part of 'timeline_cubit.dart';

enum ViewMode { timeline, day }

@freezed
class TimelineState with _$TimelineState {
  const factory TimelineState({
    required List<Task> tasks,
    required List<Task> searchedTasks,
    required DateTime selectedDate,
    required ViewMode viewMode,
    required CalendarFormat timeLineFormat,
    required int unplannedTasksCount,
    required int overdueCount,
  }) = _TimelineState;
}
