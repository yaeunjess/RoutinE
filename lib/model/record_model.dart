import 'package:routin_e/model/counter_type.dart';

class RecordModel{
  final String id;  // primary key
  final DateTime date;
  final String routineTitle;
  final String exerciseTitle;
  final CounterType counterType;
  final List<int>? achievementCounts;

  RecordModel({
    required this.id,
    required this.date,
    required this.routineTitle,
    required this.exerciseTitle,
    required this.counterType,
    this.achievementCounts,
  });

  RecordModel copyWith({
    String? id,
    DateTime? date,
    String? routineTitle,
    String? exerciseTitle,
    CounterType? counterType,
    List<int>? achievementCounts,
  }) {
    return RecordModel(
      id: id ?? this.id,
      date: date ?? this.date,
      routineTitle: routineTitle ?? this.routineTitle,
      exerciseTitle: exerciseTitle ?? this.exerciseTitle,
      counterType: counterType ?? this.counterType,
      achievementCounts: achievementCounts ?? this.achievementCounts,
    );
  }
}