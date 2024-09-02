import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:routin_e/component/excercise_card.dart';
import '../component/calendar.dart';
import '../component/routine_record.dart';
import '../database/dao/record_dao.dart';
import '../database/drift_database.dart';

class RecordScreen extends StatefulWidget {
  const RecordScreen({super.key});

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  //선택된 날짜는 이제 여기서는 selectedDate로 관리할 것임
  DateTime selectedDate = DateTime.utc(
      DateTime.now().year, DateTime.now().month, DateTime.now().day);
  List<Routine> records = [];
  late final RecordDao _recordDao;

  @override
  void initState() {
    super.initState();
    _recordDao = GetIt.I<RecordDao>();
  }

  Widget build(BuildContext context) {
    return Column(children: [
      Calendar(
        selectedDate: selectedDate,
        onDaySelected: onDaySelected,
      ),
      FutureBuilder(
          future: _recordDao.getRecordsByDate(selectedDate),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('기록이 없습니다.'));
            } else {
              return Center(child: Text('내일채우기'));
            }
          }),
    ]);
  }

  void onDaySelected(DateTime touchedDate, DateTime focusedDate) {
    setState(() {
      this.selectedDate = touchedDate; // selectedDate는 터치된 날짜로 설정할 것
    });
  }
}
