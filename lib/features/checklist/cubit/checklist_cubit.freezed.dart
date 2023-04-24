// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checklist_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChecklistState {
  List<CheckListItem> get items => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChecklistStateCopyWith<ChecklistState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChecklistStateCopyWith<$Res> {
  factory $ChecklistStateCopyWith(
          ChecklistState value, $Res Function(ChecklistState) then) =
      _$ChecklistStateCopyWithImpl<$Res, ChecklistState>;
  @useResult
  $Res call({List<CheckListItem> items});
}

/// @nodoc
class _$ChecklistStateCopyWithImpl<$Res, $Val extends ChecklistState>
    implements $ChecklistStateCopyWith<$Res> {
  _$ChecklistStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CheckListItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChecklistStateCopyWith<$Res>
    implements $ChecklistStateCopyWith<$Res> {
  factory _$$_ChecklistStateCopyWith(
          _$_ChecklistState value, $Res Function(_$_ChecklistState) then) =
      __$$_ChecklistStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CheckListItem> items});
}

/// @nodoc
class __$$_ChecklistStateCopyWithImpl<$Res>
    extends _$ChecklistStateCopyWithImpl<$Res, _$_ChecklistState>
    implements _$$_ChecklistStateCopyWith<$Res> {
  __$$_ChecklistStateCopyWithImpl(
      _$_ChecklistState _value, $Res Function(_$_ChecklistState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$_ChecklistState(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CheckListItem>,
    ));
  }
}

/// @nodoc

class _$_ChecklistState implements _ChecklistState {
  const _$_ChecklistState({required this.items});

  @override
  final List<CheckListItem> items;

  @override
  String toString() {
    return 'ChecklistState(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChecklistState &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChecklistStateCopyWith<_$_ChecklistState> get copyWith =>
      __$$_ChecklistStateCopyWithImpl<_$_ChecklistState>(this, _$identity);
}

abstract class _ChecklistState implements ChecklistState {
  const factory _ChecklistState({required final List<CheckListItem> items}) =
      _$_ChecklistState;

  @override
  List<CheckListItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$_ChecklistStateCopyWith<_$_ChecklistState> get copyWith =>
      throw _privateConstructorUsedError;
}
