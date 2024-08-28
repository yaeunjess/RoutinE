import 'package:flutter/material.dart';
import 'package:routin_e/const/colors.dart';
import 'package:routin_e/screen/exercise_screen.dart';
import 'const/texts.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = APP_NAME;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
      theme: ThemeData(fontFamily: 'NotoSansKR'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = [
    ExerciseScreen(),
    Text('기록'), // RecordScreen(),
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(APP_NAME, style: TextStyle(color: ORANGE_COLOR, fontSize: 32.0, fontWeight: FontWeight.w600),),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: _selectedIndex == 0 ? Icon(Icons.directions_run, color: ORANGE_COLOR) :  Icon(Icons.directions_run, color: GREY_COLOR),
            label: EXERCISE,
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1 ? Icon(Icons.edit_calendar, color: ORANGE_COLOR) :  Icon(Icons.edit_calendar, color: GREY_COLOR),
            label: RECORD,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: ORANGE_COLOR,
        onTap: _onItemTapped,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}


