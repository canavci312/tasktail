// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'select_project_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SelectProjectState {
  List<Project> get projects => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectProjectStateCopyWith<SelectProjectState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectProjectStateCopyWith<$Res> {
  factory $SelectProjectStateCopyWith(
          SelectProjectState value, $Res Function(SelectProjectState) then) =
      _$SelectProjectStateCopyWithImpl<$Res, SelectProjectState>;
  @useResult
  $Res call({List<Project> projects});
}

/// @nodoc
class _$SelectProjectStateCopyWithImpl<$Res, $Val extends SelectProjectState>
    implements $SelectProjectStateCopyWith<$Res> {
  _$SelectProjectStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projects = null,
  }) {
    return _then(_value.copyWith(
      projects: null == projects
          ? _value.projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<Project>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SelectProjectStateCopyWith<$Res>
    implements $SelectProjectStateCopyWith<$Res> {
  factory _$$_SelectProjectStateCopyWith(_$_SelectProjectState value,
          $Res Function(_$_SelectProjectState) then) =
      __$$_SelectProjectStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Project> projects});
}

/// @nodoc
class __$$_SelectProjectStateCopyWithImpl<$Res>
    extends _$SelectProjectStateCopyWithImpl<$Res, _$_SelectProjectState>
    implements _$$_SelectProjectStateCopyWith<$Res> {
  __$$_SelectProjectStateCopyWithImpl(
      _$_SelectProjectState _value, $Res Function(_$_SelectProjectState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projects = null,
  }) {
    return _then(_$_SelectProjectState(
      projects: null == projects
          ? _value._projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<Project>,
    ));
  }
}

/// @nodoc

class _$_SelectProjectState implements _SelectProjectState {
  const _$_SelectProjectState({required final List<Project> projects})
      : _projects = projects;

  final List<Project> _projects;
  @override
  List<Project> get projects {
    if (_projects is EqualUnmodifiableListView) return _projects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_projects);
  }

  @override
  String toString() {
    return 'SelectProjectState(projects: $projects)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SelectProjectState &&
            const DeepCollectionEquality().equals(other._projects, _projects));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_projects));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SelectProjectStateCopyWith<_$_SelectProjectState> get copyWith =>
      __$$_SelectProjectStateCopyWithImpl<_$_SelectProjectState>(
          this, _$identity);
}

abstract class _SelectProjectState implements SelectProjectState {
  const factory _SelectProjectState({required final List<Project> projects}) =
      _$_SelectProjectState;

  @override
  List<Project> get projects;
  @override
  @JsonKey(ignore: true)
  _$$_SelectProjectStateCopyWith<_$_SelectProjectState> get copyWith =>
      throw _privateConstructorUsedError;
}
