import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:tire_management/ui/screens/login/components/defualt_text_field.dart';

import 'package:tire_management/ui/screens/truck_selection/truck_selection_screen.dart';
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
import '../../shared/utils/loading_dialog.dart';

class TiersManagementScreen extends StatefulWidget {
  const TiersManagementScreen({Key? key}) : super(key: key);

  @override
  State<TiersManagementScreen> createState() => _TiersManagementScreenState();
}

class _TiersManagementScreenState extends State<TiersManagementScreen> {
  // List<Tire> tireModel = [];
  var changeFormK = GlobalKey<FormState>();
  late TiersManageCubit cubit;

  @override
  void initState() {
    super.initState();

    cubit = TiersManageCubit.get(context);
    cubit.getTires();
    // print(tireModel);
  }

  @override
  void dispose() {
    cubit.cancelProcess();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TiersManageCubit, TiresManageStates>(
      listener: (context, state) {
        if (state is GetTiresLoadingState) {
          loadingAlertDialog(context);
        }
        if (state is SaveProcessState) {}
      },
      builder: (context, state) {
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
                                      TierWidget(
                                        data: cubit.getTire('F5'),
                                      ),
                                      TierWidget(data: cubit.getTire('F1')),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    // mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TierWidget(data: cubit.getTire('F7')),
                                      TierWidget(data: cubit.getTire('F3')),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    // mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TierWidget(data: cubit.getTire('F11')),
                                      TierWidget(data: cubit.getTire('F9')),
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
                                      TierWidget(data: cubit.getTire('R5')),
                                      TierWidget(data: cubit.getTire('R1')),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    // mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TierWidget(data: cubit.getTire('R7')),
                                      TierWidget(data: cubit.getTire('R3')),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    // mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TierWidget(data: cubit.getTire('R11')),
                                      TierWidget(data: cubit.getTire('R9')),
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
                              child: TierWidget(
                                data: cubit.getTire('S'),
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
                                      TierWidget(data: cubit.getTire('F2')),
                                      TierWidget(data: cubit.getTire('F6')),
                                    ],
                                  ),
                                  Row(
                                    // mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TierWidget(data: cubit.getTire('F4')),
                                      TierWidget(data: cubit.getTire('F8')),
                                    ],
                                  ),
                                  Row(
                                    // mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TierWidget(data: cubit.getTire('F10')),
                                      TierWidget(data: cubit.getTire('F12')),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      TierWidget(data: cubit.getTire('R2')),
                                      TierWidget(data: cubit.getTire('R6')),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      TierWidget(data: cubit.getTire('R4')),
                                      TierWidget(data: cubit.getTire('R8')),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      TierWidget(data: cubit.getTire('R10')),
                                      TierWidget(data: cubit.getTire('R12')),
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
                      Tire? tire = cubit.secondTire ?? cubit.firstTire;
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
                                  title: 'Serial : ', value: tire!.tireSerial!),
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
                                              cubit.changeAction('Rotation');
                                              cubit.closeBottomSheet();
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20.w,
                                        ),
                                        Expanded(
                                          child: DefualtButton(
                                            title: 'Replace',
                                            onPress: () {
                                              cubit.changeAction('Replacement');
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
                                                      return buildReplacementAlertDialog();
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
                                                      return buildRotationAlertDialog(
                                                          context);
                                                      return Container();
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

  Widget buildRotationAlertDialog(BuildContext context) {
    TextEditingController t1Depth1 = cubit.t1Depth1;
    TextEditingController t1Depth2 = cubit.t1Depth2;
    TextEditingController t1Distance = cubit.t1Distance;

    TextEditingController t2Depth1 = cubit.t2Depth1;
    TextEditingController t2Depth2 = cubit.t2Depth2;
    TextEditingController t2Distance = cubit.t2Distance;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AlertDialog(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.all(12.h),
        scrollable: true,
        content: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 16.h,
          ),
          child: Form(
            key: changeFormK,
            child: Column(
              children: [
                TierDetails(
                  c1: t1Depth1,
                  c2: t1Depth2,
                  c3: t1Distance,
                  title: 'Tire1',
                  serial: cubit.firstTire!.tireSerial ?? '',
                  oldPosition: cubit.firstTire!.position ?? '',
                  newPosition: cubit.secondTire!.position ?? '',
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20.h,
                  ),
                  child: const Icon(
                    Icons.swap_vert,
                    size: 50,
                    color: Colors.red,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                if (cubit.secondTire != null)
                  TierDetails(
                    c1: t2Depth1,
                    c2: t2Depth2,
                    c3: t2Distance,
                    title: 'Tire2',
                    serial: cubit.secondTire!.tireSerial ?? '',
                    newPosition: cubit.firstTire!.position ?? '',
                    oldPosition: cubit.secondTire!.position ?? '',
                  ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
        actions: [
          if (cubit.secondTire != null)
            DefualtButton(
              title: 'Process',
              onPress: () {
                if (changeFormK.currentState!.validate()) {
                  cubit.startMovement(
                      t1Depth1.text,
                      t2Depth2.text,
                      t1Distance.text,
                      t2Depth1.text,
                      t2Depth2.text,
                      t2Distance.text);

                  // Navigator.pop(context);
                  // cubit.cancelProcess();
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
      ),
    );
  }

  Widget buildReplacementAlertDialog() {
    TextEditingController t1Depth1 = cubit.t1Depth1;
    TextEditingController t1Depth2 = cubit.t1Depth2;
    TextEditingController t1Distance = cubit.t1Distance;

    TextEditingController t2Depth1 = cubit.t2Depth1;
    TextEditingController t2Depth2 = cubit.t2Depth2;
    TextEditingController t2Distance = cubit.t2Distance;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AlertDialog(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.all(12.h),
        scrollable: true,
        content: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 16.h,
          ),
          child: Form(
            key: changeFormK,
            child: Column(
              children: [
                TierDetails(
                  c1: t1Depth1,
                  c2: t1Depth2,
                  c3: t1Distance,
                  title: 'Tire1',
                  serial: cubit.firstTire!.tireSerial ?? '',
                  oldPosition: cubit.firstTire!.position ?? '',
                  newPosition: cubit.oldTierStatus ?? '',
                  isOld: cubit.selectedAction == 'Replacement' ? true : false,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20.h,
                  ),
                  child: const Icon(
                    Icons.swap_vert,
                    size: 50,
                    color: Colors.red,
                  ),
                ),
                SearchDropDown(
                  onChange: (value) {
                    cubit.replaceTierWithNew(value);
                  },
                  hint: 'Select Tier',
                  items: const ['1', '2', '3', '4'],
                ),
                SizedBox(
                  height: 8.h,
                ),
                if (cubit.secondTire != null)
                  TierDetails(
                    c1: t2Depth1,
                    c2: t2Depth2,
                    c3: t2Distance,
                    title: 'Tire2',
                    serial: cubit.secondTire!.tireSerial ?? '',
                    newPosition: cubit.firstTire!.position ?? '',
                    oldPosition: cubit.secondTire!.position ?? '',
                  ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
        actions: [
          if (cubit.secondTire != null)
            DefualtButton(
              title: 'Process',
              onPress: () {
                print('test');
                if (changeFormK.currentState!.validate()) {
                  cubit.startMovement(
                      t1Depth1.text,
                      t2Depth2.text,
                      t1Distance.text,
                      t2Depth1.text,
                      t2Depth2.text,
                      t2Distance.text);

                  // Navigator.pop(
                  //     context);
                  // cubit
                  //     .cancelProcess();

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
      ),
    );
  }
}
