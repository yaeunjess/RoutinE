import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:routin_e/const/colors.dart';

class RoutineCard extends StatelessWidget {
  final Color cardColor;
  final double width;
  final double height;
  final String routineTitle;
  final List<String> exerciseTitles;
  final VoidCallback onTap;

  const RoutineCard({
    this.width = 342.0,
    this.height = 84.0,
    this.cardColor = BEIGE_COLOR,
    required this.routineTitle,
    required this.exerciseTitles,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
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
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      routineTitle,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        print('아이콘이 눌렸습니다.');
                      },
                      child: Image.asset(
                        'assets/img/icon_threedots.png',
                        width: 18,
                        height: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Text(
                      exerciseTitles.join(', '),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
