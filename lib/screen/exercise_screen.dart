import 'package:flutter/cupertino.dart';
import 'package:routin_e/component/routine_card.dart';

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({super.key});

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 4.0,),
              RoutineCard(),
              SizedBox(height: 8.0,),
              RoutineCard(),
              SizedBox(height: 8.0,),
              RoutineCard(),
              SizedBox(height: 8.0,),
              SizedBox(height: 4.0,),
              RoutineCard(),
              SizedBox(height: 8.0,),
              RoutineCard(),
              SizedBox(height: 8.0,),
              RoutineCard(),
              SizedBox(height: 8.0,),
              SizedBox(height: 4.0,),
              RoutineCard(),
              SizedBox(height: 8.0,),
              RoutineCard(),
              SizedBox(height: 8.0,),
              RoutineCard(),
              SizedBox(height: 8.0,),
            ],
          ), // decoration: BoxDecoration(color: BLUE_COLOR),
    );
  }
}
