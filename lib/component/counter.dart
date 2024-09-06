import 'package:flutter/material.dart';

import '../const/colors.dart';

// 카운터(단일)의 매개변수 :
// 1) targetExists(필수) : 목표가 있는가 -> 목표 text를 표기하기 위함
// 2) target(필수x, 기본값 0) : 목표가 몇 개인가 -> _countNumber를 초과하면
// 3) fontSize (필수x, 기본값 150.0) : 타이머 유형에 따라 글자 크기가 조정하기 위함
class Counter extends StatefulWidget {
  final bool targetExists;
  final int target;
  final double fontSize;

  const Counter({super.key, required this.targetExists, this.target = 0, this.fontSize = 150.0});

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
        //targetExists = false일 때  color 처리해주기
        color: _countNumber >= _target ? BLUE_COLOR : Colors.transparent,
        child: Center(
          child: Column(
            children: [
              Text("${_countNumber}", style: TextStyle(fontWeight: FontWeight.w800, fontSize: widget.fontSize)),
            ],
          ),
        ),
      ),
      onLongPress: setCountToTarget,
      onTap: increaseCount,

    );
  }

  void setCountToTarget() {
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
