import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:routin_e/const/colors.dart';

class ExerciseSingleState with ChangeNotifier {
  int count;
  int targetCount;
  Color backgroundColor;
  String memo;

  ExerciseSingleState({
    required this.count,
    required this.targetCount,
    this.backgroundColor = Colors.white,
    required this.memo,
  });

  void incrementCounter() {
    count++;
    _updateBackgroundColor();
    notifyListeners();
  }

  void resetCounter(){
    count = 0;
    _updateBackgroundColor();
    notifyListeners();
  }

  void updateMemo(String newMemo) {
    memo = newMemo;
    notifyListeners();
  }

  void _updateBackgroundColor(){
    if(count >= targetCount){
      backgroundColor = BLUE_COLOR;
    } else{
      backgroundColor = Colors.white;
    }
  }
}