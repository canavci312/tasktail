// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'select_tag_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SelectTagState {
  List<Tag> get tags => throw _privateConstructorUsedError;
  List<Tag> get selectedTags => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectTagStateCopyWith<SelectTagState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectTagStateCopyWith<$Res> {
  factory $SelectTagStateCopyWith(
          SelectTagState value, $Res Function(SelectTagState) then) =
      _$SelectTagStateCopyWithImpl<$Res, SelectTagState>;
  @useResult
  $Res call({List<Tag> tags, List<Tag> selectedTags});
}

/// @nodoc
class _$SelectTagStateCopyWithImpl<$Res, $Val extends SelectTagState>
    implements $SelectTagStateCopyWith<$Res> {
  _$SelectTagStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tags = null,
    Object? selectedTags = null,
  }) {
    return _then(_value.copyWith(
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      selectedTags: null == selectedTags
          ? _value.selectedTags
          : selectedTags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SelectTagStateCopyWith<$Res>
    implements $SelectTagStateCopyWith<$Res> {
  factory _$$_SelectTagStateCopyWith(
          _$_SelectTagState value, $Res Function(_$_SelectTagState) then) =
      __$$_SelectTagStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Tag> tags, List<Tag> selectedTags});
}

/// @nodoc
class __$$_SelectTagStateCopyWithImpl<$Res>
    extends _$SelectTagStateCopyWithImpl<$Res, _$_SelectTagState>
    implements _$$_SelectTagStateCopyWith<$Res> {
  __$$_SelectTagStateCopyWithImpl(
      _$_SelectTagState _value, $Res Function(_$_SelectTagState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tags = null,
    Object? selectedTags = null,
  }) {
    return _then(_$_SelectTagState(
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      selectedTags: null == selectedTags
          ? _value._selectedTags
          : selectedTags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
    ));
  }
}

/// @nodoc

class _$_SelectTagState implements _SelectTagState {
  const _$_SelectTagState(
      {required final List<Tag> tags, required final List<Tag> selectedTags})
      : _tags = tags,
        _selectedTags = selectedTags;

  final List<Tag> _tags;
  @override
  List<Tag> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final List<Tag> _selectedTags;
  @override
  List<Tag> get selectedTags {
    if (_selectedTags is EqualUnmodifiableListView) return _selectedTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedTags);
  }

  @override
  String toString() {
    return 'SelectTagState(tags: $tags, selectedTags: $selectedTags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SelectTagState &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality()
                .equals(other._selectedTags, _selectedTags));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_selectedTags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SelectTagStateCopyWith<_$_SelectTagState> get copyWith =>
      __$$_SelectTagStateCopyWithImpl<_$_SelectTagState>(this, _$identity);
}

abstract class _SelectTagState implements SelectTagState {
  const factory _SelectTagState(
      {required final List<Tag> tags,
      required final List<Tag> selectedTags}) = _$_SelectTagState;

  @override
  List<Tag> get tags;
  @override
  List<Tag> get selectedTags;
  @override
  @JsonKey(ignore: true)
  _$$_SelectTagStateCopyWith<_$_SelectTagState> get copyWith =>
      throw _privateConstructorUsedError;
}
