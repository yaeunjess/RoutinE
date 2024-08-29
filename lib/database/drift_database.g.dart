// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class $ExercisesTable extends Exercises
    with TableInfo<$ExercisesTable, Exercise> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExercisesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _videoExistsMeta =
      const VerificationMeta('videoExists');
  @override
  late final GeneratedColumn<bool> videoExists = GeneratedColumn<bool>(
      'video_exists', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("video_exists" IN (0, 1))'));
  static const VerificationMeta _videoURLMeta =
      const VerificationMeta('videoURL');
  @override
  late final GeneratedColumn<String> videoURL = GeneratedColumn<String>(
      'video_u_r_l', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _counterTypeMeta =
      const VerificationMeta('counterType');
  @override
  late final GeneratedColumnWithTypeConverter<CounterType, String> counterType =
      GeneratedColumn<String>('counter_type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<CounterType>($ExercisesTable.$convertercounterType);
  static const VerificationMeta _targetCountsMeta =
      const VerificationMeta('targetCounts');
  @override
  late final GeneratedColumn<String> targetCounts = GeneratedColumn<String>(
      'target_counts', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _memoContentMeta =
      const VerificationMeta('memoContent');
  @override
  late final GeneratedColumn<String> memoContent = GeneratedColumn<String>(
      'memo_content', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isAchievedMeta =
      const VerificationMeta('isAchieved');
  @override
  late final GeneratedColumn<bool> isAchieved = GeneratedColumn<bool>(
      'is_achieved', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_achieved" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _routineIdMeta =
      const VerificationMeta('routineId');
  @override
  late final GeneratedColumn<String> routineId = GeneratedColumn<String>(
      'routine_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        videoExists,
        videoURL,
        counterType,
        targetCounts,
        memoContent,
        isAchieved,
        routineId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercises';
  @override
  VerificationContext validateIntegrity(Insertable<Exercise> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('video_exists')) {
      context.handle(
          _videoExistsMeta,
          videoExists.isAcceptableOrUnknown(
              data['video_exists']!, _videoExistsMeta));
    } else if (isInserting) {
      context.missing(_videoExistsMeta);
    }
    if (data.containsKey('video_u_r_l')) {
      context.handle(_videoURLMeta,
          videoURL.isAcceptableOrUnknown(data['video_u_r_l']!, _videoURLMeta));
    }
    context.handle(_counterTypeMeta, const VerificationResult.success());
    if (data.containsKey('target_counts')) {
      context.handle(
          _targetCountsMeta,
          targetCounts.isAcceptableOrUnknown(
              data['target_counts']!, _targetCountsMeta));
    }
    if (data.containsKey('memo_content')) {
      context.handle(
          _memoContentMeta,
          memoContent.isAcceptableOrUnknown(
              data['memo_content']!, _memoContentMeta));
    }
    if (data.containsKey('is_achieved')) {
      context.handle(
          _isAchievedMeta,
          isAchieved.isAcceptableOrUnknown(
              data['is_achieved']!, _isAchievedMeta));
    }
    if (data.containsKey('routine_id')) {
      context.handle(_routineIdMeta,
          routineId.isAcceptableOrUnknown(data['routine_id']!, _routineIdMeta));
    } else if (isInserting) {
      context.missing(_routineIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Exercise map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Exercise(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      videoExists: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}video_exists'])!,
      videoURL: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}video_u_r_l']),
      counterType: $ExercisesTable.$convertercounterType.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}counter_type'])!),
      targetCounts: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}target_counts']),
      memoContent: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}memo_content']),
      isAchieved: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_achieved'])!,
      routineId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}routine_id'])!,
    );
  }

  @override
  $ExercisesTable createAlias(String alias) {
    return $ExercisesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<CounterType, String, String> $convertercounterType =
      const EnumNameConverter<CounterType>(CounterType.values);
}

class Exercise extends DataClass implements Insertable<Exercise> {
  final String id;
  final String title;
  final bool videoExists;
  final String? videoURL;
  final CounterType counterType;
  final String? targetCounts;
  final String? memoContent;
  final bool isAchieved;
  final String routineId;
  const Exercise(
      {required this.id,
      required this.title,
      required this.videoExists,
      this.videoURL,
      required this.counterType,
      this.targetCounts,
      this.memoContent,
      required this.isAchieved,
      required this.routineId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['video_exists'] = Variable<bool>(videoExists);
    if (!nullToAbsent || videoURL != null) {
      map['video_u_r_l'] = Variable<String>(videoURL);
    }
    {
      map['counter_type'] = Variable<String>(
          $ExercisesTable.$convertercounterType.toSql(counterType));
    }
    if (!nullToAbsent || targetCounts != null) {
      map['target_counts'] = Variable<String>(targetCounts);
    }
    if (!nullToAbsent || memoContent != null) {
      map['memo_content'] = Variable<String>(memoContent);
    }
    map['is_achieved'] = Variable<bool>(isAchieved);
    map['routine_id'] = Variable<String>(routineId);
    return map;
  }

  ExercisesCompanion toCompanion(bool nullToAbsent) {
    return ExercisesCompanion(
      id: Value(id),
      title: Value(title),
      videoExists: Value(videoExists),
      videoURL: videoURL == null && nullToAbsent
          ? const Value.absent()
          : Value(videoURL),
      counterType: Value(counterType),
      targetCounts: targetCounts == null && nullToAbsent
          ? const Value.absent()
          : Value(targetCounts),
      memoContent: memoContent == null && nullToAbsent
          ? const Value.absent()
          : Value(memoContent),
      isAchieved: Value(isAchieved),
      routineId: Value(routineId),
    );
  }

  factory Exercise.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Exercise(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      videoExists: serializer.fromJson<bool>(json['videoExists']),
      videoURL: serializer.fromJson<String?>(json['videoURL']),
      counterType: $ExercisesTable.$convertercounterType
          .fromJson(serializer.fromJson<String>(json['counterType'])),
      targetCounts: serializer.fromJson<String?>(json['targetCounts']),
      memoContent: serializer.fromJson<String?>(json['memoContent']),
      isAchieved: serializer.fromJson<bool>(json['isAchieved']),
      routineId: serializer.fromJson<String>(json['routineId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'videoExists': serializer.toJson<bool>(videoExists),
      'videoURL': serializer.toJson<String?>(videoURL),
      'counterType': serializer.toJson<String>(
          $ExercisesTable.$convertercounterType.toJson(counterType)),
      'targetCounts': serializer.toJson<String?>(targetCounts),
      'memoContent': serializer.toJson<String?>(memoContent),
      'isAchieved': serializer.toJson<bool>(isAchieved),
      'routineId': serializer.toJson<String>(routineId),
    };
  }

  Exercise copyWith(
          {String? id,
          String? title,
          bool? videoExists,
          Value<String?> videoURL = const Value.absent(),
          CounterType? counterType,
          Value<String?> targetCounts = const Value.absent(),
          Value<String?> memoContent = const Value.absent(),
          bool? isAchieved,
          String? routineId}) =>
      Exercise(
        id: id ?? this.id,
        title: title ?? this.title,
        videoExists: videoExists ?? this.videoExists,
        videoURL: videoURL.present ? videoURL.value : this.videoURL,
        counterType: counterType ?? this.counterType,
        targetCounts:
            targetCounts.present ? targetCounts.value : this.targetCounts,
        memoContent: memoContent.present ? memoContent.value : this.memoContent,
        isAchieved: isAchieved ?? this.isAchieved,
        routineId: routineId ?? this.routineId,
      );
  Exercise copyWithCompanion(ExercisesCompanion data) {
    return Exercise(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      videoExists:
          data.videoExists.present ? data.videoExists.value : this.videoExists,
      videoURL: data.videoURL.present ? data.videoURL.value : this.videoURL,
      counterType:
          data.counterType.present ? data.counterType.value : this.counterType,
      targetCounts: data.targetCounts.present
          ? data.targetCounts.value
          : this.targetCounts,
      memoContent:
          data.memoContent.present ? data.memoContent.value : this.memoContent,
      isAchieved:
          data.isAchieved.present ? data.isAchieved.value : this.isAchieved,
      routineId: data.routineId.present ? data.routineId.value : this.routineId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Exercise(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('videoExists: $videoExists, ')
          ..write('videoURL: $videoURL, ')
          ..write('counterType: $counterType, ')
          ..write('targetCounts: $targetCounts, ')
          ..write('memoContent: $memoContent, ')
          ..write('isAchieved: $isAchieved, ')
          ..write('routineId: $routineId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, videoExists, videoURL, counterType,
      targetCounts, memoContent, isAchieved, routineId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Exercise &&
          other.id == this.id &&
          other.title == this.title &&
          other.videoExists == this.videoExists &&
          other.videoURL == this.videoURL &&
          other.counterType == this.counterType &&
          other.targetCounts == this.targetCounts &&
          other.memoContent == this.memoContent &&
          other.isAchieved == this.isAchieved &&
          other.routineId == this.routineId);
}

class ExercisesCompanion extends UpdateCompanion<Exercise> {
  final Value<String> id;
  final Value<String> title;
  final Value<bool> videoExists;
  final Value<String?> videoURL;
  final Value<CounterType> counterType;
  final Value<String?> targetCounts;
  final Value<String?> memoContent;
  final Value<bool> isAchieved;
  final Value<String> routineId;
  final Value<int> rowid;
  const ExercisesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.videoExists = const Value.absent(),
    this.videoURL = const Value.absent(),
    this.counterType = const Value.absent(),
    this.targetCounts = const Value.absent(),
    this.memoContent = const Value.absent(),
    this.isAchieved = const Value.absent(),
    this.routineId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExercisesCompanion.insert({
    required String id,
    required String title,
    required bool videoExists,
    this.videoURL = const Value.absent(),
    required CounterType counterType,
    this.targetCounts = const Value.absent(),
    this.memoContent = const Value.absent(),
    this.isAchieved = const Value.absent(),
    required String routineId,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        videoExists = Value(videoExists),
        counterType = Value(counterType),
        routineId = Value(routineId);
  static Insertable<Exercise> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<bool>? videoExists,
    Expression<String>? videoURL,
    Expression<String>? counterType,
    Expression<String>? targetCounts,
    Expression<String>? memoContent,
    Expression<bool>? isAchieved,
    Expression<String>? routineId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (videoExists != null) 'video_exists': videoExists,
      if (videoURL != null) 'video_u_r_l': videoURL,
      if (counterType != null) 'counter_type': counterType,
      if (targetCounts != null) 'target_counts': targetCounts,
      if (memoContent != null) 'memo_content': memoContent,
      if (isAchieved != null) 'is_achieved': isAchieved,
      if (routineId != null) 'routine_id': routineId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExercisesCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<bool>? videoExists,
      Value<String?>? videoURL,
      Value<CounterType>? counterType,
      Value<String?>? targetCounts,
      Value<String?>? memoContent,
      Value<bool>? isAchieved,
      Value<String>? routineId,
      Value<int>? rowid}) {
    return ExercisesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      videoExists: videoExists ?? this.videoExists,
      videoURL: videoURL ?? this.videoURL,
      counterType: counterType ?? this.counterType,
      targetCounts: targetCounts ?? this.targetCounts,
      memoContent: memoContent ?? this.memoContent,
      isAchieved: isAchieved ?? this.isAchieved,
      routineId: routineId ?? this.routineId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (videoExists.present) {
      map['video_exists'] = Variable<bool>(videoExists.value);
    }
    if (videoURL.present) {
      map['video_u_r_l'] = Variable<String>(videoURL.value);
    }
    if (counterType.present) {
      map['counter_type'] = Variable<String>(
          $ExercisesTable.$convertercounterType.toSql(counterType.value));
    }
    if (targetCounts.present) {
      map['target_counts'] = Variable<String>(targetCounts.value);
    }
    if (memoContent.present) {
      map['memo_content'] = Variable<String>(memoContent.value);
    }
    if (isAchieved.present) {
      map['is_achieved'] = Variable<bool>(isAchieved.value);
    }
    if (routineId.present) {
      map['routine_id'] = Variable<String>(routineId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExercisesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('videoExists: $videoExists, ')
          ..write('videoURL: $videoURL, ')
          ..write('counterType: $counterType, ')
          ..write('targetCounts: $targetCounts, ')
          ..write('memoContent: $memoContent, ')
          ..write('isAchieved: $isAchieved, ')
          ..write('routineId: $routineId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RoutinesTable extends Routines with TableInfo<$RoutinesTable, Routine> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoutinesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'routines';
  @override
  VerificationContext validateIntegrity(Insertable<Routine> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Routine map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Routine(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
    );
  }

  @override
  $RoutinesTable createAlias(String alias) {
    return $RoutinesTable(attachedDatabase, alias);
  }
}

class Routine extends DataClass implements Insertable<Routine> {
  final String id;
  final String title;
  const Routine({required this.id, required this.title});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    return map;
  }

  RoutinesCompanion toCompanion(bool nullToAbsent) {
    return RoutinesCompanion(
      id: Value(id),
      title: Value(title),
    );
  }

  factory Routine.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Routine(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
    };
  }

  Routine copyWith({String? id, String? title}) => Routine(
        id: id ?? this.id,
        title: title ?? this.title,
      );
  Routine copyWithCompanion(RoutinesCompanion data) {
    return Routine(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Routine(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Routine && other.id == this.id && other.title == this.title);
}

class RoutinesCompanion extends UpdateCompanion<Routine> {
  final Value<String> id;
  final Value<String> title;
  final Value<int> rowid;
  const RoutinesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RoutinesCompanion.insert({
    required String id,
    required String title,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title);
  static Insertable<Routine> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RoutinesCompanion copyWith(
      {Value<String>? id, Value<String>? title, Value<int>? rowid}) {
    return RoutinesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoutinesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RecordsTable extends Records with TableInfo<$RecordsTable, Record> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _routineTitleMeta =
      const VerificationMeta('routineTitle');
  @override
  late final GeneratedColumn<String> routineTitle = GeneratedColumn<String>(
      'routine_title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _exerciseTitleMeta =
      const VerificationMeta('exerciseTitle');
  @override
  late final GeneratedColumn<String> exerciseTitle = GeneratedColumn<String>(
      'exercise_title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _counterTypeMeta =
      const VerificationMeta('counterType');
  @override
  late final GeneratedColumnWithTypeConverter<CounterType, String> counterType =
      GeneratedColumn<String>('counter_type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<CounterType>($RecordsTable.$convertercounterType);
  static const VerificationMeta _achievementCountsMeta =
      const VerificationMeta('achievementCounts');
  @override
  late final GeneratedColumn<String> achievementCounts =
      GeneratedColumn<String>('achievement_counts', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, date, routineTitle, exerciseTitle, counterType, achievementCounts];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'records';
  @override
  VerificationContext validateIntegrity(Insertable<Record> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('routine_title')) {
      context.handle(
          _routineTitleMeta,
          routineTitle.isAcceptableOrUnknown(
              data['routine_title']!, _routineTitleMeta));
    } else if (isInserting) {
      context.missing(_routineTitleMeta);
    }
    if (data.containsKey('exercise_title')) {
      context.handle(
          _exerciseTitleMeta,
          exerciseTitle.isAcceptableOrUnknown(
              data['exercise_title']!, _exerciseTitleMeta));
    } else if (isInserting) {
      context.missing(_exerciseTitleMeta);
    }
    context.handle(_counterTypeMeta, const VerificationResult.success());
    if (data.containsKey('achievement_counts')) {
      context.handle(
          _achievementCountsMeta,
          achievementCounts.isAcceptableOrUnknown(
              data['achievement_counts']!, _achievementCountsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Record map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Record(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      routineTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}routine_title'])!,
      exerciseTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}exercise_title'])!,
      counterType: $RecordsTable.$convertercounterType.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}counter_type'])!),
      achievementCounts: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}achievement_counts']),
    );
  }

  @override
  $RecordsTable createAlias(String alias) {
    return $RecordsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<CounterType, String, String> $convertercounterType =
      const EnumNameConverter<CounterType>(CounterType.values);
}

class Record extends DataClass implements Insertable<Record> {
  final String id;
  final DateTime date;
  final String routineTitle;
  final String exerciseTitle;
  final CounterType counterType;
  final String? achievementCounts;
  const Record(
      {required this.id,
      required this.date,
      required this.routineTitle,
      required this.exerciseTitle,
      required this.counterType,
      this.achievementCounts});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['date'] = Variable<DateTime>(date);
    map['routine_title'] = Variable<String>(routineTitle);
    map['exercise_title'] = Variable<String>(exerciseTitle);
    {
      map['counter_type'] = Variable<String>(
          $RecordsTable.$convertercounterType.toSql(counterType));
    }
    if (!nullToAbsent || achievementCounts != null) {
      map['achievement_counts'] = Variable<String>(achievementCounts);
    }
    return map;
  }

  RecordsCompanion toCompanion(bool nullToAbsent) {
    return RecordsCompanion(
      id: Value(id),
      date: Value(date),
      routineTitle: Value(routineTitle),
      exerciseTitle: Value(exerciseTitle),
      counterType: Value(counterType),
      achievementCounts: achievementCounts == null && nullToAbsent
          ? const Value.absent()
          : Value(achievementCounts),
    );
  }

  factory Record.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Record(
      id: serializer.fromJson<String>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      routineTitle: serializer.fromJson<String>(json['routineTitle']),
      exerciseTitle: serializer.fromJson<String>(json['exerciseTitle']),
      counterType: $RecordsTable.$convertercounterType
          .fromJson(serializer.fromJson<String>(json['counterType'])),
      achievementCounts:
          serializer.fromJson<String?>(json['achievementCounts']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'date': serializer.toJson<DateTime>(date),
      'routineTitle': serializer.toJson<String>(routineTitle),
      'exerciseTitle': serializer.toJson<String>(exerciseTitle),
      'counterType': serializer.toJson<String>(
          $RecordsTable.$convertercounterType.toJson(counterType)),
      'achievementCounts': serializer.toJson<String?>(achievementCounts),
    };
  }

  Record copyWith(
          {String? id,
          DateTime? date,
          String? routineTitle,
          String? exerciseTitle,
          CounterType? counterType,
          Value<String?> achievementCounts = const Value.absent()}) =>
      Record(
        id: id ?? this.id,
        date: date ?? this.date,
        routineTitle: routineTitle ?? this.routineTitle,
        exerciseTitle: exerciseTitle ?? this.exerciseTitle,
        counterType: counterType ?? this.counterType,
        achievementCounts: achievementCounts.present
            ? achievementCounts.value
            : this.achievementCounts,
      );
  Record copyWithCompanion(RecordsCompanion data) {
    return Record(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      routineTitle: data.routineTitle.present
          ? data.routineTitle.value
          : this.routineTitle,
      exerciseTitle: data.exerciseTitle.present
          ? data.exerciseTitle.value
          : this.exerciseTitle,
      counterType:
          data.counterType.present ? data.counterType.value : this.counterType,
      achievementCounts: data.achievementCounts.present
          ? data.achievementCounts.value
          : this.achievementCounts,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Record(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('routineTitle: $routineTitle, ')
          ..write('exerciseTitle: $exerciseTitle, ')
          ..write('counterType: $counterType, ')
          ..write('achievementCounts: $achievementCounts')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, date, routineTitle, exerciseTitle, counterType, achievementCounts);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Record &&
          other.id == this.id &&
          other.date == this.date &&
          other.routineTitle == this.routineTitle &&
          other.exerciseTitle == this.exerciseTitle &&
          other.counterType == this.counterType &&
          other.achievementCounts == this.achievementCounts);
}

class RecordsCompanion extends UpdateCompanion<Record> {
  final Value<String> id;
  final Value<DateTime> date;
  final Value<String> routineTitle;
  final Value<String> exerciseTitle;
  final Value<CounterType> counterType;
  final Value<String?> achievementCounts;
  final Value<int> rowid;
  const RecordsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.routineTitle = const Value.absent(),
    this.exerciseTitle = const Value.absent(),
    this.counterType = const Value.absent(),
    this.achievementCounts = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecordsCompanion.insert({
    required String id,
    required DateTime date,
    required String routineTitle,
    required String exerciseTitle,
    required CounterType counterType,
    this.achievementCounts = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        date = Value(date),
        routineTitle = Value(routineTitle),
        exerciseTitle = Value(exerciseTitle),
        counterType = Value(counterType);
  static Insertable<Record> custom({
    Expression<String>? id,
    Expression<DateTime>? date,
    Expression<String>? routineTitle,
    Expression<String>? exerciseTitle,
    Expression<String>? counterType,
    Expression<String>? achievementCounts,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (routineTitle != null) 'routine_title': routineTitle,
      if (exerciseTitle != null) 'exercise_title': exerciseTitle,
      if (counterType != null) 'counter_type': counterType,
      if (achievementCounts != null) 'achievement_counts': achievementCounts,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecordsCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? date,
      Value<String>? routineTitle,
      Value<String>? exerciseTitle,
      Value<CounterType>? counterType,
      Value<String?>? achievementCounts,
      Value<int>? rowid}) {
    return RecordsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      routineTitle: routineTitle ?? this.routineTitle,
      exerciseTitle: exerciseTitle ?? this.exerciseTitle,
      counterType: counterType ?? this.counterType,
      achievementCounts: achievementCounts ?? this.achievementCounts,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (routineTitle.present) {
      map['routine_title'] = Variable<String>(routineTitle.value);
    }
    if (exerciseTitle.present) {
      map['exercise_title'] = Variable<String>(exerciseTitle.value);
    }
    if (counterType.present) {
      map['counter_type'] = Variable<String>(
          $RecordsTable.$convertercounterType.toSql(counterType.value));
    }
    if (achievementCounts.present) {
      map['achievement_counts'] = Variable<String>(achievementCounts.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecordsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('routineTitle: $routineTitle, ')
          ..write('exerciseTitle: $exerciseTitle, ')
          ..write('counterType: $counterType, ')
          ..write('achievementCounts: $achievementCounts, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ExercisesTable exercises = $ExercisesTable(this);
  late final $RoutinesTable routines = $RoutinesTable(this);
  late final $RecordsTable records = $RecordsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [exercises, routines, records];
}

typedef $$ExercisesTableCreateCompanionBuilder = ExercisesCompanion Function({
  required String id,
  required String title,
  required bool videoExists,
  Value<String?> videoURL,
  required CounterType counterType,
  Value<String?> targetCounts,
  Value<String?> memoContent,
  Value<bool> isAchieved,
  required String routineId,
  Value<int> rowid,
});
typedef $$ExercisesTableUpdateCompanionBuilder = ExercisesCompanion Function({
  Value<String> id,
  Value<String> title,
  Value<bool> videoExists,
  Value<String?> videoURL,
  Value<CounterType> counterType,
  Value<String?> targetCounts,
  Value<String?> memoContent,
  Value<bool> isAchieved,
  Value<String> routineId,
  Value<int> rowid,
});

class $$ExercisesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ExercisesTable> {
  $$ExercisesTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get videoExists => $state.composableBuilder(
      column: $state.table.videoExists,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get videoURL => $state.composableBuilder(
      column: $state.table.videoURL,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<CounterType, CounterType, String>
      get counterType => $state.composableBuilder(
          column: $state.table.counterType,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnFilters<String> get targetCounts => $state.composableBuilder(
      column: $state.table.targetCounts,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get memoContent => $state.composableBuilder(
      column: $state.table.memoContent,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isAchieved => $state.composableBuilder(
      column: $state.table.isAchieved,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get routineId => $state.composableBuilder(
      column: $state.table.routineId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ExercisesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ExercisesTable> {
  $$ExercisesTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get videoExists => $state.composableBuilder(
      column: $state.table.videoExists,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get videoURL => $state.composableBuilder(
      column: $state.table.videoURL,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get counterType => $state.composableBuilder(
      column: $state.table.counterType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get targetCounts => $state.composableBuilder(
      column: $state.table.targetCounts,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get memoContent => $state.composableBuilder(
      column: $state.table.memoContent,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isAchieved => $state.composableBuilder(
      column: $state.table.isAchieved,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get routineId => $state.composableBuilder(
      column: $state.table.routineId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$ExercisesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ExercisesTable,
    Exercise,
    $$ExercisesTableFilterComposer,
    $$ExercisesTableOrderingComposer,
    $$ExercisesTableCreateCompanionBuilder,
    $$ExercisesTableUpdateCompanionBuilder,
    (Exercise, BaseReferences<_$AppDatabase, $ExercisesTable, Exercise>),
    Exercise,
    PrefetchHooks Function()> {
  $$ExercisesTableTableManager(_$AppDatabase db, $ExercisesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ExercisesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ExercisesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<bool> videoExists = const Value.absent(),
            Value<String?> videoURL = const Value.absent(),
            Value<CounterType> counterType = const Value.absent(),
            Value<String?> targetCounts = const Value.absent(),
            Value<String?> memoContent = const Value.absent(),
            Value<bool> isAchieved = const Value.absent(),
            Value<String> routineId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ExercisesCompanion(
            id: id,
            title: title,
            videoExists: videoExists,
            videoURL: videoURL,
            counterType: counterType,
            targetCounts: targetCounts,
            memoContent: memoContent,
            isAchieved: isAchieved,
            routineId: routineId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            required bool videoExists,
            Value<String?> videoURL = const Value.absent(),
            required CounterType counterType,
            Value<String?> targetCounts = const Value.absent(),
            Value<String?> memoContent = const Value.absent(),
            Value<bool> isAchieved = const Value.absent(),
            required String routineId,
            Value<int> rowid = const Value.absent(),
          }) =>
              ExercisesCompanion.insert(
            id: id,
            title: title,
            videoExists: videoExists,
            videoURL: videoURL,
            counterType: counterType,
            targetCounts: targetCounts,
            memoContent: memoContent,
            isAchieved: isAchieved,
            routineId: routineId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ExercisesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ExercisesTable,
    Exercise,
    $$ExercisesTableFilterComposer,
    $$ExercisesTableOrderingComposer,
    $$ExercisesTableCreateCompanionBuilder,
    $$ExercisesTableUpdateCompanionBuilder,
    (Exercise, BaseReferences<_$AppDatabase, $ExercisesTable, Exercise>),
    Exercise,
    PrefetchHooks Function()>;
typedef $$RoutinesTableCreateCompanionBuilder = RoutinesCompanion Function({
  required String id,
  required String title,
  Value<int> rowid,
});
typedef $$RoutinesTableUpdateCompanionBuilder = RoutinesCompanion Function({
  Value<String> id,
  Value<String> title,
  Value<int> rowid,
});

class $$RoutinesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $RoutinesTable> {
  $$RoutinesTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$RoutinesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $RoutinesTable> {
  $$RoutinesTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$RoutinesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RoutinesTable,
    Routine,
    $$RoutinesTableFilterComposer,
    $$RoutinesTableOrderingComposer,
    $$RoutinesTableCreateCompanionBuilder,
    $$RoutinesTableUpdateCompanionBuilder,
    (Routine, BaseReferences<_$AppDatabase, $RoutinesTable, Routine>),
    Routine,
    PrefetchHooks Function()> {
  $$RoutinesTableTableManager(_$AppDatabase db, $RoutinesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$RoutinesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$RoutinesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RoutinesCompanion(
            id: id,
            title: title,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            Value<int> rowid = const Value.absent(),
          }) =>
              RoutinesCompanion.insert(
            id: id,
            title: title,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$RoutinesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RoutinesTable,
    Routine,
    $$RoutinesTableFilterComposer,
    $$RoutinesTableOrderingComposer,
    $$RoutinesTableCreateCompanionBuilder,
    $$RoutinesTableUpdateCompanionBuilder,
    (Routine, BaseReferences<_$AppDatabase, $RoutinesTable, Routine>),
    Routine,
    PrefetchHooks Function()>;
typedef $$RecordsTableCreateCompanionBuilder = RecordsCompanion Function({
  required String id,
  required DateTime date,
  required String routineTitle,
  required String exerciseTitle,
  required CounterType counterType,
  Value<String?> achievementCounts,
  Value<int> rowid,
});
typedef $$RecordsTableUpdateCompanionBuilder = RecordsCompanion Function({
  Value<String> id,
  Value<DateTime> date,
  Value<String> routineTitle,
  Value<String> exerciseTitle,
  Value<CounterType> counterType,
  Value<String?> achievementCounts,
  Value<int> rowid,
});

class $$RecordsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $RecordsTable> {
  $$RecordsTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get routineTitle => $state.composableBuilder(
      column: $state.table.routineTitle,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get exerciseTitle => $state.composableBuilder(
      column: $state.table.exerciseTitle,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<CounterType, CounterType, String>
      get counterType => $state.composableBuilder(
          column: $state.table.counterType,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnFilters<String> get achievementCounts => $state.composableBuilder(
      column: $state.table.achievementCounts,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$RecordsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $RecordsTable> {
  $$RecordsTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get routineTitle => $state.composableBuilder(
      column: $state.table.routineTitle,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get exerciseTitle => $state.composableBuilder(
      column: $state.table.exerciseTitle,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get counterType => $state.composableBuilder(
      column: $state.table.counterType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get achievementCounts => $state.composableBuilder(
      column: $state.table.achievementCounts,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$RecordsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RecordsTable,
    Record,
    $$RecordsTableFilterComposer,
    $$RecordsTableOrderingComposer,
    $$RecordsTableCreateCompanionBuilder,
    $$RecordsTableUpdateCompanionBuilder,
    (Record, BaseReferences<_$AppDatabase, $RecordsTable, Record>),
    Record,
    PrefetchHooks Function()> {
  $$RecordsTableTableManager(_$AppDatabase db, $RecordsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$RecordsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$RecordsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<String> routineTitle = const Value.absent(),
            Value<String> exerciseTitle = const Value.absent(),
            Value<CounterType> counterType = const Value.absent(),
            Value<String?> achievementCounts = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RecordsCompanion(
            id: id,
            date: date,
            routineTitle: routineTitle,
            exerciseTitle: exerciseTitle,
            counterType: counterType,
            achievementCounts: achievementCounts,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required DateTime date,
            required String routineTitle,
            required String exerciseTitle,
            required CounterType counterType,
            Value<String?> achievementCounts = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RecordsCompanion.insert(
            id: id,
            date: date,
            routineTitle: routineTitle,
            exerciseTitle: exerciseTitle,
            counterType: counterType,
            achievementCounts: achievementCounts,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$RecordsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RecordsTable,
    Record,
    $$RecordsTableFilterComposer,
    $$RecordsTableOrderingComposer,
    $$RecordsTableCreateCompanionBuilder,
    $$RecordsTableUpdateCompanionBuilder,
    (Record, BaseReferences<_$AppDatabase, $RecordsTable, Record>),
    Record,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ExercisesTableTableManager get exercises =>
      $$ExercisesTableTableManager(_db, _db.exercises);
  $$RoutinesTableTableManager get routines =>
      $$RoutinesTableTableManager(_db, _db.routines);
  $$RecordsTableTableManager get records =>
      $$RecordsTableTableManager(_db, _db.records);
}
