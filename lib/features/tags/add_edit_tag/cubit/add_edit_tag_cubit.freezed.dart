// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_edit_tag_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddEditTagState {
  String? get name => throw _privateConstructorUsedError;
  TagColor? get color => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddEditTagStateCopyWith<AddEditTagState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddEditTagStateCopyWith<$Res> {
  factory $AddEditTagStateCopyWith(
          AddEditTagState value, $Res Function(AddEditTagState) then) =
      _$AddEditTagStateCopyWithImpl<$Res, AddEditTagState>;
  @useResult
  $Res call({String? name, TagColor? color});
}

/// @nodoc
class _$AddEditTagStateCopyWithImpl<$Res, $Val extends AddEditTagState>
    implements $AddEditTagStateCopyWith<$Res> {
  _$AddEditTagStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_AddEditTagStateCopyWith<$Res>
    implements $AddEditTagStateCopyWith<$Res> {
  factory _$$_AddEditTagStateCopyWith(
          _$_AddEditTagState value, $Res Function(_$_AddEditTagState) then) =
      __$$_AddEditTagStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, TagColor? color});
}

/// @nodoc
class __$$_AddEditTagStateCopyWithImpl<$Res>
    extends _$AddEditTagStateCopyWithImpl<$Res, _$_AddEditTagState>
    implements _$$_AddEditTagStateCopyWith<$Res> {
  __$$_AddEditTagStateCopyWithImpl(
      _$_AddEditTagState _value, $Res Function(_$_AddEditTagState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? color = freezed,
  }) {
    return _then(_$_AddEditTagState(
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

class _$_AddEditTagState implements _AddEditTagState {
  const _$_AddEditTagState({this.name, this.color});

  @override
  final String? name;
  @override
  final TagColor? color;

  @override
  String toString() {
    return 'AddEditTagState(name: $name, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddEditTagState &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddEditTagStateCopyWith<_$_AddEditTagState> get copyWith =>
      __$$_AddEditTagStateCopyWithImpl<_$_AddEditTagState>(this, _$identity);
}

abstract class _AddEditTagState implements AddEditTagState {
  const factory _AddEditTagState({final String? name, final TagColor? color}) =
      _$_AddEditTagState;

  @override
  String? get name;
  @override
  TagColor? get color;
  @override
  @JsonKey(ignore: true)
  _$$_AddEditTagStateCopyWith<_$_AddEditTagState> get copyWith =>
      throw _privateConstructorUsedError;
}
