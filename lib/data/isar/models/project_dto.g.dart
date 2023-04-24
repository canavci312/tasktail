// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_dto.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetProjectDtoCollection on Isar {
  IsarCollection<ProjectDto> get projectDtos => this.collection();
}

const ProjectDtoSchema = CollectionSchema(
  name: r'ProjectDto',
  id: 1749642847036591695,
  properties: {
    r'archived': PropertySchema(
      id: 0,
      name: r'archived',
      type: IsarType.bool,
    ),
    r'color': PropertySchema(
      id: 1,
      name: r'color',
      type: IsarType.byte,
      enumMap: _ProjectDtocolorEnumValueMap,
    ),
    r'createdOn': PropertySchema(
      id: 2,
      name: r'createdOn',
      type: IsarType.dateTime,
    ),
    r'sortyBy': PropertySchema(
      id: 3,
      name: r'sortyBy',
      type: IsarType.byte,
      enumMap: _ProjectDtosortyByEnumValueMap,
    ),
    r'title': PropertySchema(
      id: 4,
      name: r'title',
      type: IsarType.string,
    ),
    r'updatedOn': PropertySchema(
      id: 5,
      name: r'updatedOn',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _projectDtoEstimateSize,
  serialize: _projectDtoSerialize,
  deserialize: _projectDtoDeserialize,
  deserializeProp: _projectDtoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'tasks': LinkSchema(
      id: 6367050651973297040,
      name: r'tasks',
      target: r'TaskDto',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _projectDtoGetId,
  getLinks: _projectDtoGetLinks,
  attach: _projectDtoAttach,
  version: '3.1.0',
);

int _projectDtoEstimateSize(
  ProjectDto object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _projectDtoSerialize(
  ProjectDto object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.archived);
  writer.writeByte(offsets[1], object.color.index);
  writer.writeDateTime(offsets[2], object.createdOn);
  writer.writeByte(offsets[3], object.sortyBy.index);
  writer.writeString(offsets[4], object.title);
  writer.writeDateTime(offsets[5], object.updatedOn);
}

ProjectDto _projectDtoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ProjectDto(
    archived: reader.readBoolOrNull(offsets[0]) ?? false,
    color: _ProjectDtocolorValueEnumMap[reader.readByteOrNull(offsets[1])] ??
        TagColor.noColor,
    createdOn: reader.readDateTime(offsets[2]),
    id: id,
    sortyBy:
        _ProjectDtosortyByValueEnumMap[reader.readByteOrNull(offsets[3])] ??
            SortBy.createdDateAsc,
    title: reader.readString(offsets[4]),
    updatedOn: reader.readDateTimeOrNull(offsets[5]),
  );
  return object;
}

P _projectDtoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 1:
      return (_ProjectDtocolorValueEnumMap[reader.readByteOrNull(offset)] ??
          TagColor.noColor) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (_ProjectDtosortyByValueEnumMap[reader.readByteOrNull(offset)] ??
          SortBy.createdDateAsc) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ProjectDtocolorEnumValueMap = {
  'noColor': 0,
  'red': 1,
  'redAccent': 2,
  'orange': 3,
  'orangeAccent': 4,
  'yellow': 5,
  'yellowAccent': 6,
  'green': 7,
  'greenAccent': 8,
  'blue': 9,
  'blueAccent': 10,
  'purple': 11,
  'purpleAccent': 12,
  'pink': 13,
  'pinkAccent': 14,
  'brown': 15,
  'blueGray': 16,
  'grey': 17,
};
const _ProjectDtocolorValueEnumMap = {
  0: TagColor.noColor,
  1: TagColor.red,
  2: TagColor.redAccent,
  3: TagColor.orange,
  4: TagColor.orangeAccent,
  5: TagColor.yellow,
  6: TagColor.yellowAccent,
  7: TagColor.green,
  8: TagColor.greenAccent,
  9: TagColor.blue,
  10: TagColor.blueAccent,
  11: TagColor.purple,
  12: TagColor.purpleAccent,
  13: TagColor.pink,
  14: TagColor.pinkAccent,
  15: TagColor.brown,
  16: TagColor.blueGray,
  17: TagColor.grey,
};
const _ProjectDtosortyByEnumValueMap = {
  'dueDateDesc': 0,
  'dueDateAsc': 1,
  'name': 2,
  'priority': 3,
  'createdDateAsc': 4,
  'createdDateDesc': 5,
  'manual': 6,
};
const _ProjectDtosortyByValueEnumMap = {
  0: SortBy.dueDateDesc,
  1: SortBy.dueDateAsc,
  2: SortBy.name,
  3: SortBy.priority,
  4: SortBy.createdDateAsc,
  5: SortBy.createdDateDesc,
  6: SortBy.manual,
};

Id _projectDtoGetId(ProjectDto object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _projectDtoGetLinks(ProjectDto object) {
  return [object.tasks];
}

void _projectDtoAttach(IsarCollection<dynamic> col, Id id, ProjectDto object) {
  object.id = id;
  object.tasks.attach(col, col.isar.collection<TaskDto>(), r'tasks', id);
}

extension ProjectDtoQueryWhereSort
    on QueryBuilder<ProjectDto, ProjectDto, QWhere> {
  QueryBuilder<ProjectDto, ProjectDto, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ProjectDtoQueryWhere
    on QueryBuilder<ProjectDto, ProjectDto, QWhereClause> {
  QueryBuilder<ProjectDto, ProjectDto, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ProjectDtoQueryFilter
    on QueryBuilder<ProjectDto, ProjectDto, QFilterCondition> {
  QueryBuilder<ProjectDto, ProjectDto, QAfterFilterCondition> archivedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'archived',
        value: value,
      ));
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterFilterCondition> colorEqualTo(
      TagColor value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'color',
        value: value,
      ));
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterFilterCondition> colorGreaterThan(
    TagColor value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'color',
        value: value,
      ));
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterFilterCondition> colorLessThan(
    TagColor value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'color',
        value: value,
      ));
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterFilterCondition> colorBetween(
    TagColor lower,
    TagColor upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'color',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterFilterCondition> createdOnEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdOn',
        value: value,
      ));
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterFilterCondition>
      createdOnGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdOn',
        value: value,
      ));
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterFilterCondition> createdOnLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdOn',
        value: value,
      ));
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterFilterCondition> createdOnBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdOn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterFilterCondition> idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterFilterCondition> idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterFilterCondition> sortyByEqualTo(
      SortBy value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sortyBy',
        value: value,
      ));
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterFilterCondition>
      sortyByGreaterThan(
    SortBy value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sortyBy',
        value: value,
      ));
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterFilterCondition> sortyByLessThan(
    SortBy value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sortyBy',
        value: value,
      ));
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterFilterCondition> sortyByBetween(
    SortBy lower,
    SortBy upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sortyBy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterFilterCondition>
      updatedOnIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedOn',
      ));
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterFilterCondition>
      updatedOnIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedOn',
      ));
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterFilterCondition> updatedOnEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedOn',
        value: value,
      ));
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterFilterCondition>
      updatedOnGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedOn',
        value: value,
      ));
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterFilterCondition> updatedOnLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedOn',
        value: value,
      ));
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterFilterCondition> updatedOnBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedOn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ProjectDtoQueryObject
    on QueryBuilder<ProjectDto, ProjectDto, QFilterCondition> {}

extension ProjectDtoQueryLinks
    on QueryBuilder<ProjectDto, ProjectDto, QFilterCondition> {
  QueryBuilder<ProjectDto, ProjectDto, QAfterFilterCondition> tasks(
      FilterQuery<TaskDto> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'tasks');
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterFilterCondition>
      tasksLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tasks', length, true, length, true);
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterFilterCondition> tasksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tasks', 0, true, 0, true);
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterFilterCondition>
      tasksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tasks', 0, false, 999999, true);
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterFilterCondition>
      tasksLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tasks', 0, true, length, include);
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterFilterCondition>
      tasksLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tasks', length, include, 999999, true);
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterFilterCondition>
      tasksLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'tasks', lower, includeLower, upper, includeUpper);
    });
  }
}

extension ProjectDtoQuerySortBy
    on QueryBuilder<ProjectDto, ProjectDto, QSortBy> {
  QueryBuilder<ProjectDto, ProjectDto, QAfterSortBy> sortByArchived() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'archived', Sort.asc);
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterSortBy> sortByArchivedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'archived', Sort.desc);
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterSortBy> sortByColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.asc);
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterSortBy> sortByColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.desc);
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterSortBy> sortByCreatedOn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdOn', Sort.asc);
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterSortBy> sortByCreatedOnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdOn', Sort.desc);
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterSortBy> sortBySortyBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortyBy', Sort.asc);
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterSortBy> sortBySortyByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortyBy', Sort.desc);
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterSortBy> sortByUpdatedOn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedOn', Sort.asc);
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterSortBy> sortByUpdatedOnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedOn', Sort.desc);
    });
  }
}

extension ProjectDtoQuerySortThenBy
    on QueryBuilder<ProjectDto, ProjectDto, QSortThenBy> {
  QueryBuilder<ProjectDto, ProjectDto, QAfterSortBy> thenByArchived() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'archived', Sort.asc);
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterSortBy> thenByArchivedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'archived', Sort.desc);
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterSortBy> thenByColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.asc);
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterSortBy> thenByColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.desc);
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterSortBy> thenByCreatedOn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdOn', Sort.asc);
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterSortBy> thenByCreatedOnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdOn', Sort.desc);
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterSortBy> thenBySortyBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortyBy', Sort.asc);
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterSortBy> thenBySortyByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortyBy', Sort.desc);
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterSortBy> thenByUpdatedOn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedOn', Sort.asc);
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QAfterSortBy> thenByUpdatedOnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedOn', Sort.desc);
    });
  }
}

extension ProjectDtoQueryWhereDistinct
    on QueryBuilder<ProjectDto, ProjectDto, QDistinct> {
  QueryBuilder<ProjectDto, ProjectDto, QDistinct> distinctByArchived() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'archived');
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QDistinct> distinctByColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'color');
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QDistinct> distinctByCreatedOn() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdOn');
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QDistinct> distinctBySortyBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sortyBy');
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProjectDto, ProjectDto, QDistinct> distinctByUpdatedOn() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedOn');
    });
  }
}

extension ProjectDtoQueryProperty
    on QueryBuilder<ProjectDto, ProjectDto, QQueryProperty> {
  QueryBuilder<ProjectDto, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ProjectDto, bool, QQueryOperations> archivedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'archived');
    });
  }

  QueryBuilder<ProjectDto, TagColor, QQueryOperations> colorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'color');
    });
  }

  QueryBuilder<ProjectDto, DateTime, QQueryOperations> createdOnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdOn');
    });
  }

  QueryBuilder<ProjectDto, SortBy, QQueryOperations> sortyByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sortyBy');
    });
  }

  QueryBuilder<ProjectDto, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<ProjectDto, DateTime?, QQueryOperations> updatedOnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedOn');
    });
  }
}
