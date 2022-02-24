import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tire_management/ui/screens/tire_management/cubit/cubit.dart';
import 'package:tire_management/ui/shared/components/defualt_button.dart';
import 'package:tire_management/ui/shared/constants.dart';

import '../models/tire_model.dart';

class Tier extends StatefulWidget {
  final TireModel? data;
  bool isSpare;

  Tier({
    Key? key,
    this.data,
    this.isSpare = false,
  }) : super(key: key);

  @override
  _TierState createState() => _TierState();
}

class _TierState extends State<Tier> {
  bool isPressed = false;
  bool showTooltip = false;

  @override
  Widget build(BuildContext context) {
    var cubit = TiersManageCubit.get(context);
    return Visibility(
      visible: widget.data != null,
      // maintainSize: true,
      child: GestureDetector(
        onTap: () {
          cubit.selectTire(widget.data!);
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
                  color: cubit.firstTire != null &&
                          widget.data != null &&
                          cubit.firstTire!.position == widget.data!.position
                      ? Colors.red.shade800
                      : cubit.secondTire != null &&
                              widget.data != null &&
                              cubit.secondTire!.position ==
                                  widget.data!.position
                          ? Colors.green
                          : Colors.grey,
                ),
              ),
              RotatedBox(
                quarterTurns: widget.isSpare ? 3 : 0,
                child: Container(
                  height: 30.h,
                  width: 30.h,
                  child: Center(
                    child: FittedBox(
                      child: Text(
                        '${widget.data?.position} ',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
