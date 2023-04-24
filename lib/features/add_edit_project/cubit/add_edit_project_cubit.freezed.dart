// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_edit_project_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddEditProjectState {
  String? get name => throw _privateConstructorUsedError;
  TagColor? get color => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddEditProjectStateCopyWith<AddEditProjectState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddEditProjectStateCopyWith<$Res> {
  factory $AddEditProjectStateCopyWith(
          AddEditProjectState value, $Res Function(AddEditProjectState) then) =
      _$AddEditProjectStateCopyWithImpl<$Res, AddEditProjectState>;
  @useResult
  $Res call({String? name, TagColor? color});
}

/// @nodoc
class _$AddEditProjectStateCopyWithImpl<$Res, $Val extends AddEditProjectState>
    implements $AddEditProjectStateCopyWith<$Res> {
  _$AddEditProjectStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? color = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as TagColor?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddEditProjectStateCopyWith<$Res>
    implements $AddEditProjectStateCopyWith<$Res> {
  factory _$$_AddEditProjectStateCopyWith(_$_AddEditProjectState value,
          $Res Function(_$_AddEditProjectState) then) =
      __$$_AddEditProjectStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, TagColor? color});
}

/// @nodoc
class __$$_AddEditProjectStateCopyWithImpl<$Res>
    extends _$AddEditProjectStateCopyWithImpl<$Res, _$_AddEditProjectState>
    implements _$$_AddEditProjectStateCopyWith<$Res> {
  __$$_AddEditProjectStateCopyWithImpl(_$_AddEditProjectState _value,
      $Res Function(_$_AddEditProjectState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? color = freezed,
  }) {
    return _then(_$_AddEditProjectState(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as TagColor?,
    ));
  }
}

/// @nodoc

class _$_AddEditProjectState implements _AddEditProjectState {
  const _$_AddEditProjectState({this.name, this.color});

  @override
  final String? name;
  @override
  final TagColor? color;

  @override
  String toString() {
    return 'AddEditProjectState(name: $name, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddEditProjectState &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddEditProjectStateCopyWith<_$_AddEditProjectState> get copyWith =>
      __$$_AddEditProjectStateCopyWithImpl<_$_AddEditProjectState>(
          this, _$identity);
}

abstract class _AddEditProjectState implements AddEditProjectState {
  const factory _AddEditProjectState(
      {final String? name, final TagColor? color}) = _$_AddEditProjectState;

  @override
  String? get name;
  @override
  TagColor? get color;
  @override
  @JsonKey(ignore: true)
  _$$_AddEditProjectStateCopyWith<_$_AddEditProjectState> get copyWith =>
      throw _privateConstructorUsedError;
}
