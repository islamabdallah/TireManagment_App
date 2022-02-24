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
        color: color,
        fontSize: 22.sp,
        fontWeight: FontWeight.w500,
        fontFamily: 'NotoSerif',
      ),
    );
  }
}
