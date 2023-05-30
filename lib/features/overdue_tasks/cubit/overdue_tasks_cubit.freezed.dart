// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'overdue_tasks_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OverdueTasksState {
  List<Task> get tasks => throw _privateConstructorUsedError;
  List<Task> get selectedTasks => throw _privateConstructorUsedError;
  bool get isSelectionMode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OverdueTasksStateCopyWith<OverdueTasksState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OverdueTasksStateCopyWith<$Res> {
  factory $OverdueTasksStateCopyWith(
          OverdueTasksState value, $Res Function(OverdueTasksState) then) =
      _$OverdueTasksStateCopyWithImpl<$Res, OverdueTasksState>;
  @useResult
  $Res call({List<Task> tasks, List<Task> selectedTasks, bool isSelectionMode});
}

/// @nodoc
class _$OverdueTasksStateCopyWithImpl<$Res, $Val extends OverdueTasksState>
    implements $OverdueTasksStateCopyWith<$Res> {
  _$OverdueTasksStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
    Object? selectedTasks = null,
    Object? isSelectionMode = null,
  }) {
    return _then(_value.copyWith(
      tasks: null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      selectedTasks: null == selectedTasks
          ? _value.selectedTasks
          : selectedTasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      isSelectionMode: null == isSelectionMode
          ? _value.isSelectionMode
          : isSelectionMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OverdueTasksStateCopyWith<$Res>
    implements $OverdueTasksStateCopyWith<$Res> {
  factory _$$_OverdueTasksStateCopyWith(_$_OverdueTasksState value,
          $Res Function(_$_OverdueTasksState) then) =
      __$$_OverdueTasksStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Task> tasks, List<Task> selectedTasks, bool isSelectionMode});
}

/// @nodoc
class __$$_OverdueTasksStateCopyWithImpl<$Res>
    extends _$OverdueTasksStateCopyWithImpl<$Res, _$_OverdueTasksState>
    implements _$$_OverdueTasksStateCopyWith<$Res> {
  __$$_OverdueTasksStateCopyWithImpl(
      _$_OverdueTasksState _value, $Res Function(_$_OverdueTasksState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
    Object? selectedTasks = null,
    Object? isSelectionMode = null,
  }) {
    return _then(_$_OverdueTasksState(
      tasks: null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      selectedTasks: null == selectedTasks
          ? _value.selectedTasks
          : selectedTasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      isSelectionMode: null == isSelectionMode
          ? _value.isSelectionMode
          : isSelectionMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_OverdueTasksState implements _OverdueTasksState {
  const _$_OverdueTasksState(
      {required this.tasks,
      required this.selectedTasks,
      required this.isSelectionMode});

  @override
  final List<Task> tasks;
  @override
  final List<Task> selectedTasks;
  @override
  final bool isSelectionMode;

  @override
  String toString() {
    return 'OverdueTasksState(tasks: $tasks, selectedTasks: $selectedTasks, isSelectionMode: $isSelectionMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OverdueTasksState &&
            const DeepCollectionEquality().equals(other.tasks, tasks) &&
            const DeepCollectionEquality()
                .equals(other.selectedTasks, selectedTasks) &&
            (identical(other.isSelectionMode, isSelectionMode) ||
                other.isSelectionMode == isSelectionMode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(tasks),
      const DeepCollectionEquality().hash(selectedTasks),
      isSelectionMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OverdueTasksStateCopyWith<_$_OverdueTasksState> get copyWith =>
      __$$_OverdueTasksStateCopyWithImpl<_$_OverdueTasksState>(
          this, _$identity);
}

abstract class _OverdueTasksState implements OverdueTasksState {
  const factory _OverdueTasksState(
      {required final List<Task> tasks,
      required final List<Task> selectedTasks,
      required final bool isSelectionMode}) = _$_OverdueTasksState;

  @override
  List<Task> get tasks;
  @override
  List<Task> get selectedTasks;
  @override
  bool get isSelectionMode;
  @override
  @JsonKey(ignore: true)
  _$$_OverdueTasksStateCopyWith<_$_OverdueTasksState> get copyWith =>
      throw _privateConstructorUsedError;
}
