// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Task {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  bool get isNote => throw _privateConstructorUsedError;
  DateTime? get dueDate => throw _privateConstructorUsedError;
  Priority get priority => throw _privateConstructorUsedError;
  Project? get project => throw _privateConstructorUsedError;
  List<Tag>? get tags => throw _privateConstructorUsedError;
  List<CheckListItem>? get checklist => throw _privateConstructorUsedError;
  DateTime? get createdOn => throw _privateConstructorUsedError;
  DateTime? get updatedOn => throw _privateConstructorUsedError;
  List<Reminder> get reminders => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? description,
      bool isCompleted,
      bool isNote,
      DateTime? dueDate,
      Priority priority,
      Project? project,
      List<Tag>? tags,
      List<CheckListItem>? checklist,
      DateTime? createdOn,
      DateTime? updatedOn,
      List<Reminder> reminders});

  $ProjectCopyWith<$Res>? get project;
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? isCompleted = null,
    Object? isNote = null,
    Object? dueDate = freezed,
    Object? priority = null,
    Object? project = freezed,
    Object? tags = freezed,
    Object? checklist = freezed,
    Object? createdOn = freezed,
    Object? updatedOn = freezed,
    Object? reminders = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isNote: null == isNote
          ? _value.isNote
          : isNote // ignore: cast_nullable_to_non_nullable
              as bool,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as Priority,
      project: freezed == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as Project?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>?,
      checklist: freezed == checklist
          ? _value.checklist
          : checklist // ignore: cast_nullable_to_non_nullable
              as List<CheckListItem>?,
      createdOn: freezed == createdOn
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedOn: freezed == updatedOn
          ? _value.updatedOn
          : updatedOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reminders: null == reminders
          ? _value.reminders
          : reminders // ignore: cast_nullable_to_non_nullable
              as List<Reminder>,
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
abstract class _$$_TaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$_TaskCopyWith(_$_Task value, $Res Function(_$_Task) then) =
      __$$_TaskCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? description,
      bool isCompleted,
      bool isNote,
      DateTime? dueDate,
      Priority priority,
      Project? project,
      List<Tag>? tags,
      List<CheckListItem>? checklist,
      DateTime? createdOn,
      DateTime? updatedOn,
      List<Reminder> reminders});

  @override
  $ProjectCopyWith<$Res>? get project;
}

/// @nodoc
class __$$_TaskCopyWithImpl<$Res> extends _$TaskCopyWithImpl<$Res, _$_Task>
    implements _$$_TaskCopyWith<$Res> {
  __$$_TaskCopyWithImpl(_$_Task _value, $Res Function(_$_Task) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? isCompleted = null,
    Object? isNote = null,
    Object? dueDate = freezed,
    Object? priority = null,
    Object? project = freezed,
    Object? tags = freezed,
    Object? checklist = freezed,
    Object? createdOn = freezed,
    Object? updatedOn = freezed,
    Object? reminders = null,
  }) {
    return _then(_$_Task(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isNote: null == isNote
          ? _value.isNote
          : isNote // ignore: cast_nullable_to_non_nullable
              as bool,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as Priority,
      project: freezed == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as Project?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>?,
      checklist: freezed == checklist
          ? _value._checklist
          : checklist // ignore: cast_nullable_to_non_nullable
              as List<CheckListItem>?,
      createdOn: freezed == createdOn
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedOn: freezed == updatedOn
          ? _value.updatedOn
          : updatedOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reminders: null == reminders
          ? _value._reminders
          : reminders // ignore: cast_nullable_to_non_nullable
              as List<Reminder>,
    ));
  }
}

/// @nodoc

class _$_Task implements _Task {
  const _$_Task(
      {this.id,
      this.title,
      this.description,
      this.isCompleted = false,
      this.isNote = false,
      this.dueDate,
      this.priority = Priority.noPriority,
      this.project,
      final List<Tag>? tags,
      final List<CheckListItem>? checklist,
      this.createdOn,
      this.updatedOn,
      final List<Reminder> reminders = const <Reminder>[]})
      : _tags = tags,
        _checklist = checklist,
        _reminders = reminders;

  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? description;
  @override
  @JsonKey()
  final bool isCompleted;
  @override
  @JsonKey()
  final bool isNote;
  @override
  final DateTime? dueDate;
  @override
  @JsonKey()
  final Priority priority;
  @override
  final Project? project;
  final List<Tag>? _tags;
  @override
  List<Tag>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CheckListItem>? _checklist;
  @override
  List<CheckListItem>? get checklist {
    final value = _checklist;
    if (value == null) return null;
    if (_checklist is EqualUnmodifiableListView) return _checklist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? createdOn;
  @override
  final DateTime? updatedOn;
  final List<Reminder> _reminders;
  @override
  @JsonKey()
  List<Reminder> get reminders {
    if (_reminders is EqualUnmodifiableListView) return _reminders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reminders);
  }

  @override
  String toString() {
    return 'Task(id: $id, title: $title, description: $description, isCompleted: $isCompleted, isNote: $isNote, dueDate: $dueDate, priority: $priority, project: $project, tags: $tags, checklist: $checklist, createdOn: $createdOn, updatedOn: $updatedOn, reminders: $reminders)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Task &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.isNote, isNote) || other.isNote == isNote) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.project, project) || other.project == project) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality()
                .equals(other._checklist, _checklist) &&
            (identical(other.createdOn, createdOn) ||
                other.createdOn == createdOn) &&
            (identical(other.updatedOn, updatedOn) ||
                other.updatedOn == updatedOn) &&
            const DeepCollectionEquality()
                .equals(other._reminders, _reminders));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      isCompleted,
      isNote,
      dueDate,
      priority,
      project,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_checklist),
      createdOn,
      updatedOn,
      const DeepCollectionEquality().hash(_reminders));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaskCopyWith<_$_Task> get copyWith =>
      __$$_TaskCopyWithImpl<_$_Task>(this, _$identity);
}

abstract class _Task implements Task {
  const factory _Task(
      {final int? id,
      final String? title,
      final String? description,
      final bool isCompleted,
      final bool isNote,
      final DateTime? dueDate,
      final Priority priority,
      final Project? project,
      final List<Tag>? tags,
      final List<CheckListItem>? checklist,
      final DateTime? createdOn,
      final DateTime? updatedOn,
      final List<Reminder> reminders}) = _$_Task;

  @override
  int? get id;
  @override
  String? get title;
  @override
  String? get description;
  @override
  bool get isCompleted;
  @override
  bool get isNote;
  @override
  DateTime? get dueDate;
  @override
  Priority get priority;
  @override
  Project? get project;
  @override
  List<Tag>? get tags;
  @override
  List<CheckListItem>? get checklist;
  @override
  DateTime? get createdOn;
  @override
  DateTime? get updatedOn;
  @override
  List<Reminder> get reminders;
  @override
  @JsonKey(ignore: true)
  _$$_TaskCopyWith<_$_Task> get copyWith => throw _privateConstructorUsedError;
}
