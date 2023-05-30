// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workspace_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WorkspaceState {
  bool get isCalendarImportOpen => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WorkspaceStateCopyWith<WorkspaceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkspaceStateCopyWith<$Res> {
  factory $WorkspaceStateCopyWith(
          WorkspaceState value, $Res Function(WorkspaceState) then) =
      _$WorkspaceStateCopyWithImpl<$Res, WorkspaceState>;
  @useResult
  $Res call({bool isCalendarImportOpen});
}

/// @nodoc
class _$WorkspaceStateCopyWithImpl<$Res, $Val extends WorkspaceState>
    implements $WorkspaceStateCopyWith<$Res> {
  _$WorkspaceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isCalendarImportOpen = null,
  }) {
    return _then(_value.copyWith(
      isCalendarImportOpen: null == isCalendarImportOpen
          ? _value.isCalendarImportOpen
          : isCalendarImportOpen // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WorkspaceStateCopyWith<$Res>
    implements $WorkspaceStateCopyWith<$Res> {
  factory _$$_WorkspaceStateCopyWith(
          _$_WorkspaceState value, $Res Function(_$_WorkspaceState) then) =
      __$$_WorkspaceStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isCalendarImportOpen});
}

/// @nodoc
class __$$_WorkspaceStateCopyWithImpl<$Res>
    extends _$WorkspaceStateCopyWithImpl<$Res, _$_WorkspaceState>
    implements _$$_WorkspaceStateCopyWith<$Res> {
  __$$_WorkspaceStateCopyWithImpl(
      _$_WorkspaceState _value, $Res Function(_$_WorkspaceState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isCalendarImportOpen = null,
  }) {
    return _then(_$_WorkspaceState(
      isCalendarImportOpen: null == isCalendarImportOpen
          ? _value.isCalendarImportOpen
          : isCalendarImportOpen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_WorkspaceState implements _WorkspaceState {
  const _$_WorkspaceState({required this.isCalendarImportOpen});

  @override
  final bool isCalendarImportOpen;

  @override
  String toString() {
    return 'WorkspaceState(isCalendarImportOpen: $isCalendarImportOpen)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WorkspaceState &&
            (identical(other.isCalendarImportOpen, isCalendarImportOpen) ||
                other.isCalendarImportOpen == isCalendarImportOpen));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isCalendarImportOpen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WorkspaceStateCopyWith<_$_WorkspaceState> get copyWith =>
      __$$_WorkspaceStateCopyWithImpl<_$_WorkspaceState>(this, _$identity);
}

abstract class _WorkspaceState implements WorkspaceState {
  const factory _WorkspaceState({required final bool isCalendarImportOpen}) =
      _$_WorkspaceState;

  @override
  bool get isCalendarImportOpen;
  @override
  @JsonKey(ignore: true)
  _$$_WorkspaceStateCopyWith<_$_WorkspaceState> get copyWith =>
      throw _privateConstructorUsedError;
}
