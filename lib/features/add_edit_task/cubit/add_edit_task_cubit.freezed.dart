// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_edit_task_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddEditTaskState {
  List<CheckListItem> get checkListItems => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  Project? get project => throw _privateConstructorUsedError;
  DateTime? get dueDate => throw _privateConstructorUsedError;
  Priority? get priority => throw _privateConstructorUsedError;
  List<Tag>? get tags => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddEditTaskStateCopyWith<AddEditTaskState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddEditTaskStateCopyWith<$Res> {
  factory $AddEditTaskStateCopyWith(
          AddEditTaskState value, $Res Function(AddEditTaskState) then) =
      _$AddEditTaskStateCopyWithImpl<$Res, AddEditTaskState>;
  @useResult
  $Res call(
      {List<CheckListItem> checkListItems,
      String? title,
      String? description,
      Project? project,
      DateTime? dueDate,
      Priority? priority,
      List<Tag>? tags});

  $ProjectCopyWith<$Res>? get project;
}

/// @nodoc
class _$AddEditTaskStateCopyWithImpl<$Res, $Val extends AddEditTaskState>
    implements $AddEditTaskStateCopyWith<$Res> {
  _$AddEditTaskStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checkListItems = null,
    Object? title = freezed,
    Object? description = freezed,
    Object? project = freezed,
    Object? dueDate = freezed,
    Object? priority = freezed,
    Object? tags = freezed,
  }) {
    return _then(_value.copyWith(
      checkListItems: null == checkListItems
          ? _value.checkListItems
          : checkListItems // ignore: cast_nullable_to_non_nullable
              as List<CheckListItem>,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      project: freezed == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as Project?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as Priority?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProjectCopyWith<$Res>? get project {
    if (_value.project == null) {
      return null;
    }

    return $ProjectCopyWith<$Res>(_value.project!, (value) {
      return _then(_value.copyWith(project: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AddEditTaskStateCopyWith<$Res>
    implements $AddEditTaskStateCopyWith<$Res> {
  factory _$$_AddEditTaskStateCopyWith(
          _$_AddEditTaskState value, $Res Function(_$_AddEditTaskState) then) =
      __$$_AddEditTaskStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CheckListItem> checkListItems,
      String? title,
      String? description,
      Project? project,
      DateTime? dueDate,
      Priority? priority,
      List<Tag>? tags});

  @override
  $ProjectCopyWith<$Res>? get project;
}

/// @nodoc
class __$$_AddEditTaskStateCopyWithImpl<$Res>
    extends _$AddEditTaskStateCopyWithImpl<$Res, _$_AddEditTaskState>
    implements _$$_AddEditTaskStateCopyWith<$Res> {
  __$$_AddEditTaskStateCopyWithImpl(
      _$_AddEditTaskState _value, $Res Function(_$_AddEditTaskState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checkListItems = null,
    Object? title = freezed,
    Object? description = freezed,
    Object? project = freezed,
    Object? dueDate = freezed,
    Object? priority = freezed,
    Object? tags = freezed,
  }) {
    return _then(_$_AddEditTaskState(
      checkListItems: null == checkListItems
          ? _value._checkListItems
          : checkListItems // ignore: cast_nullable_to_non_nullable
              as List<CheckListItem>,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      project: freezed == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as Project?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as Priority?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>?,
    ));
  }
}

/// @nodoc

class _$_AddEditTaskState implements _AddEditTaskState {
  const _$_AddEditTaskState(
      {required final List<CheckListItem> checkListItems,
      required this.title,
      required this.description,
      required this.project,
      required this.dueDate,
      required this.priority,
      required final List<Tag>? tags})
      : _checkListItems = checkListItems,
        _tags = tags;

  final List<CheckListItem> _checkListItems;
  @override
  List<CheckListItem> get checkListItems {
    if (_checkListItems is EqualUnmodifiableListView) return _checkListItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_checkListItems);
  }

  @override
  final String? title;
  @override
  final String? description;
  @override
  final Project? project;
  @override
  final DateTime? dueDate;
  @override
  final Priority? priority;
  final List<Tag>? _tags;
  @override
  List<Tag>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AddEditTaskState(checkListItems: $checkListItems, title: $title, description: $description, project: $project, dueDate: $dueDate, priority: $priority, tags: $tags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddEditTaskState &&
            const DeepCollectionEquality()
                .equals(other._checkListItems, _checkListItems) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.project, project) || other.project == project) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_checkListItems),
      title,
      description,
      project,
      dueDate,
      priority,
      const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddEditTaskStateCopyWith<_$_AddEditTaskState> get copyWith =>
      __$$_AddEditTaskStateCopyWithImpl<_$_AddEditTaskState>(this, _$identity);
}

abstract class _AddEditTaskState implements AddEditTaskState {
  const factory _AddEditTaskState(
      {required final List<CheckListItem> checkListItems,
      required final String? title,
      required final String? description,
      required final Project? project,
      required final DateTime? dueDate,
      required final Priority? priority,
      required final List<Tag>? tags}) = _$_AddEditTaskState;

  @override
  List<CheckListItem> get checkListItems;
  @override
  String? get title;
  @override
  String? get description;
  @override
  Project? get project;
  @override
  DateTime? get dueDate;
  @override
  Priority? get priority;
  @override
  List<Tag>? get tags;
  @override
  @JsonKey(ignore: true)
  _$$_AddEditTaskStateCopyWith<_$_AddEditTaskState> get copyWith =>
      throw _privateConstructorUsedError;
}
