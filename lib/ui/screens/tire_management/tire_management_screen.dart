import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:tire_management/ui/screens/manage_tires/component/note_text.dart';
import 'package:tire_management/ui/screens/tire_management/cubit/cubit.dart';
import 'package:tire_management/ui/screens/tire_management/cubit/states.dart';
import 'package:tire_management/ui/shared/components/defualt_button.dart';
import 'package:tire_management/ui/shared/constants.dart';

import 'fake_data.dart';
import 'component/tire.dart';
import 'models/tire_model.dart';

class Car extends StatefulWidget {
  const Car({Key? key}) : super(key: key);

  @override
  State<Car> createState() => _CarState();
}

class _CarState extends State<Car> {
  bool enable = false;
  double offset = 0;

  var isBottomSheetShowed = false;

  List<TireModel> tireModel = [];

  @override
  void initState() {
    super.initState();

    for (var tier in truck22Tires) {
      tireModel.add(TireModel.fromJson(tier));
    }

    print(tireModel);
  }

  TireModel? getTire(name) {
    var x = tireModel.indexWhere((tire) => tire.name == name);
    if (x != -1) {
      return tireModel[x];
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Map<String, String> data;
    // data = shovel4Tires;
    // data = truckMixer10Tires;
    // data = truckMixer12Tires;
    // data = concretePump14Tires;
    // data = cementTanker22Tires;
    // data = cementTanker24Tires;

    return BlocProvider(
      create: (context) => TiresManageCubit(),
      child: BlocConsumer<TiresManageCubit, TiresManageStates>(
        listener: (context, state) {
          // if (state is CloseBottomSheetState) {
          //   Navigator.pop(context);
          // }
          if (state is SaveProcessState) {
            showDialog(
              context: context,
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.all(20.h),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Expanded(child: Container()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Transform.rotate(
                              angle: 180,
                              child: Icon(
                                Icons.reply_rounded,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                  ),
                );
              },
            ).then((value) => null);
          }
        },
        builder: (context, state) {
          var cubit = TiresManageCubit.get(context);
          return WillPopScope(
            onWillPop: () async {
              if (cubit.isBottomSheetOpened) {
                cubit.cancelProcess();
                return false;
              } else {
                return true;
              }
            },
            child: Scaffold(
              //  appBar: AppBar(),
              key: scaffoldKey,
              backgroundColor: Colors.black,
              body: Padding(
                padding: EdgeInsets.only(
                    bottom: cubit.isBottomSheetOpened ? 205.h : 0.h),
                child: Center(
                  child: Container(
                    height: 695.h,
                    // color: Colors.white,
                    child: Column(
                      children: [
                        // if (cubit.selectedAction == 'Rotate' &&
                        //     cubit.secondTire == null)
                        //   NoteText(
                        //     text: 'Select Second Tire',
                        //     color: Colors.white,
                        //   ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.zero,
                              margin: EdgeInsets.zero,
                              // color: Colors.blue,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        // mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Tier(
                                            data: getTire('F3'),
                                          ),
                                          Tier(data: getTire('F1')),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        // mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Tier(data: getTire('F7')),
                                          Tier(data: getTire('F5')),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        // mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Tier(data: getTire('F11')),
                                          Tier(data: getTire('F9')),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        // mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Tier(data: getTire('R3')),
                                          Tier(data: getTire('R1')),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        // mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Tier(data: getTire('R7')),
                                          Tier(data: getTire('R5')),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        // mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Tier(data: getTire('R11')),
                                          Tier(data: getTire('R9')),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SimpleShadow(
                              opacity: 0.2,
                              // Default: 0.5
                              color: Colors.white,
                              // Default: Black
                              offset: const Offset(5, 5),
                              // Default: Offset(2, 2)
                              sigma: 7,
                              child: Container(
                                // color: Colors.red,
                                padding: EdgeInsets.zero,
                                margin: EdgeInsets.zero,
                                height: 665.h,
                                child: SvgPicture.asset(
                                  "assets/icons/trailer2.svg",
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.zero,
                              margin: EdgeInsets.zero,
                              // color: Colors.blue,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        // mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Tier(data: getTire('F2')),
                                          Tier(data: getTire('F4')),
                                        ],
                                      ),
                                      Row(
                                        // mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Tier(data: getTire('F6')),
                                          Tier(data: getTire('F8')),
                                        ],
                                      ),
                                      Row(
                                        // mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Tier(data: getTire('F10')),
                                          Tier(data: getTire('F12')),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Tier(data: getTire('R2')),
                                          Tier(data: getTire('R4')),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Tier(data: getTire('R6')),
                                          Tier(data: getTire('R8')),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Tier(data: getTire('R10')),
                                          Tier(data: getTire('R12')),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              bottomSheet: cubit.isBottomSheetOpened && cubit.firstTire != null
                  ? BottomSheet(
                      backgroundColor: Colors.black,
                      builder: (BuildContext context) {
                        TireModel? tire = cubit.secondTire ?? cubit.firstTire;
                        return Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
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
                                  tire!.name,
                                  style: TextStyle(
                                      fontSize: 21.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  tire.serial!,
                                  style: TextStyle(
                                      fontSize: 21.sp,
                                      fontWeight: FontWeight.bold),
                                ),
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
                                                title: 'Change',
                                                onPress: () {}),
                                          ),
                                        ],
                                      )
                                    : Row(
                                        children: [
                                          Expanded(
                                            child: DefualtButton(
                                              title: 'Cancel',
                                              onPress: () {
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
                      onClosing: () {},
                    )
                  : null,
            ),
          );
        },
      ),
    );
  }
}
