import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:routin_e/component/custom_youtube_player.dart';

import '../database/drift_database.dart';
import 'counter.dart';
import 'custom_text_field.dart';

class ExerciseDetailCard extends StatelessWidget {
  final Exercise exercise;

  const ExerciseDetailCard({
    required this.exercise,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomYoutubePlayer(
            videoTitle: exercise.title,
            videoURL: exercise.videoURL,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '목표 ${exercise.targetCounts}회',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Counter(
                  width: double.infinity,
                  height: 300,
                  targetExists: true,
                  target: 20,
                ),
              ],
            ),
          ),
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
