// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NoteListState {
  List<Task> get notes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NoteListStateCopyWith<NoteListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteListStateCopyWith<$Res> {
  factory $NoteListStateCopyWith(
          NoteListState value, $Res Function(NoteListState) then) =
      _$NoteListStateCopyWithImpl<$Res, NoteListState>;
  @useResult
  $Res call({List<Task> notes});
}

/// @nodoc
class _$NoteListStateCopyWithImpl<$Res, $Val extends NoteListState>
    implements $NoteListStateCopyWith<$Res> {
  _$NoteListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notes = null,
  }) {
    return _then(_value.copyWith(
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Task>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NoteListStateCopyWith<$Res>
    implements $NoteListStateCopyWith<$Res> {
  factory _$$_NoteListStateCopyWith(
          _$_NoteListState value, $Res Function(_$_NoteListState) then) =
      __$$_NoteListStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Task> notes});
}

/// @nodoc
class __$$_NoteListStateCopyWithImpl<$Res>
    extends _$NoteListStateCopyWithImpl<$Res, _$_NoteListState>
    implements _$$_NoteListStateCopyWith<$Res> {
  __$$_NoteListStateCopyWithImpl(
      _$_NoteListState _value, $Res Function(_$_NoteListState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notes = null,
  }) {
    return _then(_$_NoteListState(
      notes: null == notes
          ? _value._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Task>,
    ));
  }
}

/// @nodoc

class _$_NoteListState implements _NoteListState {
  const _$_NoteListState({required final List<Task> notes}) : _notes = notes;

  final List<Task> _notes;
  @override
  List<Task> get notes {
    if (_notes is EqualUnmodifiableListView) return _notes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notes);
  }

  @override
  String toString() {
    return 'NoteListState(notes: $notes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NoteListState &&
            const DeepCollectionEquality().equals(other._notes, _notes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_notes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NoteListStateCopyWith<_$_NoteListState> get copyWith =>
      __$$_NoteListStateCopyWithImpl<_$_NoteListState>(this, _$identity);
}

abstract class _NoteListState implements NoteListState {
  const factory _NoteListState({required final List<Task> notes}) =
      _$_NoteListState;

  @override
  List<Task> get notes;
  @override
  @JsonKey(ignore: true)
  _$$_NoteListStateCopyWith<_$_NoteListState> get copyWith =>
      throw _privateConstructorUsedError;
}
