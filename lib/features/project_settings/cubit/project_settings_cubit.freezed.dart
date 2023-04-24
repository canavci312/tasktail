// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_settings_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProjectSettingsState {
  Project get project => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProjectSettingsStateCopyWith<ProjectSettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectSettingsStateCopyWith<$Res> {
  factory $ProjectSettingsStateCopyWith(ProjectSettingsState value,
          $Res Function(ProjectSettingsState) then) =
      _$ProjectSettingsStateCopyWithImpl<$Res, ProjectSettingsState>;
  @useResult
  $Res call({Project project});

  $ProjectCopyWith<$Res> get project;
}

/// @nodoc
class _$ProjectSettingsStateCopyWithImpl<$Res,
        $Val extends ProjectSettingsState>
    implements $ProjectSettingsStateCopyWith<$Res> {
  _$ProjectSettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? project = null,
  }) {
    return _then(_value.copyWith(
      project: null == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as Project,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProjectCopyWith<$Res> get project {
    return $ProjectCopyWith<$Res>(_value.project, (value) {
      return _then(_value.copyWith(project: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProjectSettingsStateCopyWith<$Res>
    implements $ProjectSettingsStateCopyWith<$Res> {
  factory _$$_ProjectSettingsStateCopyWith(_$_ProjectSettingsState value,
          $Res Function(_$_ProjectSettingsState) then) =
      __$$_ProjectSettingsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Project project});

  @override
  $ProjectCopyWith<$Res> get project;
}

/// @nodoc
class __$$_ProjectSettingsStateCopyWithImpl<$Res>
    extends _$ProjectSettingsStateCopyWithImpl<$Res, _$_ProjectSettingsState>
    implements _$$_ProjectSettingsStateCopyWith<$Res> {
  __$$_ProjectSettingsStateCopyWithImpl(_$_ProjectSettingsState _value,
      $Res Function(_$_ProjectSettingsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? project = null,
  }) {
    return _then(_$_ProjectSettingsState(
      project: null == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as Project,
    ));
  }
}

/// @nodoc

class _$_ProjectSettingsState implements _ProjectSettingsState {
  const _$_ProjectSettingsState({required this.project});

  @override
  final Project project;

  @override
  String toString() {
    return 'ProjectSettingsState(project: $project)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProjectSettingsState &&
            (identical(other.project, project) || other.project == project));
  }

  @override
  int get hashCode => Object.hash(runtimeType, project);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProjectSettingsStateCopyWith<_$_ProjectSettingsState> get copyWith =>
      __$$_ProjectSettingsStateCopyWithImpl<_$_ProjectSettingsState>(
          this, _$identity);
}

abstract class _ProjectSettingsState implements ProjectSettingsState {
  const factory _ProjectSettingsState({required final Project project}) =
      _$_ProjectSettingsState;

  @override
  Project get project;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectSettingsStateCopyWith<_$_ProjectSettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}
