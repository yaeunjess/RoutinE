import 'package:routin_e/model/counter_type.dart';

class ExerciseModel {
  final String id;  // primary key
  final String title; // 이름
  final bool isAchieved; // 완료 여부 : record에 남기기 위해선 true여야함
  final bool videoExists;
  final String? videoURL;
  final CounterType counterType;
  final List<int>? targetCounts;
  final String? memoContent;
  final String routineId;  // foreign key

  ExerciseModel({
    required this.id,
    required this.title,
    required this.videoExists,
    this.videoURL,
    required this.counterType,
    this.targetCounts,
    this.memoContent,
    this.isAchieved = false,
    required this.routineId,
  });

  ExerciseModel copyWith({
    String? id,
    String? title,
    bool? videoExists,
    String? videoURL,
    CounterType? counterType,
    List<int>? targetCounts,
    String? memoContent,
    bool? isAchieved,
    String? routineId,
  }) {
    return ExerciseModel(
      id: id ?? this.id,
      title: title ?? this.title,
      videoExists: videoExists ?? this.videoExists,
      videoURL: videoURL ?? this.videoURL,
      counterType: counterType ?? this.counterType,
      targetCounts: targetCounts ?? this.targetCounts,
      memoContent: memoContent ?? this.memoContent,
      isAchieved: isAchieved ?? this.isAchieved,
      routineId: routineId ?? this.routineId,
    );
  }
}