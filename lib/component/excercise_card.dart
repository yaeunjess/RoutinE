import 'package:flutter/material.dart';

import '../const/colors.dart';

class ExerciseCard extends StatelessWidget {
  final cardColor;
  final width;
  final height;
  final content;
  final count;

  // 생성자에서 매개변수를 받아옴
  const ExerciseCard({
    super.key,
    this.cardColor = BEIGE_COLOR,
    this.width = 140.0,
    this.height = 44.0,
    this.content = "티바로우",
    this.count = "20회"
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: BEIGE_COLOR,
            borderRadius: BorderRadius.circular(8.0)
        ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${content}'),
          SizedBox(width:40.0),
          Text('${count}')
        ],
      ),
      )
    );
  }
}