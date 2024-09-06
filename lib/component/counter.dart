import 'package:flutter/material.dart';

import '../const/colors.dart';

// 카운터(단일)의 매개변수 :
// 1) targetExists(필수) : 목표가 있는가 -> 목표 text를 표기하기 위함
// 2) target(필수x, 기본값 0) : 목표가 몇 개인가 -> _countNumber를 초과하면
// 3) fontSize (필수x, 기본값 150.0) : 타이머 유형에 따라 글자 크기가 조정하기 위함
class Counter extends StatefulWidget {
  final double width;
  final double height;
  final bool targetExists;
  final int target;


  const Counter({
    super.key,
    required this.width,
    required this.height,
    required this.targetExists,
    this.target = 0,
  });


  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _countNumber = 0;
  late int _target;

  @override
  void initState() {
    super.initState();
    _target = widget.target;
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: _countNumber >= _target ? BLUE_COLOR : Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "${_countNumber}",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 124.0,
                color: _countNumber >= _target ? Colors.white : Colors.black,
              ),
            ),
            Text(
              "꾹 누르면 0으로 초기화 됩니다.",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12.0,
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ),
      onLongPress: setCountToZero,
      onTap: increaseCount,
    );
  }

  void setCountToZero() {
    setState(() {
      _countNumber = 0;
    });
  }

  void increaseCount() {
    setState(() {
      _countNumber += 1;
    });
  }
}
