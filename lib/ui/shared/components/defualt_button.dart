import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        borderRadius: BorderRadius.circular(0),
      ),
      minWidth: 336.w,
      height: 66.h,
      color: color,
      onPressed: onPress,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 21.sp,
        ),
      ),
    );
  }
}
