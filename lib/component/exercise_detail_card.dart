import 'dart:convert';

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
          if (exercise.counterType != CounterType.noCounter)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '목표 ${jsonToStringList(exercise.targetCounts)}회',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (exercise.counterType == CounterType.isDual)
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black45, style: BorderStyle.solid),
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
                                  targetExists: true,
                                  target: 20,
                                  borderTopRight: 0,
                                  borderBottomRight: 0,
                                ),
                              ),
                              Expanded(
                                child: Counter(
                                  width: double.infinity,
                                  height: 300,
                                  targetExists: true,
                                  target: 20,
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

String jsonToStringList(String? jsonList) {
  if (jsonList == null){
    return "";
  }
  else {
    List<int> parts = List<int>.from(jsonDecode(jsonList));
    return parts.map((e) => e.toString()).join('/');
  }
}
