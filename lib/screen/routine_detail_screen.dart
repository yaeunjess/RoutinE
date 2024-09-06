import 'package:flutter/material.dart';
import 'package:routin_e/component/exercise_detail_card.dart';
import 'package:routin_e/database/drift_database.dart';

import '../const/colors.dart';

class RoutineDetailScreen extends StatefulWidget {
  final String routineTitle;
  final List<Exercise> exercises;

  const RoutineDetailScreen({
    required this.routineTitle,
    required this.exercises,
    super.key,
  });

  @override
  State<RoutineDetailScreen> createState() => _RoutineDetailScreenState();
}

class _RoutineDetailScreenState extends State<RoutineDetailScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        foregroundColor: ORANGE_COLOR,
        title: Text(
          widget.routineTitle,
          style: TextStyle(
              color: ORANGE_COLOR, fontSize: 24.0, fontWeight: FontWeight.w600),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: 12.0, left: 12.0, bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: GREY_COLOR,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  '완료하기',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: BLUE_COLOR,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  '종료하기',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.exercises.length, (index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  width: _currentPage == index ? 10.0 : 8.0,
                  height: _currentPage == index ? 10.0 : 8.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index ? ORANGE_COLOR : Colors.grey,
                  ),
                );
              }),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.exercises.length,
                onPageChanged: (int index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        ExerciseDetailCard(exercise: widget.exercises[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
