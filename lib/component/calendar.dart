import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:routin_e/const/colors.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
  final OnDaySelected onDaySelected;
  final DateTime selectedDate;

  Calendar({
    required this.onDaySelected,
    required this.selectedDate
});

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      onDaySelected: onDaySelected, //날짜 선택시 실행되는 외부 함수 -> record_screen으로 이어지며, state를 갱신하는 로직을 작성해두었다..
      // 선택된 날짜 찾기
      selectedDayPredicate: (day) {return isSameDay(selectedDate, day);},
      focusedDay: DateTime.now(),
      // 기본적으로 집중되는 날짜 : 오늘
      firstDay: DateTime(2010, 1, 1),
      // 2010년부터 조회 가능
      lastDay: DateTime(2100, 12, 31),
      // 2100년까지 조회 가능
      headerStyle: HeaderStyle(
          titleCentered: true,
          formatButtonVisible: false,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16.0,
          )),
      locale: 'ko_KR',
      calendarStyle: CalendarStyle(
        selectedDecoration: BoxDecoration( // 선택된 날짜는 주황색으로 표시해주기
            color: ORANGE_COLOR,
            shape: BoxShape.circle
        ),

        //Today Box & Text
        todayDecoration: BoxDecoration( // 오늘 날짜는 인지할 수 있게 주황테두리만
            border: Border.all(
                color: ORANGE_COLOR,
                width: 1.0
            ),
            shape: BoxShape.circle
        ),
        todayTextStyle: TextStyle(color: Colors.black),
        // selectedTextStyle: TextStyle(color: Colors.white),
      ),
      // defaultTextStyle: TextStyle(

      // ),
    );
  }
}
