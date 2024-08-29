import 'package:drift/drift.dart';
import '../drift_database.dart';

part 'routine_dao.g.dart';

@DriftAccessor(tables: [Routines])
class RoutineDao extends DatabaseAccessor<AppDatabase> with _$RoutineDaoMixin {
  final AppDatabase db;
  RoutineDao(this.db) : super(db);

  // 새로운 Routine 추가
  Future<int> insertRoutine(RoutinesCompanion routine) => into(routines).insert(routine);

  // Routine 가져오기
  Future<Routine?> getRoutineById(String id) {
    return (select(routines)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  // 모든 Routine 가져오기
  Future<List<Routine>> getAllRoutines() => select(routines).get();

  // Routine 삭제
  Future<int> deleteRoutineById(String id) {
    return (delete(routines)..where((tbl) => tbl.id.equals(id))).go();
  }

  // Routine 업데이트
  Future<bool> updateRoutine(Routine routine) => update(routines).replace(routine);
}
