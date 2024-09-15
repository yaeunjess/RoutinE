import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../const/colors.dart';

class ExerciseDualState with ChangeNotifier{
  List<int> counts;
  List<int> targetCounts;
  List<Color> backgroundColors;
  String memo;

  ExerciseDualState({
    required this.counts,
    required this.targetCounts,
    List<Color>? backgroundColors,  // nullable 리스트로 받기
    required this.memo,
  }) : backgroundColors = backgroundColors ?? [Colors.white, Colors.white];

  void incrementFirstCounter() {
    counts[0]++;
    _updateFirstCounterBackgroundColor();
    notifyListeners();
  }

  void incrementSecondCounter() {
    counts[1]++;
    _updateSecondCounterBackgroundColor();
    notifyListeners();
  }

  void resetFirstCounter(){
    counts[0] = 0;
    _updateFirstCounterBackgroundColor();
    notifyListeners();
  }

  void resetSecondCounter(){
    counts[1] = 0;
    _updateSecondCounterBackgroundColor();
    notifyListeners();
  }

  void updateMemo(String newMemo) {
    memo = newMemo;
    notifyListeners();
  }

  void _updateFirstCounterBackgroundColor() {
    if (counts[0] >= targetCounts[0]) {
      backgroundColors[0] = BLUE_COLOR;
    } else {
      backgroundColors[0] = Colors.white;
    }
  }

  void _updateSecondCounterBackgroundColor() {
    if (counts[1] >= targetCounts[1]) {
      backgroundColors[1] = BLUE_COLOR;
    } else {
      backgroundColors[1] = Colors.white;
    }
  }
}