import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tire_management/ui/shared/constants.dart';

class DefaultButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final bool isFill;

  const DefaultButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.isFill = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color(0x26000000),
          blurRadius: 6.r,
          offset: const Offset(0, 4),
        ),
      ]),
      child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.r),
                ),
                  side: const BorderSide(
                    width: 2.0,
                    color: mainColor,
                  ),
                primary: isFill?mainColor:Colors.white,
                onPrimary: isFill?Colors.white:mainColor,
                // elevation: 5.h,
                // shadowColor: Colors.black
              ),
              child: Text(
                title,
                style: TextStyle(
                    color: isFill?Colors.white:mainColor,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Roboto",
                    fontStyle: FontStyle.normal,
                    fontSize: 16.sp),
              ),
            ),
    );
  }
}
