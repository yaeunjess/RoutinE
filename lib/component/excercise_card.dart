import 'package:flutter/material.dart';
import '../const/colors.dart';

class ExerciseCard extends StatelessWidget {
  final cardColor;
  final height;
  final content;
  List<int> count;

  // 생성자에서 매개변수를 받아옴
  ExerciseCard({
    super.key,
    this.cardColor = BEIGE_COLOR,
    this.height = 44.0,
    required this.content,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.0),
        child:IntrinsicWidth(
            child: Container(
              height: height,
              decoration: BoxDecoration(
                  color: BEIGE_COLOR, borderRadius: BorderRadius.circular(8.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // 양 끝으로 정렬
                children: [
                  // 왼쪽 텍스트에만 좌측 패딩 추가
                  Padding(
                    padding: EdgeInsets.only(left: 16.0), // 왼쪽에 16px 패딩 추가
                    child: Text('$content'),
                  ),
                  // 오른쪽 텍스트에만 우측 패딩 추가
                  SizedBox(width: 20.0),
                  Padding(
                    padding: EdgeInsets.only(right: 16.0), // 오른쪽에 16px 패딩 추가
                    child: Text(count.map((e) => e.toString()).join(' / ')),
                  ),
                ],
              ),
            )
        ));
  }
}
