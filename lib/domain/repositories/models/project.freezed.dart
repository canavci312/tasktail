// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Project {
  String get title => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  SortBy get sortyBy => throw _privateConstructorUsedError;
  TagColor get color => throw _privateConstructorUsedError;
  bool get archived => throw _privateConstructorUsedError;
  DateTime? get createdOn => throw _privateConstructorUsedError;
  DateTime? get updatedOn => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProjectCopyWith<Project> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectCopyWith<$Res> {
  factory $ProjectCopyWith(Project value, $Res Function(Project) then) =
      _$ProjectCopyWithImpl<$Res, Project>;
  @useResult
  $Res call(
      {String title,
      int? id,
      SortBy sortyBy,
      TagColor color,
      bool archived,
      DateTime? createdOn,
      DateTime? updatedOn});
}

/// @nodoc
class _$ProjectCopyWithImpl<$Res, $Val extends Project>
    implements $ProjectCopyWith<$Res> {
  _$ProjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? id = freezed,
    Object? sortyBy = null,
    Object? color = null,
    Object? archived = null,
    Object? createdOn = freezed,
    Object? updatedOn = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      sortyBy: null == sortyBy
          ? _value.sortyBy
          : sortyBy // ignore: cast_nullable_to_non_nullable
              as SortBy,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as TagColor,
      archived: null == archived
          ? _value.archived
          : archived // ignore: cast_nullable_to_non_nullable
              as bool,
      createdOn: freezed == createdOn
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedOn: freezed == updatedOn
          ? _value.updatedOn
          : updatedOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProjectCopyWith<$Res> implements $ProjectCopyWith<$Res> {
  factory _$$_ProjectCopyWith(
          _$_Project value, $Res Function(_$_Project) then) =
      __$$_ProjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      int? id,
      SortBy sortyBy,
      TagColor color,
      bool archived,
      DateTime? createdOn,
      DateTime? updatedOn});
}

/// @nodoc
class __$$_ProjectCopyWithImpl<$Res>
    extends _$ProjectCopyWithImpl<$Res, _$_Project>
    implements _$$_ProjectCopyWith<$Res> {
  __$$_ProjectCopyWithImpl(_$_Project _value, $Res Function(_$_Project) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? id = freezed,
    Object? sortyBy = null,
    Object? color = null,
    Object? archived = null,
    Object? createdOn = freezed,
    Object? updatedOn = freezed,
  }) {
    return _then(_$_Project(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      sortyBy: null == sortyBy
          ? _value.sortyBy
          : sortyBy // ignore: cast_nullable_to_non_nullable
              as SortBy,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as TagColor,
      archived: null == archived
          ? _value.archived
          : archived // ignore: cast_nullable_to_non_nullable
              as bool,
      createdOn: freezed == createdOn
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedOn: freezed == updatedOn
          ? _value.updatedOn
          : updatedOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$_Project implements _Project {
  const _$_Project(
      {required this.title,
      this.id,
      this.sortyBy = SortBy.createdDateAsc,
      this.color = TagColor.noColor,
      this.archived = false,
      this.createdOn,
      this.updatedOn});

  @override
  final String title;
  @override
  final int? id;
  @override
  @JsonKey()
  final SortBy sortyBy;
  @override
  @JsonKey()
  final TagColor color;
  @override
  @JsonKey()
  final bool archived;
  @override
  final DateTime? createdOn;
  @override
  final DateTime? updatedOn;

  @override
  String toString() {
    return 'Project(title: $title, id: $id, sortyBy: $sortyBy, color: $color, archived: $archived, createdOn: $createdOn, updatedOn: $updatedOn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Project &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sortyBy, sortyBy) || other.sortyBy == sortyBy) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.archived, archived) ||
                other.archived == archived) &&
            (identical(other.createdOn, createdOn) ||
                other.createdOn == createdOn) &&
            (identical(other.updatedOn, updatedOn) ||
                other.updatedOn == updatedOn));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, title, id, sortyBy, color, archived, createdOn, updatedOn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProjectCopyWith<_$_Project> get copyWith =>
      __$$_ProjectCopyWithImpl<_$_Project>(this, _$identity);
}

abstract class _Project implements Project {
  const factory _Project(
      {required final String title,
      final int? id,
      final SortBy sortyBy,
      final TagColor color,
      final bool archived,
      final DateTime? createdOn,
      final DateTime? updatedOn}) = _$_Project;

  @override
  String get title;
  @override
  int? get id;
  @override
  SortBy get sortyBy;
  @override
  TagColor get color;
  @override
  bool get archived;
  @override
  DateTime? get createdOn;
  @override
  DateTime? get updatedOn;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectCopyWith<_$_Project> get copyWith =>
      throw _privateConstructorUsedError;
}
