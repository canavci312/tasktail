// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_dto.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ReminderDtoSchema = Schema(
  name: r'ReminderDto',
  id: -7210511551547793129,
  properties: {
    r'date': PropertySchema(
      id: 0,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'type': PropertySchema(
      id: 1,
      name: r'type',
      type: IsarType.byte,
      enumMap: _ReminderDtotypeEnumValueMap,
    )
  },
  estimateSize: _reminderDtoEstimateSize,
  serialize: _reminderDtoSerialize,
  deserialize: _reminderDtoDeserialize,
  deserializeProp: _reminderDtoDeserializeProp,
);

int _reminderDtoEstimateSize(
  ReminderDto object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _reminderDtoSerialize(
  ReminderDto object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.date);
  writer.writeByte(offsets[1], object.type.index);
}

ReminderDto _reminderDtoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ReminderDto(
    date: reader.readDateTimeOrNull(offsets[0]),
    type: _ReminderDtotypeValueEnumMap[reader.readByteOrNull(offsets[1])] ??
        ReminderType.onTime,
  );
  return object;
}

P _reminderDtoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (_ReminderDtotypeValueEnumMap[reader.readByteOrNull(offset)] ??
          ReminderType.onTime) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ReminderDtotypeEnumValueMap = {
  'onTime': 0,
  'fiveMinutes': 1,
  'tenMinutes': 2,
  'oneHour': 3,
  'atSpecificTime': 4,
  'atSpecificTimeAndDate': 5,
};
const _ReminderDtotypeValueEnumMap = {
  0: ReminderType.onTime,
  1: ReminderType.fiveMinutes,
  2: ReminderType.tenMinutes,
  3: ReminderType.oneHour,
  4: ReminderType.atSpecificTime,
  5: ReminderType.atSpecificTimeAndDate,
};

extension ReminderDtoQueryFilter
    on QueryBuilder<ReminderDto, ReminderDto, QFilterCondition> {
  QueryBuilder<ReminderDto, ReminderDto, QAfterFilterCondition> dateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'date',
      ));
    });
  }

  QueryBuilder<ReminderDto, ReminderDto, QAfterFilterCondition>
      dateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'date',
      ));
    });
  }

  QueryBuilder<ReminderDto, ReminderDto, QAfterFilterCondition> dateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<ReminderDto, ReminderDto, QAfterFilterCondition> dateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<ReminderDto, ReminderDto, QAfterFilterCondition> dateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<ReminderDto, ReminderDto, QAfterFilterCondition> dateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReminderDto, ReminderDto, QAfterFilterCondition> typeEqualTo(
      ReminderType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<ReminderDto, ReminderDto, QAfterFilterCondition> typeGreaterThan(
    ReminderType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<ReminderDto, ReminderDto, QAfterFilterCondition> typeLessThan(
    ReminderType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<ReminderDto, ReminderDto, QAfterFilterCondition> typeBetween(
    ReminderType lower,
    ReminderType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ReminderDtoQueryObject
    on QueryBuilder<ReminderDto, ReminderDto, QFilterCondition> {}
