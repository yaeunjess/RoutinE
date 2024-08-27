import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:routin_e/component/excercise_card.dart';
import 'package:routin_e/const/colors.dart';
import '../component/calendar.dart';

class RecordScreen extends StatefulWidget {
  const RecordScreen({super.key});

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  //선택된 날짜는 이제 selectedDate로 관리할 것임 > 터치해서
  DateTime selectedDate = DateTime.utc(
      DateTime.now().year, DateTime.now().month, DateTime.now().day);
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(children: [
        Calendar(
          selectedDate: selectedDate,
          onDaySelected: onDaySelected,
        ),
        /*CarouselSlider(
          // Set carousel controller
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: const BoxDecoration(color: Colors.amber),
                    child: Center(
                      child: Text(
                        'text $i',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ));
              },
            );
          }).toList(),
          options: CarouselOptions(),
        ),*/
      ]),
    ));
  }

  void onDaySelected(DateTime touchedDate, DateTime focusedDate) {
    setState(() {
      this.selectedDate = touchedDate; // selectedDate는 터치된 날짜로 설정할 것
    });
  }
}
