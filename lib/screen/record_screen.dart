import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:routin_e/component/excercise_card.dart';
import '../component/calendar.dart';
import '../component/routine_record.dart';
import '../database/dao/record_dao.dart';
import '../repository/record_repository.dart';
import '../database/drift_database.dart';


class RecordScreen extends StatefulWidget {
  const RecordScreen({super.key});

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  // 선택된 날짜는 이제 여기서는 selectedDate로 관리할 것임
  DateTime selectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  late RecordDao recordDao;

  @override
  void initState() {
    super.initState();
    recordDao = GetIt.I<RecordDao>();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Calendar(
          selectedDate: selectedDate,
          onDaySelected: onDaySelected,
        ),
        FutureBuilder<List<Record>>(
          future: recordDao.getRecordsByDate(DateTime(selectedDate.year, selectedDate.month, selectedDate.day)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator()); // 로딩 중
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}')); // 오류 발생 시 처리
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No exercises found.')); // 데이터가 없을 때 처리
            }

            final recordsByDate = snapshot.data!; // 데이터가 있을 경우 List<Record>를 가져옴
            // 만약에 데이터가 없을 경우 어떻게 됨..??? null 처리에 대해 알아보기
            final Set<String> routineIdsList = fetchRoutineIdsByDate(selectedDate, recordsByDate);
            return Column(
              // 반복문
              children: routineIdsList.map((routineId) {
                return RoutineRecord(
                  tempRoutineId: routineId,
                  recordList: recordsByDate,
                );
              }).toList(),
            );
          },
        ),

      ],
    );
  }

  // 날짜 선택 시 호출되는 메서드
  void onDaySelected(DateTime touchedDate, DateTime focusedDate) {
    setState(() {
      selectedDate = touchedDate; // 선택된 날짜를 업데이트
      // 새로운 날짜에 따라 recordList도 새로 로드할 수 있음
      recordDao = GetIt.I<RecordDao>();
    });
  }
}
