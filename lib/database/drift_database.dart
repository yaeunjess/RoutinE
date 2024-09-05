import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:uuid/uuid.dart';

import '../model/counter_type.dart';

part 'drift_database.g.dart';

// Exercise 테이블 정의
class Exercises extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  BoolColumn get videoExists => boolean()();
  TextColumn get videoURL => text().nullable()();
  TextColumn get counterType => textEnum<CounterType>()();
  TextColumn get targetCounts => text().nullable()();
  TextColumn get memoContent => text().nullable()();
  BoolColumn get isAchieved => boolean().withDefault(const Constant(false))();
  TextColumn get routineId => text()();

  @override
  Set<Column> get primaryKey => {id};
}

// Routine 테이블 정의
class Routines extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();

  @override
  Set<Column> get primaryKey => {id};
}

// Record 테이블 정의
class Records extends Table {
  TextColumn get id => text()();
  DateTimeColumn get date => dateTime()();
  TextColumn get routineTitle => text()();
  TextColumn get tempRoutineId => text()();// add this line
  TextColumn get exerciseTitle => text()();
  TextColumn get counterType => textEnum<CounterType>()();
  TextColumn get achievementCounts => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// DriftDatabase 클래스 정의
@DriftDatabase(tables: [Exercises, Routines, Records])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration =>
      MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();

          final uuid = Uuid();
          final routineId = uuid.v4();

          // Insert Routine
          await into(routines).insert(
            RoutinesCompanion(
              id: Value(routineId),
              title: Value('등 운동'),
            ),
          );

          // Insert Exercises
          await into(exercises).insert(
            ExercisesCompanion(
              id: Value(uuid.v4()),
              title: Value('랫풀다운'),
              videoExists: Value(true),
              videoURL: Value('https://youtu.be/OyAAq3qoGss?si=BM8XVG4PlGeuSOP5'),
              counterType: Value(CounterType.isSingle), // Use enum name
              targetCounts: Value('[20]'),
              memoContent: Value('복압에 힘을 주자!'),
              isAchieved: Value(false),
              routineId: Value(routineId),
            ),
          );

          await into(exercises).insert(
            ExercisesCompanion(
              id: Value(uuid.v4()),
              title: Value('원암덤벨로우'),
              videoExists: Value(true),
              videoURL: Value('https://youtu.be/3lOxL-Ze3kE?si=UvO7gAn4jPNTyQkr'),
              counterType: Value(CounterType.isDual), // Use enum name 에러나면 CounterType.isDual.name 으로 수정하기
              targetCounts: Value('[20, 20]'),
              memoContent: Value('코어에 집중하기!!'),
              isAchieved: Value(false),
              routineId: Value(routineId),
            ),
          );

          // Insert Records
          await into(records).insert(
            RecordsCompanion(
              id: Value(uuid.v4()),
              date: Value(DateTime.now()), // Current date for example
              routineTitle: Value('등 운동'),
              exerciseTitle: Value('랫풀다운'),
              counterType: Value(CounterType.isSingle), // Use enum name 에러나면 CounterType.isSingle.name 으로 수정하기
              achievementCounts: Value('[15]'), // Example counts
            ),
          );

          await into(records).insert(
            RecordsCompanion(
              id: Value(uuid.v4()),
              date: Value(DateTime.now().subtract(Duration(days: 1))), // One day before for example
              routineTitle: Value('등 운동'),
              exerciseTitle: Value('원암덤벨로우'),
              counterType: Value(CounterType.isDual), // Use enum name  // 에러 나면 CounterType.isDual.name 으로 수정하기
              achievementCounts: Value('[20, 18]'), // Example counts
            ),
          );
        },
      );
}

// 데이터베이스 연결 설정
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
