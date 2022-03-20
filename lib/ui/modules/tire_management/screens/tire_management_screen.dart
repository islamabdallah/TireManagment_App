import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:tire_management/ui/modules/login/components/defualt_text_field.dart';

import 'package:tire_management/ui/modules/truck_selection/screens/truck_selection_screen.dart';
import 'package:tire_management/ui/shared/components/search_drop_down.dart';
import 'package:tire_management/ui/shared/utils/navigations.dart';
import '../../../shared/components/note_text.dart';
import 'package:tire_management/ui/modules/tire_management/component/input_management_screen.dart';
import 'package:tire_management/ui/modules/tire_management/component/tier_save_item.dart';
import 'package:tire_management/ui/modules/tire_management/component/tire.dart';
import 'package:tire_management/ui/modules/tire_management/cubit/cubit.dart';
import 'package:tire_management/ui/modules/tire_management/cubit/states.dart';
import 'package:tire_management/ui/modules/tire_management/models/fake_data.dart';
import 'package:tire_management/ui/modules/tire_management/models/tire_model.dart';
import 'package:tire_management/ui/shared/components/defualt_button.dart';
import 'package:tire_management/ui/shared/constants.dart';

import '../../../shared/components/default_drop_down.dart';
import '../../../shared/utils/loading_dialog.dart';
import '../../../shared/utils/message_dialog.dart';

class TiersManagementScreen extends StatefulWidget {
  static const routeName = 'TiersManagementScreen';

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
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      cubit.getTires();
    });
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
        print(state.runtimeType);
        if (state is GetTiresLoadingState) {
          loadingAlertDialog(context);
        }
        if (state is GetTiresSuccessState) {
          Navigator.pop(context);
        }
        if (state is TireMovementSuccessState) {
          Navigator.pop(context);
          showMessageDialog(
            context: context,
            message: state.message,
            isSucceeded: true,
            onPressedOk: ()=>Navigator.popUntil(context,ModalRoute.withName(TruckSelectionScreen.routeName))
          );
        }
        if (state is TireMovementErrorState) {
          Navigator.pop(context);
          showMessageDialog(
              context: context,
              message: state.error,
              isSucceeded: false,
              onPressedRetry: () {
                print('retry');
                cubit.startMovement();
              });
        }
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
            backgroundColor: const Color(0xFFf5f5f5),
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              reverse: true,
              physics: NeverScrollableScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: cubit.isBottomSheetOpened ? 80.h : 0.h),
                child: Center(
                  child: Container(
                    height: 1.sh,
                    // height: 653.h,
                    // color: Colors.blue,
                    child: Column(
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (cubit.selectedAction == 'Rotation'&&cubit.secondTire==null)
                           Padding(
                             padding: EdgeInsets.all(20.h),
                             child: Text(
                               "Select 2 Wheel to Rotate",
                               style: TextStyle(
                                   color: mainColor,
                                   fontWeight: FontWeight.w700,
                                   fontFamily: "Roboto",
                                   fontStyle: FontStyle.normal,
                                   fontSize: 18.0.sp),
                             ),
                           ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.zero,
                                margin: EdgeInsets.zero,
                                // color: Colors.blue,
                                height: 560.h,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          // mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TierWidget(
                                              data: cubit.getTire('F5'),
                                            ),
                                            TierWidget(
                                                data: cubit.getTire('F1')),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          // mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TierWidget(
                                                data: cubit.getTire('F7')),
                                            TierWidget(
                                                data: cubit.getTire('F3')),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          // mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TierWidget(
                                                data: cubit.getTire('F11')),
                                            TierWidget(
                                                data: cubit.getTire('F9')),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          // mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TierWidget(
                                                data: cubit.getTire('R5')),
                                            TierWidget(
                                                data: cubit.getTire('R1')),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          // mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TierWidget(
                                                data: cubit.getTire('R7')),
                                            TierWidget(
                                                data: cubit.getTire('R3')),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          // mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TierWidget(
                                                data: cubit.getTire('R11')),
                                            TierWidget(
                                                data: cubit.getTire('R9')),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
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
                                      // height: 100.h,
                                      // width: 0.w,
                                      child: SvgPicture.asset(
                                        "assets/images/truck.svg",
                                        fit: BoxFit.fitHeight,
                                        height: 560.h,
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
                                height: 560.h,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          // mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TierWidget(
                                                data: cubit.getTire('F2')),
                                            TierWidget(
                                                data: cubit.getTire('F6')),
                                          ],
                                        ),
                                        Row(
                                          // mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TierWidget(
                                                data: cubit.getTire('F4')),
                                            TierWidget(
                                                data: cubit.getTire('F8')),
                                          ],
                                        ),
                                        Row(
                                          // mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TierWidget(
                                                data: cubit.getTire('F10')),
                                            TierWidget(
                                                data: cubit.getTire('F12')),
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
                                            TierWidget(
                                                data: cubit.getTire('R2')),
                                            TierWidget(
                                                data: cubit.getTire('R6')),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            TierWidget(
                                                data: cubit.getTire('R4')),
                                            TierWidget(
                                                data: cubit.getTire('R8')),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            TierWidget(
                                                data: cubit.getTire('R10')),
                                            TierWidget(
                                                data: cubit.getTire('R12')),
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
            bottomSheet: cubit.isBottomSheetOpened && cubit.firstTire != null
                ? BottomSheet(
                    backgroundColor: const Color(0xFFf5f5f5),
                    builder: (BuildContext context) {
                      Tire? tire = cubit.firstTire;
                      Tire? tire2 = cubit.secondTire;
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38,
                              blurRadius: 16.r,
                              offset: Offset(0, -4.h),
                            )
                          ],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            topRight: Radius.circular(20.r),
                          ),
                        ),
                        height: 167.h,
                        width: 1.sw,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 16.h,
                            left: 16.h,
                            right: 16.h,
                            bottom: 4.h,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 0.45.sw,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                              height: 80.h,
                                              // width: 90.w,
                                              child: TierWidget(
                                                data: tire,
                                              )),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TierDetailItem(
                                                  title: 'Serial : ',
                                                  value: tire!.tireSerial!),
                                              TierDetailItem(
                                                  title: 'Position : ',
                                                  value: tire.position!),
                                              TierDetailItem(
                                                  title: 'Brand : ',
                                                  value: tire.tirebrand!),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (tire2 != null)
                                      SizedBox(
                                        width: 0.4.sw,
                                        child: Row(
                                          children: [
                                            SizedBox(
                                                height: 80.h,
                                                // width: 90.w,
                                                child: TierWidget(
                                                  data: tire2,
                                                )),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TierDetailItem(
                                                    title: 'Serial : ',
                                                    value: tire2.tireSerial!),
                                                TierDetailItem(
                                                    title: 'Position : ',
                                                    value: tire2.position!),
                                                TierDetailItem(
                                                    title: 'Brand : ',
                                                    value: tire2.tirebrand!),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                                cubit.selectedAction == null
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Expanded(
                                            child: DefaultButton(
                                              title: 'Rotate',
                                              onPressed: () {
                                                cubit.changeAction('Rotation');
                                                cubit.closeBottomSheet();
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20.w,
                                          ),
                                          Expanded(
                                            child: DefaultButton(
                                              title: 'Replace',
                                              isFill: false,
                                              onPressed: () {
                                                cubit.changeAction(
                                                    'Replacement');
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
                                                      builder:
                                                          (context, state) {
                                                        return buildReplacementAlertDialog();
                                                      },
                                                      buildWhen:
                                                          (prev, current) {
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
                                            child: DefaultButton(
                                              title: 'Cancel',
                                              isFill: false,
                                              onPressed: () {
                                                cubit.cancelProcess();
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20.w,
                                          ),
                                          Expanded(
                                            child: DefaultButton(
                                              title: 'Start',
                                              color: const Color(0xFF3e8939),
                                              onPressed: () {
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
                                                      builder:
                                                          (context, state) {
                                                        return buildRotationAlertDialog(
                                                            context);
                                                        return Container();
                                                      },
                                                      buildWhen:
                                                          (prev, current) {
                                                        print(current);
                                                        print(current
                                                            is CancelProcessState);
                                                        if (current
                                                            is CancelProcessState) {
                                                          return false;
                                                        }
                                                        return false;
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
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Center(
        child: SizedBox(
          height: 693.h,
        child: SingleChildScrollView(
          reverse: true,
          child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: 412.w,
                  // height: 693.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(blurRadius: 15.r, color: mainColor)],
                      borderRadius: BorderRadius.circular(12.r)),
                  margin: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Form(
                    key: changeFormK,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 16.h),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
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
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            child: Icon(
                              Icons.swap_vert,
                              size: 40.h,
                              color: Colors.red,
                            ),
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
                            height: 30.h,
                          ),
                          if (cubit.secondTire != null)
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 165.w,
                                    child: DefaultButton(
                                      title: 'Process',
                                      onPressed: () async {
                                        if (changeFormK.currentState!.validate()) {
                                          // Navigator.pop(context);

                                          await cubit.startMovement();

                                          // cubit.cancelProcess();

                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -45.h,
                  right: -0.w,
                  height: 190.h,
                  child: Container(
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.zero,
                    child: Image.asset('assets/images/concrete_truck.png'),
                  ),
                ),
              ],
            ),
        ),
        ),
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
                  // items: const ['1', '2', '3', '4'],
                  items:
                      cubit.newTires.map((e) => e.tireSerial).toList().cast(),
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
            DefaultButton(
              title: 'Process',
              onPressed: () {
                print('test');
                if (changeFormK.currentState!.validate()) {
                  // Navigator.pop(
                  //     context);

                  cubit.startMovement();

                  //
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
