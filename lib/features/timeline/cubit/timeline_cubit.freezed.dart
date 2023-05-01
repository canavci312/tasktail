// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timeline_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TimelineState {
  List<Task> get tasks => throw _privateConstructorUsedError;
  List<Task> get searchedTasks => throw _privateConstructorUsedError;
  DateTime get selectedDate => throw _privateConstructorUsedError;
  ViewMode get viewMode => throw _privateConstructorUsedError;
  CalendarFormat get timeLineFormat => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimelineStateCopyWith<TimelineState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimelineStateCopyWith<$Res> {
  factory $TimelineStateCopyWith(
          TimelineState value, $Res Function(TimelineState) then) =
      _$TimelineStateCopyWithImpl<$Res, TimelineState>;
  @useResult
  $Res call(
      {List<Task> tasks,
      List<Task> searchedTasks,
      DateTime selectedDate,
      ViewMode viewMode,
      CalendarFormat timeLineFormat});
}

/// @nodoc
class _$TimelineStateCopyWithImpl<$Res, $Val extends TimelineState>
    implements $TimelineStateCopyWith<$Res> {
  _$TimelineStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
    Object? searchedTasks = null,
    Object? selectedDate = null,
    Object? viewMode = null,
    Object? timeLineFormat = null,
  }) {
    return _then(_value.copyWith(
      tasks: null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      searchedTasks: null == searchedTasks
          ? _value.searchedTasks
          : searchedTasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      selectedDate: null == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      viewMode: null == viewMode
          ? _value.viewMode
          : viewMode // ignore: cast_nullable_to_non_nullable
              as ViewMode,
      timeLineFormat: null == timeLineFormat
          ? _value.timeLineFormat
          : timeLineFormat // ignore: cast_nullable_to_non_nullable
              as CalendarFormat,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TimelineStateCopyWith<$Res>
    implements $TimelineStateCopyWith<$Res> {
  factory _$$_TimelineStateCopyWith(
          _$_TimelineState value, $Res Function(_$_TimelineState) then) =
      __$$_TimelineStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Task> tasks,
      List<Task> searchedTasks,
      DateTime selectedDate,
      ViewMode viewMode,
      CalendarFormat timeLineFormat});
}

/// @nodoc
class __$$_TimelineStateCopyWithImpl<$Res>
    extends _$TimelineStateCopyWithImpl<$Res, _$_TimelineState>
    implements _$$_TimelineStateCopyWith<$Res> {
  __$$_TimelineStateCopyWithImpl(
      _$_TimelineState _value, $Res Function(_$_TimelineState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
    Object? searchedTasks = null,
    Object? selectedDate = null,
    Object? viewMode = null,
    Object? timeLineFormat = null,
  }) {
    return _then(_$_TimelineState(
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      searchedTasks: null == searchedTasks
          ? _value._searchedTasks
          : searchedTasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      selectedDate: null == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      viewMode: null == viewMode
          ? _value.viewMode
          : viewMode // ignore: cast_nullable_to_non_nullable
              as ViewMode,
      timeLineFormat: null == timeLineFormat
          ? _value.timeLineFormat
          : timeLineFormat // ignore: cast_nullable_to_non_nullable
              as CalendarFormat,
    ));
  }
}

/// @nodoc

class _$_TimelineState implements _TimelineState {
  const _$_TimelineState(
      {required final List<Task> tasks,
      required final List<Task> searchedTasks,
      required this.selectedDate,
      required this.viewMode,
      required this.timeLineFormat})
      : _tasks = tasks,
        _searchedTasks = searchedTasks;

  final List<Task> _tasks;
  @override
  List<Task> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  final List<Task> _searchedTasks;
  @override
  List<Task> get searchedTasks {
    if (_searchedTasks is EqualUnmodifiableListView) return _searchedTasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchedTasks);
  }

  @override
  final DateTime selectedDate;
  @override
  final ViewMode viewMode;
  @override
  final CalendarFormat timeLineFormat;

  @override
  String toString() {
    return 'TimelineState(tasks: $tasks, searchedTasks: $searchedTasks, selectedDate: $selectedDate, viewMode: $viewMode, timeLineFormat: $timeLineFormat)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimelineState &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            const DeepCollectionEquality()
                .equals(other._searchedTasks, _searchedTasks) &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate) &&
            (identical(other.viewMode, viewMode) ||
                other.viewMode == viewMode) &&
            (identical(other.timeLineFormat, timeLineFormat) ||
                other.timeLineFormat == timeLineFormat));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_tasks),
      const DeepCollectionEquality().hash(_searchedTasks),
      selectedDate,
      viewMode,
      timeLineFormat);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimelineStateCopyWith<_$_TimelineState> get copyWith =>
      __$$_TimelineStateCopyWithImpl<_$_TimelineState>(this, _$identity);
}

abstract class _TimelineState implements TimelineState {
  const factory _TimelineState(
      {required final List<Task> tasks,
      required final List<Task> searchedTasks,
      required final DateTime selectedDate,
      required final ViewMode viewMode,
      required final CalendarFormat timeLineFormat}) = _$_TimelineState;

  @override
  List<Task> get tasks;
  @override
  List<Task> get searchedTasks;
  @override
  DateTime get selectedDate;
  @override
  ViewMode get viewMode;
  @override
  CalendarFormat get timeLineFormat;
  @override
  @JsonKey(ignore: true)
  _$$_TimelineStateCopyWith<_$_TimelineState> get copyWith =>
      throw _privateConstructorUsedError;
}
