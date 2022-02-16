import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tire_management/ui/shared/constants.dart';

class DetailsRow extends StatelessWidget {
  String? title;
  String? imagePath;
  Color color;
  DetailsRow({
    required this.title,
    required this.imagePath,
    this.color = mainColor,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color,
          child: SvgPicture.asset(imagePath!),
        ),
        SizedBox(
          width: 16,
        ),
        Text(
          title!,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
