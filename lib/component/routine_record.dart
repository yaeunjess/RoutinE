import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:routin_e/database/drift_database.dart';
import '../database/dao/record_dao.dart';
import 'excercise_card.dart';
import 'package:routin_e/repository/record_repository.dart';

class RoutineRecord extends StatelessWidget {
  final String tempRoutineId;
  final List<Record> recordList;

  RoutineRecord(
      {super.key, required this.tempRoutineId, required this.recordList});

  @override
  Widget build(BuildContext context) {
    //futurebuilder역할 stateless 에서 비동기작업 처리
    List<Record> exerciesRecordList =
        fetchExercisesByTempRoutineId(tempRoutineId, recordList);
    final List<Widget> exerciseNameCountsList =
        exerciesRecordList.map((record) {
      final exerciseNameCounts = fetchExerciseNameCounts(record);
      return ExerciseCard(
        content: exerciseNameCounts.keys.first,
        count: exerciseNameCounts.values.first,
      );
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
              child: Text("등운동"),
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal, // 수평 스크롤 설정
          child: Row(
            children: exerciseNameCountsList,
          ),
        ),
      ],
    );
  }
}
