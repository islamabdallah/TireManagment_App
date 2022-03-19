import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoteText extends StatelessWidget {
  String text;
  Color color;
  NoteText({required this.text, this.color = Colors.red});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16.sp,
        color: color,
        fontWeight: FontWeight.w700,
        fontFamily: "Roboto",
        fontStyle:  FontStyle.normal,
      ),
    );
  }
}
