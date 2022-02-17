import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tire_management/ui/shared/constants.dart';

class DefualtButton extends StatelessWidget {
  String title;
  Color color;
  var onPress;
  double height;
  DefualtButton({
    required this.title,
    this.color = mainColor,
    required this.onPress,
    this.height = 40,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(isTaplet ? 24 : 8),
      ),
      minWidth: 70.w,
      height: 6.3.h,
      color: color,
      onPressed: onPress,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.sp,
        ),
      ),
    );
  }
}
