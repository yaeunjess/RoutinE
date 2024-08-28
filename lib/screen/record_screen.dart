import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:routin_e/component/excercise_card.dart';
import 'package:routin_e/const/colors.dart';
import '../component/calendar.dart';
import '../component/routine_record.dart';

class RecordScreen extends StatefulWidget {
  const RecordScreen({super.key});

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  //선택된 날짜는 이제 여기서는 selectedDate로 관리할 것임
  DateTime selectedDate = DateTime.utc(
      DateTime.now().year, DateTime.now().month, DateTime.now().day);
  final CarouselController _controller = CarouselController();
  final ExerciseCardList = [
    ExerciseCard(),
    ExerciseCard(),
    ExerciseCard(),
    ExerciseCard(),
    ExerciseCard()
  ];

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Column(
        children: [
          Calendar(
            selectedDate: selectedDate,
            onDaySelected: onDaySelected,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 6),
                RoutineRecord(),
                SizedBox(height: 6),
                RoutineRecord(),
                SizedBox(height: 6),
                RoutineRecord(),
                SizedBox(height: 6),
                RoutineRecord(),
                // Add more widgets here
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onDaySelected(DateTime touchedDate, DateTime focusedDate) {
    setState(() {
      this.selectedDate = touchedDate; // selectedDate는 터치된 날짜로 설정할 것
    });
  }
}
