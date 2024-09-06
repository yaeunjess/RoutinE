import 'package:routin_e/component/counter.dart';
import 'package:routin_e/model/counter_type.dart';
import 'package:routin_e/model/exercise_model.dart';

class RecordModel{
  final String id;  // primary key
  final DateTime date;
  final String routineTitle;
  final String tempRoutineId; // foreign key
  final String exerciseTitle;
  final CounterType counterType;
  final List<int>? achievementCounts;
  // countertype, 완료counts, title

  RecordModel({
    required this.id,
    required this.date,
    required this.routineTitle,
    required this.tempRoutineId,
    required this.exerciseTitle,
    required this.counterType,
    this.achievementCounts,
  });

  RecordModel copyWith({
    String? id,
    DateTime? date,
    String? routineTitle,
    String? tempRoutineId,
    String? exerciseTitle,
    CounterType? counterType,
    List<int>? achievementCounts,
  }) {
    return RecordModel(
      id: id ?? this.id,
      date: date ?? this.date,
      routineTitle: routineTitle ?? this.routineTitle,
      tempRoutineId : tempRoutineId ?? this.tempRoutineId,
      exerciseTitle: exerciseTitle ?? this.exerciseTitle,
      counterType: counterType ?? this.counterType,
      achievementCounts: achievementCounts ?? this.achievementCounts,
    );
  }
}