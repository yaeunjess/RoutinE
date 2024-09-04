import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:routin_e/component/routine_card.dart';
import 'package:routin_e/model/counter_type.dart';
import 'package:routin_e/screen/routine_detail_screen.dart';

import '../database/dao/exercise_dao.dart';
import '../database/dao/routine_dao.dart';
import '../database/drift_database.dart';

class RoutineScreen extends StatefulWidget {
  const RoutineScreen({super.key});

  @override
  State<RoutineScreen> createState() => _RoutineScreenState();
}

class _RoutineScreenState extends State<RoutineScreen> {
  late final RoutineDao _routineDao;
  late final ExerciseDao _exerciseDao;

  @override
  void initState() {
    super.initState();
    _routineDao = GetIt.I<RoutineDao>();
    _exerciseDao = GetIt.I<ExerciseDao>();
  }

  Future<Map<Routine, List<Exercise>>> _fetchRoutinesWithExercises() async {
    final routines = await _routineDao.getAllRoutines();
    final Map<Routine, List<Exercise>> routineExercises = {};

    for (final routine in routines) {
      final exercises = await _exerciseDao.getExercisesByRoutineId(routine.id);
      routineExercises[routine] = exercises;
    }

    return routineExercises;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<Routine, List<Exercise>>>(
      future: _fetchRoutinesWithExercises(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('운동 목록이 없습니다.'));
        } else {
          final routineExercises = snapshot.data!;

          return ListView.builder(
              // physics: AlwaysScrollableScrollPhysics(),
              itemCount: routineExercises.length,
              itemBuilder: (context, index) {
                final routine = routineExercises.keys.elementAt(index);
                final exercises = routineExercises[routine]!;
                final exerciseTitles =
                    exercises.map((exercise) => exercise.title).toList();

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RoutineCard(
                    routineTitle: routine.title,
                    exerciseTitles: exerciseTitles,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RoutineDetailScreen(
                            routineTitle: routine.title,
                            exercises: exercises,
                          ),
                        ),
                      );
                    },
                  ),
                );
              });
        }
      },
    );
  }
}
