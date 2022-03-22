import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tire_management/ui/modules/tire_management/cubit/cubit.dart';
import 'package:tire_management/ui/shared/components/defualt_button.dart';
import 'package:tire_management/ui/shared/constants.dart';

import '../models/tire_model.dart';

class TierWidget extends StatefulWidget {
  final Tire? data;
  final bool isSpare;
  final bool isNew;

  const TierWidget({
    Key? key,
    this.data,
    this.isSpare = false,
    this.isNew = false,
  }) : super(key: key);

  @override
  _TierWidgetState createState() => _TierWidgetState();
}

class _TierWidgetState extends State<TierWidget> {
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
          if(widget.data?.tirePosition !=null)
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
                height: 82.h,
                width: 32.w,
                child: cubit.firstTire != null &&
                        widget.data != null &&
                        widget.isNew != true &&
                        cubit.firstTire!.tirePosition == widget.data!.tirePosition
                    ? Image.asset(
                        "assets/images/red_tire.png",
                      )
                    : cubit.secondTire != null &&
                            widget.data != null &&
                            widget.isNew != true &&
                            cubit.secondTire!.tirePosition == widget.data!.tirePosition
                        ? Image.asset(
                            "assets/images/green_tire.png",
                          )
                        : Image.asset(
                            "assets/images/black_tire.png",
                            fit: BoxFit.contain,
                          ),
              ),
              RotatedBox(
                quarterTurns: widget.isSpare ? 3 : 0,
                child: FittedBox(
                  child: Container(
                    height: 22.h,
                    width: 23.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(2.r)),
                    child: Center(
                      child: FittedBox(
                        child: Text(
                          widget.isNew? 'new':
                          '${widget.data?.tirePosition} ',
                          // '${widget.data}\n${widget.serial}',
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: mainColor),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
