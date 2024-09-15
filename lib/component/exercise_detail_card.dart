import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routin_e/component/custom_youtube_player.dart';
import 'package:routin_e/model/counter_type.dart';
import 'package:routin_e/state/exercise_dual_state.dart';
import 'package:routin_e/state/exercise_single_state.dart';

import '../database/drift_database.dart';
import '../model/exercise_model.dart';
import 'counter.dart';
import 'custom_text_field.dart';

class ExerciseDetailCard extends StatelessWidget {
  final Exercise exercise;

  const ExerciseDetailCard({
    required this.exercise,
    super.key,
  });

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
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            exercise.title,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
          ),
          if (exercise.videoExists)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomYoutubePlayer(
                videoTitle: exercise.title,
                videoURL: exercise.videoURL,
              ),
            ),
          if (exercise.counterType == CounterType.isDual)
            _buildDualCounter(context, jsonToIntList(exercise.targetCounts))
          else if (exercise.counterType != CounterType.noCounter)
            _buildSingleCounter(context, jsonToInt(exercise.targetCounts)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '메모',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                CustomTextField(
                  inputType: TextInputType.text,
                  width: double.infinity,
                  maxLines: 5,
                  hintText: "해당 운동에 대한 정보를 메모하세요.",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildSingleCounter(BuildContext context, int targetCount) {
  final exerciseSingleState = Provider.of<ExerciseSingleState>(context);

  return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '목표 ${targetCount}회',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black45, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Counter(
              width: double.infinity,
              height: 300,
              countNumber: exerciseSingleState.count,
              backgroundColor: exerciseSingleState.backgroundColor,
              targetCount: targetCount ?? 0,
              onLongPress: exerciseSingleState.resetCounter,
              onTap: exerciseSingleState.incrementCounter,
            ),
          ),
        ],
      ),
  );
}

Widget _buildDualCounter(BuildContext context, List<int> targetCounts) {
  final exerciseDualState = Provider.of<ExerciseDualState>(context);

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '목표 ${targetCounts}회',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black45, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Counter(
                      width: double.infinity,
                      height: 300,
                      countNumber: exerciseDualState.counts[0],
                      targetCount: targetCounts?[0] ?? 0,
                      backgroundColor: exerciseDualState.backgroundColors[0],
                      onLongPress: exerciseDualState.resetFirstCounter,
                      onTap: exerciseDualState.incrementFirstCounter,
                      borderTopRight: 0,
                      borderBottomRight: 0,
                    ),
                  ),
                  Expanded(
                    child: Counter(
                      width: double.infinity,
                      height: 300,
                      countNumber: exerciseDualState.counts[1],
                      targetCount: targetCounts?[1] ?? 0,
                      backgroundColor: exerciseDualState.backgroundColors[1],
                      onLongPress: exerciseDualState.resetSecondCounter,
                      onTap: exerciseDualState.incrementSecondCounter,
                      borderTopLeft: 0,
                      borderBottomLeft: 0,
                    ),
                  ),
                ],
              ),
              Container(
                width: 1,
                height: 68,
                color: Colors.black45,
              ),
            ],
          )
        ),
      ],
    ),
  );
}

/*String jsonToStringList(String? jsonList) {
  if (jsonList == null) {
    return "";
  } else {
    List<int> parts = List<int>.from(jsonDecode(jsonList));
    return parts.map((e) => e.toString()).join('/');
  }
}*/
