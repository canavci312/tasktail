// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unplanned_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UnplannedState {
  List<Task> get tasks => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UnplannedStateCopyWith<UnplannedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnplannedStateCopyWith<$Res> {
  factory $UnplannedStateCopyWith(
          UnplannedState value, $Res Function(UnplannedState) then) =
      _$UnplannedStateCopyWithImpl<$Res, UnplannedState>;
  @useResult
  $Res call({List<Task> tasks});
}

/// @nodoc
class _$UnplannedStateCopyWithImpl<$Res, $Val extends UnplannedState>
    implements $UnplannedStateCopyWith<$Res> {
  _$UnplannedStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
  }) {
    return _then(_value.copyWith(
      tasks: null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UnplannedStateCopyWith<$Res>
    implements $UnplannedStateCopyWith<$Res> {
  factory _$$_UnplannedStateCopyWith(
          _$_UnplannedState value, $Res Function(_$_UnplannedState) then) =
      __$$_UnplannedStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Task> tasks});
}

/// @nodoc
class __$$_UnplannedStateCopyWithImpl<$Res>
    extends _$UnplannedStateCopyWithImpl<$Res, _$_UnplannedState>
    implements _$$_UnplannedStateCopyWith<$Res> {
  __$$_UnplannedStateCopyWithImpl(
      _$_UnplannedState _value, $Res Function(_$_UnplannedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
  }) {
    return _then(_$_UnplannedState(
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
    ));
  }
}

/// @nodoc

class _$_UnplannedState implements _UnplannedState {
  const _$_UnplannedState({required final List<Task> tasks}) : _tasks = tasks;

  final List<Task> _tasks;
  @override
  List<Task> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  String toString() {
    return 'UnplannedState(tasks: $tasks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UnplannedState &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tasks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UnplannedStateCopyWith<_$_UnplannedState> get copyWith =>
      __$$_UnplannedStateCopyWithImpl<_$_UnplannedState>(this, _$identity);
}

abstract class _UnplannedState implements UnplannedState {
  const factory _UnplannedState({required final List<Task> tasks}) =
      _$_UnplannedState;

  @override
  List<Task> get tasks;
  @override
  @JsonKey(ignore: true)
  _$$_UnplannedStateCopyWith<_$_UnplannedState> get copyWith =>
      throw _privateConstructorUsedError;
}
