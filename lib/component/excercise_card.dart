import 'package:flutter/material.dart';

import '../const/colors.dart';

class ExerciseCard extends StatelessWidget {
   final cardColor;

  // 생성자에서 매개변수를 받아옴
  const ExerciseCard({
    super.key,
    this.cardColor = BEIGE_COLOR,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Container(
      width: 192,
      height: 44,
      color: BEIGE_COLOR, // 예시로 색상을 지정
    );
  }
}
