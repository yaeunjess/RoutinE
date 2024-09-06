import 'package:get_it/get_it.dart';
import 'package:routin_e/database/dao/record_dao.dart';
import 'package:routin_e/database/drift_database.dart';
import 'dart:convert';

// Record에 대한 값

// 날짜에 해당하는 루틴 기록id(tempRoutineId)를 불러오기
  Set<String> fetchRoutineIdsByDate(DateTime selectedDate, List<Record> recordsByDate) {
    return recordsByDate.map((record) => record.tempRoutineId).toSet();
  }

//tempRoutineId에 따른 record 찾기
  List<Record> fetchExercisesByTempRoutineId(
      String tempRoutineId, List<Record> recordList) {
    final filteredRecordsByTempRoutineId = recordList.where((record) => record.tempRoutineId == tempRoutineId)
        .toList();
    return filteredRecordsByTempRoutineId;
  }

//Exercise 이름과 횟수 Map으로 만들기
  Map<String, List<int>> fetchExerciseNameCounts(Record record) {
    final String title = record.exerciseTitle;
    String? counts = record.achievementCounts; // String? 타입의 counts

    if (counts == null || counts.isEmpty) {
      counts = '[]';
    }

    List<int> intList = (json.decode(counts) as List<dynamic>)
        .map((item) => item as int)
        .toList();

    return {title: intList};
  }

