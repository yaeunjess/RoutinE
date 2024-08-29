import 'package:drift/drift.dart';
import '../drift_database.dart';

part 'record_dao.g.dart';

@DriftAccessor(tables: [Records])
class RecordDao extends DatabaseAccessor<AppDatabase> with _$RecordDaoMixin {
  final AppDatabase db;
  RecordDao(this.db) : super(db);

  // 새로운 Record 추가
  Future<int> insertRecord(RecordsCompanion record) => into(records).insert(record);

  // Record 가져오기
  Future<Record?> getRecordById(String id) {
    return (select(records)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  // 모든 Record 가져오기
  // Future<List<Record>> getAllRecords() => select(records).get();

  // 특정 날짜에 해당하는 Record 가져오기
  Future<List<Record>> getRecordsByDate(DateTime date) {
    return (select(records)
      ..where((tbl) => tbl.date.equals(date))
    ).get();
  }

  // 특정 날짜에 해당하는 Record Length 가져오기 : 캘린더에 색상 표기를 위함
  Future<int> getRecordLengthByDate(DateTime date) {
    return (select(records)
      ..where((tbl) => tbl.date.equals(date))
    ).get().then((result) => result.length);
  }


  // Record 삭제
  Future<int> deleteRecordById(String id) {
    return (delete(records)..where((tbl) => tbl.id.equals(id))).go();
  }

  // Record 업데이트
  Future<bool> updateRecord(Record record) => update(records).replace(record);
}
