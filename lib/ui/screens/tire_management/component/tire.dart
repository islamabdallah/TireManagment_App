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

  const Tier({
    Key? key,
    this.data,
  }) : super(key: key);

  @override
  _TierState createState() => _TierState();
}

class _TierState extends State<Tier> {
  bool isPressed = false;
  bool showTooltip = false;

  @override
  Widget build(BuildContext context) {
    var cubit = TiresManageCubit.get(context);
    return Visibility(
      visible: widget.data != null,
      // maintainSize: true,
      child: GestureDetector(
        onTap: () {
          cubit.selectTire(widget.data!);

          if (cubit.firstTire != null || cubit.selectedAction == 'Rotate') {
            scaffoldKey.currentState!.showBottomSheet(
              (context) {
                return Container(
                  height: 205.h,
                  width: 1.sw,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 16.h,
                      left: 16.h,
                      right: 16.h,
                      bottom: 4.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'test',
                          style: TextStyle(
                              fontSize: 21.sp, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'test',
                          style: TextStyle(
                              fontSize: 21.sp, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'test',
                          style: TextStyle(
                              fontSize: 21.sp, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'test',
                          style: TextStyle(
                              fontSize: 21.sp, fontWeight: FontWeight.bold),
                        ),

                        // Center(
                        //   child: SizedBox(
                        //     width: 337.w,
                        //     height: 47.h,
                        //     child: ElevatedButton(
                        //       onPressed: () {},
                        //       child: Text('Actions'),
                        //     ),
                        //   ),
                        // )

                        cubit.selectedAction == null
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: DefualtButton(
                                      title: 'Rotate',
                                      onPress: () {
                                        cubit.changeAction('Rotate');
                                        cubit.closeBottomSheet();
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Expanded(
                                    child: DefualtButton(
                                        title: 'Change', onPress: () {}),
                                  ),
                                ],
                              )
                            : Row(
                                children: [
                                  Expanded(
                                    child: DefualtButton(
                                      title: 'Cancel',
                                      onPress: () {
                                        Navigator.pop(context);
                                        cubit.cancelProcess();
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Expanded(
                                    child: DefualtButton(
                                      title: 'Save',
                                      color: Colors.green,
                                      onPress: () {
                                        Navigator.pop(context);
                                        cubit.saveProcess();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                );
              },
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                side: BorderSide(
                  color: Colors.black87.withOpacity(.8),
                ),
              ),
            );
          }
        },
        // onLongPress: () {
        //   print('hello?');
        //   setState(() {
        //     showTooltip = !showTooltip;
        //   });
        // },
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
                          cubit.firstTire!.name == widget.data!.name
                      ? Colors.red.shade800
                      : cubit.secondTire != null &&
                              widget.data != null &&
                              cubit.secondTire!.name == widget.data!.name
                          ? Colors.green
                          : Colors.grey,
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
