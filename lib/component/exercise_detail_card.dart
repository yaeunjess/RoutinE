import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:routin_e/component/custom_youtube_player.dart';
import 'package:routin_e/model/counter_type.dart';

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
          if (exercise.counterType != CounterType.noCounter)
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
                  if (exercise.counterType == CounterType.isDual)
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black45, style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Counter(
                              width: double.infinity,
                              height: 300,
                              targetExists: true,
                              target: 20,
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 68,
                            color: Colors.black45,
                          ),
                          Expanded(
                            child: Counter(
                              width: double.infinity,
                              height: 300,
                              targetExists: true,
                              target: 20,
                            ),
                          ),
                        ],
                      ),
                    )
                  else
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black45, style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Counter(
                        width: double.infinity,
                        height: 300,
                        targetExists: true,
                        target: 20,
                      ),
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
