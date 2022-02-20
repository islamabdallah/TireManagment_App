import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/tire_model.dart';

class Tier extends StatefulWidget {
  final TireModel? data;

  const Tier({Key? key, this.data,}) : super(key: key);

  @override
  _TierState createState() => _TierState();
}

class _TierState extends State<Tier> {
  bool isPressed = false;
  bool showTooltip = false;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.data != null,
      // maintainSize: true,
      child: GestureDetector(
        onTap: () {
          setState(() {
            isPressed = !isPressed;
          });
        },
        onLongPress: () {
          print('hello?');
          setState(() {
            showTooltip = !showTooltip;
          });
        },
        child: Container(
          margin: EdgeInsets.all(6.r),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                // width: double.infinity,
                // color: Colors.red,
                height: 90.h,
                width: 24.w,
                child: SvgPicture.asset(
                  "assets/icons/FL_Tyre.svg",
                  fit: BoxFit.contain,
                  color: Colors.grey,
                ),
              ),
              Container(
                height: 30.h,
                width: 30.h,
                child: Center(
                  child: FittedBox(
                    child: Text(
                      '${widget.data?.name} \n ${widget.data?.serial}',
                      // '${widget.data}\n${widget.serial}',
                      style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
