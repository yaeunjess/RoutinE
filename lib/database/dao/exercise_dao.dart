import 'package:drift/drift.dart';
import '../drift_database.dart';

part 'exercise_dao.g.dart';

@DriftAccessor(tables: [Exercises])
class ExerciseDao extends DatabaseAccessor<AppDatabase> with _$ExerciseDaoMixin {
  final AppDatabase db;
  ExerciseDao(this.db) : super(db);

  // 새로운 Exercise 추가
  Future<int> insertExercise(ExercisesCompanion exercise) => into(exercises).insert(exercise);

  // Exercise 가져오기
  Future<Exercise?> getExerciseById(String id) {
    return (select(exercises)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  // 모든 Exercise 가져오기
  // Future<List<Exercise>> getAllExercises() => select(exercises).get();

  // 특정 Routine에 속하는 Exercise들 가져오기
  Future<List<Exercise>> getExercisesByRoutineId(String routineId) {
    return (select(exercises)..where((tbl) => tbl.routineId.equals(routineId))).get();
  }

  // Exercise 삭제
  Future<int> deleteExerciseById(String id) {
    return (delete(exercises)..where((tbl) => tbl.id.equals(id))).go();
  }

  // Exercise 업데이트
  Future<bool> updateExercise(Exercise exercise) => update(exercises).replace(exercise);
}
