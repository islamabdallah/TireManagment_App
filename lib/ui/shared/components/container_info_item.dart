import 'package:flutter/material.dart';

class InfoItem extends StatelessWidget {
  String title;
  String value;
  InfoItem({
    required this.value,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border(
            bottom: BorderSide(width: 1.0, color: Colors.grey[700]!),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
          child: Text(
            '$title: $value',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
