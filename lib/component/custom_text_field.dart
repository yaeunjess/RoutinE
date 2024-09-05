import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:routin_e/const/colors.dart';

class CustomTextField extends StatelessWidget {
  final double width;
  final TextInputType inputType;
  final int maxLines;
  final String? hintText;

  const CustomTextField({
    super.key,
    required this.inputType,
    required this.width,
    required this.maxLines,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Material(
        child: TextFormField(
          cursorColor: GREY_COLOR,
          maxLines: maxLines,
          keyboardType: inputType,
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.black,
          ),
          // inputFormatters: ,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 14.0,
              color: Colors.grey,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Colors.black45,
                width: 1.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color:Colors.black45,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Colors.black45,
                width: 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
