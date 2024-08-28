import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:routin_e/screen/record_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset : false,
        body: SingleChildScrollView(
            child: RecordScreen(),
        ),
        ),
      )
    );
}
