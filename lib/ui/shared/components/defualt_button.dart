import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tire_management/ui/shared/constants.dart';

class DefualtButton extends StatelessWidget {
  String title;
  Color color;
  var onPress;

  DefualtButton({
    required this.title,
    this.color = mainColor,
    required this.onPress,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 300.w,
      height: 50.h,
      margin: EdgeInsets.all(5.w),
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          primary: color,
        ),
        child: Text(
          title,
          style: TextStyle(fontSize: 26.sp),
        ),
      ),
    );
  }
}
