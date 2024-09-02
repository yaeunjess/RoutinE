import 'package:flutter/material.dart';
import 'package:flutter/src/gestures/long_press.dart';

import '../const/colors.dart';

// 카운터(단일)의 매개변수 :
// 1) targetExists(필수) : 목표가 있는가 -> 목표 text를 표기하기 위함
// 2) target(필수x, 기본값 0) : 목표가 몇 개인가 -> _countNumber를 초과하면
class Counter extends StatefulWidget {
  final bool targetExists;
  final int target;

  const Counter({super.key, required this.targetExists, this.target = 0});

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
        color: _countNumber >= _target ? BLUE_COLOR : Colors.transparent,
        child: Center(
          child: Column(
            children: [
              if (widget.targetExists) Text("목표: ${_target}회", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20.0)),
              Text("${_countNumber}", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 150.0)),
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
      if (_countNumber < _target) _countNumber = _target;
    });
  }

  void increaseCount() {
    setState(() {
      _countNumber += 1;
    });
  }

}
