import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  static const double defaultBorderRadius = 8.0;
  final double width;
  final double height;
  final int countNumber;
  final int targetCount;
  final Color backgroundColor;
  final double borderTopLeft;
  final double borderTopRight;
  final double borderBottomLeft;
  final double borderBottomRight;
  final VoidCallback onLongPress;
  final VoidCallback onTap;

  const Counter({
    super.key,
    required this.width,
    required this.height,
    required this.countNumber,
    required this.targetCount,
    required this.backgroundColor,
    this.borderTopLeft = defaultBorderRadius,
    this.borderBottomLeft = defaultBorderRadius,
    this.borderTopRight = defaultBorderRadius,
    this.borderBottomRight = defaultBorderRadius,
    required this.onLongPress,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(borderTopLeft),
              topRight: Radius.circular(borderTopRight),
              bottomLeft: Radius.circular(borderBottomLeft),
              bottomRight: Radius.circular(borderBottomRight)
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "$countNumber",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 124.0,
                color: countNumber >= targetCount ? Colors.white : Colors.black,
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
      onLongPress: onLongPress,
      onTap: onTap,
    );
  }
}
