import 'dart:convert';

import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:routin_e/component/exercise_detail_card.dart';
import 'package:routin_e/database/dao/record_dao.dart';
import 'package:routin_e/screen/routine_screen.dart';
import 'package:routin_e/state/exercise_dual_state.dart';
import 'package:routin_e/state/exercise_single_state.dart';

import '../const/colors.dart';
import '../database/drift_database.dart';
import '../model/counter_type.dart';
import '../model/record_model.dart';

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
  PageController _pageController = PageController();
  int _currentPage = 0;
  late final RecordDao _recordDao;

  @override
  void initState() {
    super.initState();
    _recordDao = GetIt.I<RecordDao>();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<int> jsonToIntList(String? jsonList) {
    if (jsonList == null || jsonList.isEmpty) {
      return [];
    } else {
      try {
        return List<int>.from(jsonDecode(jsonList));
      } catch (e) {
        return [];
      }
    }
  }

  int jsonToInt(String? json) {
    if (json == null || json.isEmpty) {
      return 0;
    } else {
      try {
        List<int> parts = List<int>.from(jsonDecode(json));
        return parts.isNotEmpty ? parts[0] : 0;
      } catch (e) {
        return 0;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: widget.exercises.map((exercise) {
          if (exercise.counterType == CounterType.isDual) {
            return ChangeNotifierProvider(
              key: ValueKey(exercise.title),
              create: (_) =>
                  ExerciseDualState(counts: [0, 0],
                      memo: '',
                      targetCounts: jsonToIntList(exercise.targetCounts)),
            );
          } else {
            return ChangeNotifierProvider(
              key: ValueKey(exercise.title),
              create: (_) =>
                  ExerciseSingleState(count: 0,
                      memo: '',
                      targetCount: jsonToInt(exercise.targetCounts)),
            );
          }
        }).toList(),
        builder: (context, child) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              surfaceTintColor: Colors.white,
              backgroundColor: Colors.white,
              foregroundColor: ORANGE_COLOR,
              title: Text(
                widget.routineTitle,
                style: TextStyle(
                    color: ORANGE_COLOR,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(
                  right: 12.0, left: 12.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        final tempRoutineId = UniqueKey().toString();
                        List<RecordModel> records = [];

                        for (int i = 0; i < widget.exercises.length; i++) {
                          var exercise = widget.exercises[i];

                          if (exercise.counterType == CounterType.isDual) {
                            var exerciseState = Provider.of<ExerciseDualState>(
                                context, listen: false);

                            records.add(
                                RecordModel(
                                  id: UniqueKey().toString(),
                                  date: DateTime.now(),
                                  routineTitle: widget.routineTitle,
                                  tempRoutineId: tempRoutineId,
                                  exerciseTitle: exercise.title,
                                  counterType: exercise.counterType,
                                  achievementCounts: exerciseState.counts,
                                )
                            );
                          } else {
                            var exerciseState = Provider.of<
                                ExerciseSingleState>(context, listen: false);

                            records.add(
                                RecordModel(
                                  id: UniqueKey().toString(),
                                  date: DateTime.now(),
                                  routineTitle: widget.routineTitle,
                                  tempRoutineId: tempRoutineId,
                                  exerciseTitle: exercise.title,
                                  counterType: exercise.counterType,
                                  achievementCounts: [exerciseState.count],
                                )
                            );
                          }
                        }

                        // DB에 records 저장
                        for (var record in records) {
                          final companion = RecordsCompanion(
                            id: Value(record.id),
                            date: Value(record.date),
                            routineTitle: Value(record.routineTitle),
                            tempRoutineId: Value(record.tempRoutineId),
                            exerciseTitle: Value(record.exerciseTitle),
                            counterType: Value(record.counterType),
                            achievementCounts: Value(
                                record.achievementCounts?.toString() ?? '[]'),
                          );

                          // Record를 DB에 삽입
                          await _recordDao.insertRecord(companion);
                        }

                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: GREY_COLOR,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        '완료하기',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: BLUE_COLOR,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        '종료하기',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(widget.exercises.length, (index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 4.0),
                        width: _currentPage == index ? 10.0 : 8.0,
                        height: _currentPage == index ? 10.0 : 8.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentPage == index ? ORANGE_COLOR : Colors
                              .grey,
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 16.0),
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: widget.exercises.length,
                      onPageChanged: (int index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                          ExerciseDetailCard(exercise: widget.exercises[index]),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}
