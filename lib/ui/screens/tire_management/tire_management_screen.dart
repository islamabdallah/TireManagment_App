import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:tire_management/ui/screens/login/components/defualt_text_field.dart';
import 'package:tire_management/ui/screens/manage_tires/models/tire_model.dart';
import 'package:tire_management/ui/screens/trucks/car_selection.dart';
import 'package:tire_management/ui/shared/components/search_drop_down.dart';
import 'package:tire_management/ui/shared/utils/navigations.dart';
import '../../shared/components/note_text.dart';
import 'package:tire_management/ui/screens/tire_management/component/input_management_screen.dart';
import 'package:tire_management/ui/screens/tire_management/component/tier_save_item.dart';
import 'package:tire_management/ui/screens/tire_management/component/tire.dart';
import 'package:tire_management/ui/screens/tire_management/cubit/cubit.dart';
import 'package:tire_management/ui/screens/tire_management/cubit/states.dart';
import 'package:tire_management/ui/screens/tire_management/fake_data.dart';
import 'package:tire_management/ui/screens/tire_management/models/tire_model.dart';
import 'package:tire_management/ui/shared/components/defualt_button.dart';
import 'package:tire_management/ui/shared/constants.dart';

import '../../shared/components/default_drop_down.dart';

class TiersManagementScreen extends StatefulWidget {
  const TiersManagementScreen({Key? key}) : super(key: key);

  @override
  State<TiersManagementScreen> createState() => _TiersManagementScreenState();
}

class _TiersManagementScreenState extends State<TiersManagementScreen> {
  List<TireModel> tireModel = [];
  var changeFormK = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();

    for (var tier in truck22Tires) {
      tireModel.add(TireModel.fromJson(tier));
    }

    print(tireModel);
  }

  TireModel? getTire(name) {
    var x = tireModel.indexWhere((tire) => tire.position == name);
    if (x != -1) {
      return tireModel[x];
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TiersManageCubit, TiresManageStates>(
      listener: (context, state) {
        var cubit = TiersManageCubit.get(context);
        if (state is SaveProcessState) {}
      },
      builder: (context, state) {
        var cubit = TiersManageCubit.get(context);
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
            key: scaffoldKey,
            backgroundColor: Colors.black,
            //resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: cubit.isBottomSheetOpened ? 205.h : 0.h),
                child: Center(
                  child: Container(
                    height: 695.h,
                    // color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.zero,
                          margin: EdgeInsets.zero,
                          // color: Colors.blue,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    // mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Tier(
                                        data: getTire('F5'),
                                      ),
                                      Tier(data: getTire('F1')),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    // mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Tier(data: getTire('F7')),
                                      Tier(data: getTire('F3')),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
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
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    // mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Tier(data: getTire('R5')),
                                      Tier(data: getTire('R1')),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    // mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Tier(data: getTire('R7')),
                                      Tier(data: getTire('R3')),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
                                height: 560.h,
                                child: SvgPicture.asset(
                                  "assets/icons/trailer2.svg",
                                ),
                              ),
                            ),
                            RotatedBox(
                              quarterTurns: 1,
                              child: Tier(
                                data: getTire('S'),
                                isSpare: true,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.zero,
                          margin: EdgeInsets.zero,
                          // color: Colors.blue,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    // mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Tier(data: getTire('F2')),
                                      Tier(data: getTire('F6')),
                                    ],
                                  ),
                                  Row(
                                    // mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Tier(data: getTire('F4')),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Tier(data: getTire('R2')),
                                      Tier(data: getTire('R6')),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Tier(data: getTire('R4')),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TierDetailItem(
                                  title: 'Serial : ', value: tire!.serial!),
                              TierDetailItem(
                                  title: 'Position : ', value: tire.position),
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
                                            onPress: () {
                                              cubit.changeAction('Change');
                                              cubit.closeBottomSheet();
                                              showDialog(
                                                barrierDismissible: false,
                                                context: context,
                                                builder: (context) {
                                                  return BlocConsumer<
                                                      TiersManageCubit,
                                                      TiresManageStates>(
                                                    listener:
                                                        (context, state) {},
                                                    builder: (context, state) {
                                                      return AlertDialog(
                                                        elevation: 2,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                        contentPadding:
                                                            EdgeInsets.all(
                                                                12.h),
                                                        scrollable: true,
                                                        content: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                            vertical: 16.h,
                                                          ),
                                                          child: Form(
                                                            key: changeFormK,
                                                            child: Column(
                                                              children: [
                                                                TierDetails(
                                                                  title:
                                                                      'Tire1',
                                                                  serial: cubit
                                                                          .firstTire!
                                                                          .serial ??
                                                                      '',
                                                                  oldPosition: cubit
                                                                          .firstTire!
                                                                          .position ??
                                                                      '',
                                                                  newPosition:
                                                                      cubit.oldTierStatus ??
                                                                          '',
                                                                  isOld: cubit.selectedAction ==
                                                                          'Change'
                                                                      ? true
                                                                      : false,
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .symmetric(
                                                                    vertical:
                                                                        20.h,
                                                                  ),
                                                                  child:
                                                                      const Icon(
                                                                    Icons
                                                                        .swap_vert,
                                                                    size: 50,
                                                                    color: Colors
                                                                        .red,
                                                                  ),
                                                                ),
                                                                SearchDropDown(
                                                                  onChange:
                                                                      (value) {
                                                                    cubit.replaceTierWithNew(
                                                                        value);
                                                                  },
                                                                  hint:
                                                                      'Select Tier',
                                                                  items: const [
                                                                    '1',
                                                                    '2',
                                                                    '3',
                                                                    '4'
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 8.h,
                                                                ),
                                                                if (cubit
                                                                        .secondTire !=
                                                                    null)
                                                                  TierDetails(
                                                                    title:
                                                                        'Tire2',
                                                                    serial: cubit
                                                                            .secondTire!
                                                                            .serial ??
                                                                        '',
                                                                    newPosition:
                                                                        cubit.firstTire!.position ??
                                                                            '',
                                                                    oldPosition:
                                                                        cubit.secondTire!.position ??
                                                                            '',
                                                                  ),
                                                                SizedBox(
                                                                  height: 20.h,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        actions: [
                                                          if (cubit
                                                                  .secondTire !=
                                                              null)
                                                            DefualtButton(
                                                              title: 'Process',
                                                              onPress: () {
                                                                if (changeFormK
                                                                    .currentState!
                                                                    .validate()) {
                                                                  Navigator.pop(
                                                                      context);
                                                                  cubit
                                                                      .cancelProcess();

                                                                  // navigateWithTransitionAndFinish(
                                                                  //   context:
                                                                  //       context,
                                                                  //   nextScreen:
                                                                  //       CarSelectionScreen(),
                                                                  // );
                                                                }
                                                              },
                                                            ),
                                                        ],
                                                      );
                                                    },
                                                    buildWhen: (prev, current) {
                                                      print(current);
                                                      print(current
                                                          is CancelProcessState);
                                                      if (current
                                                          is CancelProcessState)
                                                        return false;
                                                      return true;
                                                    },
                                                  );
                                                },
                                              ).then((value) {
                                                cubit.cancelProcess();
                                              });
                                            },
                                          ),
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
                                              showDialog(
                                                barrierDismissible: false,
                                                context: context,
                                                builder: (context) {
                                                  return BlocConsumer<
                                                      TiersManageCubit,
                                                      TiresManageStates>(
                                                    listener:
                                                        (context, state) {},
                                                    builder: (context, state) {
                                                      return AlertDialog(
                                                        elevation: 2,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                        contentPadding:
                                                            EdgeInsets.all(
                                                                12.h),
                                                        scrollable: true,
                                                        content: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                            vertical: 16.h,
                                                          ),
                                                          child: Form(
                                                            key: changeFormK,
                                                            child: Column(
                                                              children: [
                                                                TierDetails(
                                                                  title:
                                                                      'Tire1',
                                                                  serial: cubit
                                                                          .firstTire!
                                                                          .serial ??
                                                                      '',
                                                                  oldPosition: cubit
                                                                          .firstTire!
                                                                          .position ??
                                                                      '',
                                                                  newPosition: cubit
                                                                          .secondTire!
                                                                          .position ??
                                                                      '',
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .symmetric(
                                                                    vertical:
                                                                        20.h,
                                                                  ),
                                                                  child:
                                                                      const Icon(
                                                                    Icons
                                                                        .swap_vert,
                                                                    size: 50,
                                                                    color: Colors
                                                                        .red,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 8.h,
                                                                ),
                                                                if (cubit
                                                                        .secondTire !=
                                                                    null)
                                                                  TierDetails(
                                                                    title:
                                                                        'Tire2',
                                                                    serial: cubit
                                                                            .secondTire!
                                                                            .serial ??
                                                                        '',
                                                                    newPosition:
                                                                        cubit.firstTire!.position ??
                                                                            '',
                                                                    oldPosition:
                                                                        cubit.secondTire!.position ??
                                                                            '',
                                                                  ),
                                                                SizedBox(
                                                                  height: 20.h,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        actions: [
                                                          if (cubit
                                                                  .secondTire !=
                                                              null)
                                                            DefualtButton(
                                                              title: 'Process',
                                                              onPress: () {
                                                                if (changeFormK
                                                                    .currentState!
                                                                    .validate()) {
                                                                  Navigator.pop(
                                                                      context);
                                                                  cubit
                                                                      .cancelProcess();

                                                                  // navigateWithTransitionAndFinish(
                                                                  //   context:
                                                                  //       context,
                                                                  //   nextScreen:
                                                                  //       CarSelectionScreen(),
                                                                  // );
                                                                }
                                                              },
                                                            ),
                                                        ],
                                                      );
                                                    },
                                                    buildWhen: (prev, current) {
                                                      print(current);
                                                      print(current
                                                          is CancelProcessState);
                                                      if (current
                                                          is CancelProcessState)
                                                        return false;
                                                      return true;
                                                    },
                                                  );
                                                },
                                              ).then((value) {
                                                cubit.cancelProcess();
                                              });
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
    );
  }
}
