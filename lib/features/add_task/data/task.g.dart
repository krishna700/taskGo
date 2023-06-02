// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTaskCollection on Isar {
  IsarCollection<Task> get tasks => this.collection();
}

const TaskSchema = CollectionSchema(
  name: r'Task',
  id: 2998003626758701373,
  properties: {
    r'createdOn': PropertySchema(
      id: 0,
      name: r'createdOn',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 1,
      name: r'description',
      type: IsarType.string,
    ),
    r'dueDateTime': PropertySchema(
      id: 2,
      name: r'dueDateTime',
      type: IsarType.dateTime,
    ),
    r'isCompleted': PropertySchema(
      id: 3,
      name: r'isCompleted',
      type: IsarType.bool,
    ),
    r'isReminderEnabled': PropertySchema(
      id: 4,
      name: r'isReminderEnabled',
      type: IsarType.bool,
    ),
    r'isTaskCompleted': PropertySchema(
      id: 5,
      name: r'isTaskCompleted',
      type: IsarType.bool,
    ),
    r'isTaskHighPriority': PropertySchema(
      id: 6,
      name: r'isTaskHighPriority',
      type: IsarType.bool,
    ),
    r'isTaskLowPriority': PropertySchema(
      id: 7,
      name: r'isTaskLowPriority',
      type: IsarType.bool,
    ),
    r'isTaskMediumPriority': PropertySchema(
      id: 8,
      name: r'isTaskMediumPriority',
      type: IsarType.bool,
    ),
    r'priority': PropertySchema(
      id: 9,
      name: r'priority',
      type: IsarType.long,
    ),
    r'taskName': PropertySchema(
      id: 10,
      name: r'taskName',
      type: IsarType.string,
    ),
    r'updatedOn': PropertySchema(
      id: 11,
      name: r'updatedOn',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _taskEstimateSize,
  serialize: _taskSerialize,
  deserialize: _taskDeserialize,
  deserializeProp: _taskDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _taskGetId,
  getLinks: _taskGetLinks,
  attach: _taskAttach,
  version: '3.1.0+1',
);

int _taskEstimateSize(
  Task object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.taskName.length * 3;
  return bytesCount;
}

void _taskSerialize(
  Task object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdOn);
  writer.writeString(offsets[1], object.description);
  writer.writeDateTime(offsets[2], object.dueDateTime);
  writer.writeBool(offsets[3], object.isCompleted);
  writer.writeBool(offsets[4], object.isReminderEnabled);
  writer.writeBool(offsets[5], object.isTaskCompleted);
  writer.writeBool(offsets[6], object.isTaskHighPriority);
  writer.writeBool(offsets[7], object.isTaskLowPriority);
  writer.writeBool(offsets[8], object.isTaskMediumPriority);
  writer.writeLong(offsets[9], object.priority);
  writer.writeString(offsets[10], object.taskName);
  writer.writeDateTime(offsets[11], object.updatedOn);
}

Task _taskDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Task();
  object.createdOn = reader.readDateTime(offsets[0]);
  object.description = reader.readStringOrNull(offsets[1]);
  object.dueDateTime = reader.readDateTimeOrNull(offsets[2]);
  object.id = id;
  object.isCompleted = reader.readBoolOrNull(offsets[3]);
  object.isReminderEnabled = reader.readBool(offsets[4]);
  object.priority = reader.readLong(offsets[9]);
  object.taskName = reader.readString(offsets[10]);
  object.updatedOn = reader.readDateTime(offsets[11]);
  return object;
}

P _taskDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _taskGetId(Task object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _taskGetLinks(Task object) {
  return [];
}

void _taskAttach(IsarCollection<dynamic> col, Id id, Task object) {
  object.id = id;
}

extension TaskQueryWhereSort on QueryBuilder<Task, Task, QWhere> {
  QueryBuilder<Task, Task, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TaskQueryWhere on QueryBuilder<Task, Task, QWhereClause> {
  QueryBuilder<Task, Task, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Task, Task, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Task, Task, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Task, Task, QAfterWhereClause> idBetween(
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

extension TaskQueryFilter on QueryBuilder<Task, Task, QFilterCondition> {
  QueryBuilder<Task, Task, QAfterFilterCondition> createdOnEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdOn',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> createdOnGreaterThan(
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

  QueryBuilder<Task, Task, QAfterFilterCondition> createdOnLessThan(
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

  QueryBuilder<Task, Task, QAfterFilterCondition> createdOnBetween(
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

  QueryBuilder<Task, Task, QAfterFilterCondition> descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> dueDateTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dueDateTime',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> dueDateTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dueDateTime',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> dueDateTimeEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dueDateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> dueDateTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dueDateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> dueDateTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dueDateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> dueDateTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dueDateTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> idGreaterThan(
    Id value, {
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

  QueryBuilder<Task, Task, QAfterFilterCondition> idLessThan(
    Id value, {
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

  QueryBuilder<Task, Task, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
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

  QueryBuilder<Task, Task, QAfterFilterCondition> isCompletedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isCompleted',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> isCompletedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isCompleted',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> isCompletedEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> isReminderEnabledEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isReminderEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> isTaskCompletedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isTaskCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> isTaskHighPriorityEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isTaskHighPriority',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> isTaskLowPriorityEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isTaskLowPriority',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> isTaskMediumPriorityEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isTaskMediumPriority',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> priorityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priority',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> priorityGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'priority',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> priorityLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'priority',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> priorityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'priority',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> taskNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taskName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> taskNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taskName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> taskNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taskName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> taskNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taskName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> taskNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'taskName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> taskNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'taskName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> taskNameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'taskName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> taskNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'taskName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> taskNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taskName',
        value: '',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> taskNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'taskName',
        value: '',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> updatedOnEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedOn',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> updatedOnGreaterThan(
    DateTime value, {
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

  QueryBuilder<Task, Task, QAfterFilterCondition> updatedOnLessThan(
    DateTime value, {
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

  QueryBuilder<Task, Task, QAfterFilterCondition> updatedOnBetween(
    DateTime lower,
    DateTime upper, {
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

extension TaskQueryObject on QueryBuilder<Task, Task, QFilterCondition> {}

extension TaskQueryLinks on QueryBuilder<Task, Task, QFilterCondition> {}

extension TaskQuerySortBy on QueryBuilder<Task, Task, QSortBy> {
  QueryBuilder<Task, Task, QAfterSortBy> sortByCreatedOn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdOn', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByCreatedOnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdOn', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByDueDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDateTime', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByDueDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDateTime', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByIsReminderEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isReminderEnabled', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByIsReminderEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isReminderEnabled', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByIsTaskCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isTaskCompleted', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByIsTaskCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isTaskCompleted', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByIsTaskHighPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isTaskHighPriority', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByIsTaskHighPriorityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isTaskHighPriority', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByIsTaskLowPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isTaskLowPriority', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByIsTaskLowPriorityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isTaskLowPriority', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByIsTaskMediumPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isTaskMediumPriority', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByIsTaskMediumPriorityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isTaskMediumPriority', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByPriorityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByTaskName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskName', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByTaskNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskName', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByUpdatedOn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedOn', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByUpdatedOnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedOn', Sort.desc);
    });
  }
}

extension TaskQuerySortThenBy on QueryBuilder<Task, Task, QSortThenBy> {
  QueryBuilder<Task, Task, QAfterSortBy> thenByCreatedOn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdOn', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByCreatedOnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdOn', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByDueDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDateTime', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByDueDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDateTime', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByIsReminderEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isReminderEnabled', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByIsReminderEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isReminderEnabled', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByIsTaskCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isTaskCompleted', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByIsTaskCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isTaskCompleted', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByIsTaskHighPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isTaskHighPriority', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByIsTaskHighPriorityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isTaskHighPriority', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByIsTaskLowPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isTaskLowPriority', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByIsTaskLowPriorityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isTaskLowPriority', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByIsTaskMediumPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isTaskMediumPriority', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByIsTaskMediumPriorityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isTaskMediumPriority', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByPriorityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByTaskName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskName', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByTaskNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskName', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByUpdatedOn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedOn', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByUpdatedOnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedOn', Sort.desc);
    });
  }
}

extension TaskQueryWhereDistinct on QueryBuilder<Task, Task, QDistinct> {
  QueryBuilder<Task, Task, QDistinct> distinctByCreatedOn() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdOn');
    });
  }

  QueryBuilder<Task, Task, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Task, Task, QDistinct> distinctByDueDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dueDateTime');
    });
  }

  QueryBuilder<Task, Task, QDistinct> distinctByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCompleted');
    });
  }

  QueryBuilder<Task, Task, QDistinct> distinctByIsReminderEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isReminderEnabled');
    });
  }

  QueryBuilder<Task, Task, QDistinct> distinctByIsTaskCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isTaskCompleted');
    });
  }

  QueryBuilder<Task, Task, QDistinct> distinctByIsTaskHighPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isTaskHighPriority');
    });
  }

  QueryBuilder<Task, Task, QDistinct> distinctByIsTaskLowPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isTaskLowPriority');
    });
  }

  QueryBuilder<Task, Task, QDistinct> distinctByIsTaskMediumPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isTaskMediumPriority');
    });
  }

  QueryBuilder<Task, Task, QDistinct> distinctByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'priority');
    });
  }

  QueryBuilder<Task, Task, QDistinct> distinctByTaskName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taskName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Task, Task, QDistinct> distinctByUpdatedOn() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedOn');
    });
  }
}

extension TaskQueryProperty on QueryBuilder<Task, Task, QQueryProperty> {
  QueryBuilder<Task, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Task, DateTime, QQueryOperations> createdOnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdOn');
    });
  }

  QueryBuilder<Task, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<Task, DateTime?, QQueryOperations> dueDateTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dueDateTime');
    });
  }

  QueryBuilder<Task, bool?, QQueryOperations> isCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCompleted');
    });
  }

  QueryBuilder<Task, bool, QQueryOperations> isReminderEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isReminderEnabled');
    });
  }

  QueryBuilder<Task, bool, QQueryOperations> isTaskCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isTaskCompleted');
    });
  }

  QueryBuilder<Task, bool, QQueryOperations> isTaskHighPriorityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isTaskHighPriority');
    });
  }

  QueryBuilder<Task, bool, QQueryOperations> isTaskLowPriorityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isTaskLowPriority');
    });
  }

  QueryBuilder<Task, bool, QQueryOperations> isTaskMediumPriorityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isTaskMediumPriority');
    });
  }

  QueryBuilder<Task, int, QQueryOperations> priorityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'priority');
    });
  }

  QueryBuilder<Task, String, QQueryOperations> taskNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taskName');
    });
  }

  QueryBuilder<Task, DateTime, QQueryOperations> updatedOnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedOn');
    });
  }
}
