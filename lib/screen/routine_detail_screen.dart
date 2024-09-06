import 'package:flutter/material.dart';
import 'package:routin_e/component/exercise_detail_card.dart';
import 'package:routin_e/database/drift_database.dart';

import '../const/colors.dart';

class RoutineDetailScreen extends StatefulWidget {
  final String routineTitle;
  final List<Exercise> exercises;

  const RoutineDetailScreen({
    required this.routineTitle,
    required this.exercises,
    super.key,
  });

  @override
  State<RoutineDetailScreen> createState() => _RoutineDetailScreenState();
}

class _RoutineDetailScreenState extends State<RoutineDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: ORANGE_COLOR,
          title: Text(widget.routineTitle, style: TextStyle(color: ORANGE_COLOR, fontSize: 24.0, fontWeight: FontWeight.w600),),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: widget.exercises.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ExerciseDetailCard(exercise: widget.exercises[index]),
                    );
                  },
                ),
              ),
            ],
          )
        )
    );
  }
}
