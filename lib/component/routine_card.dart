import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:routin_e/const/colors.dart';

class RoutineCard extends StatelessWidget {
  final cardColor;
  final width;
  final height;

  const RoutineCard({
    this.width = 342.0,
    this.height = 72.0,
    this.cardColor = BEIGE_COLOR,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: BEIGE_COLOR,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  '등운동',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0),
                  textAlign: TextAlign.right,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(Icons.add, color: Colors.black),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              '기립근, 승모근, 광배근',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12.0, color: GREY_COLOR),
            ),
          ),
        ],
      ),
    );
  }
}
