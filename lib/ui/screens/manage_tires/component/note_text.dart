import 'package:flutter/material.dart';

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
        fontSize: 20,
        fontWeight: FontWeight.w500,
        fontFamily: 'NotoSerif',
      ),
    );
  }
}
