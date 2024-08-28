import 'package:flutter/material.dart';
import 'excercise_card.dart';
class RoutineRecord extends StatelessWidget {
  RoutineRecord({super.key});

  final ExerciseCardList = [
    ExerciseCard(),
    ExerciseCard(),
    ExerciseCard(),
    ExerciseCard(),
    ExerciseCard()
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: [Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
          child:Text("등운동"))]),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: ExerciseCardList,
        ),
      )
    ]);
  }
}