import 'package:flutter/material.dart';
import 'package:routin_e/component/exercise_detail_card.dart';
import 'package:routin_e/database/drift_database.dart';

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
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Text(
                widget.routineTitle,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
              ),
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
