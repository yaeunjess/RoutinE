import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:routin_e/const/colors.dart';

class CustomTextField extends StatelessWidget {
  final double width;
  final double? height;
  final TextInputType inputType;
  final int maxLines;
  final String? hintText;
  final bool isTextValid;

  const CustomTextField({
    super.key,
    required this.inputType,
    required this.width,
    this.height,
    required this.maxLines,
    this.hintText,
    this.isTextValid = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      //높이 지정
      constraints: height != null
          ? BoxConstraints(
        minHeight: height!,
        maxHeight: height!,
      )
          : const BoxConstraints.tightFor(),
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
                color: isTextValid ? Colors.black45 : Colors.red,
                width: 1.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color:isTextValid ? Colors.black45 : Colors.red,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: isTextValid ? Colors.black45 : Colors.red,
                width: 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
