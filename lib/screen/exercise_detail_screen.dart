import 'package:flutter/cupertino.dart';
import 'package:routin_e/model/counter_type.dart';

class ExerciseDetailScreen extends StatefulWidget {
  final CounterType counterType;
  final bool videoExists;

  const ExerciseDetailScreen({
    required this.counterType,
    required this.videoExists,
    super.key,
  });

  @override
  State<ExerciseDetailScreen> createState() => _ExerciseDetailScreenState();
}

class _ExerciseDetailScreenState extends State<ExerciseDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // Youtube Player
          // 목표
          // 메모
        ],
      ),
    );
  }
}
