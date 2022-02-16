import 'package:flutter/material.dart';
import 'package:tire_management/ui/screens/manage_tires/component/default_drop_down.dart';
import 'package:tire_management/ui/screens/manage_tires/component/tire_details_item.dart';
import 'package:tire_management/ui/screens/manage_tires/component/tire_item.dart';
import 'package:tire_management/ui/screens/manage_tires/cubit/cubit.dart';
import 'package:tire_management/ui/screens/manage_tires/models/tire_model.dart';

class TirePlace extends StatelessWidget {
  double fromTop;
  double? fromLeft;
  double? fromRight;
  double screenWidth;
  double height;
  Tire? firstTire;
  Tire? secondTire;
  bool isPair;
  bool isLeft;
  BuildContext context;

  TirePlace({
    required this.fromTop,
    this.fromLeft,
    this.fromRight,
    required this.screenWidth,
    required this.height,
    this.isPair = true,
    required this.firstTire,
    this.secondTire,
    this.isLeft = false,
    required this.context,
  });

  void showSheet({
    required BuildContext context,
    required String? dropDownValue,
    required var onDropDownChange,
  }) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (context) {
        return Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TireDetailsItem(
                  tire: firstTire,
                  context: context,
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 16),
                  child: DefaultDropdownField(
                    value: dropDownValue,
                    items: const [
                      'Replace with a same Truck tire',
                      'Replace with a new one',
                    ],
                    onChange: onDropDownChange,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
    // key.currentState.showBottomSheet((context) {
    //   return Container(
    //     child: Padding(
    //       padding: const EdgeInsets.all(16.0),
    //       child: Column(
    //         children: [
    //           TireDetailsItem(
    //             tire: firstTire,
    //             context: context,
    //           ),
    //           const SizedBox(
    //             height: 16,
    //           ),
    //           Padding(
    //             padding: const EdgeInsetsDirectional.only(start: 16),
    //             child: DefaultDropdownField(
    //               value: dropDownValue,
    //               items: const [
    //                 'Replace with a same Truck tire',
    //                 'Replace with a new one',
    //               ],
    //               onChange: onDropDownChange,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    var cubit = ManageTiresCubit.get(context);
    firstTire!.serialNumber = 665;
    firstTire!.manufactor = 'SCHWING/STTER';
    firstTire!.make = 'FORD';
    firstTire!.type = 'Type One';
    return Positioned(
      top: fromTop,
      // right: screenWidth / 4,
      left: fromLeft,
      right: fromRight,
      child: Row(
        mainAxisAlignment:
            isLeft ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          TireItem(
            tire: firstTire,
            width: screenWidth,
            height: height,
            onPress: () {
              if (cubit.firstTire == null) {
                showSheet(
                  context: context,
                  onDropDownChange: (value) {
                    cubit.changeAction(value);
                    Navigator.pop(context);
                  },
                  dropDownValue: cubit.selectedAction,
                );
              }
              cubit.selectFirstTire(firstTire!);
              // ManageTiresCubit.get(context).selectTireToReplace(firstTire!.id!);
            },
          ),
          if (isPair)
            const SizedBox(
              width: 4,
            ),
          if (isPair)
            TireItem(
              tire: secondTire,
              width: screenWidth,
              height: height,
              onPress: () {
                if (cubit.firstTire == null) {
                  showSheet(
                    context: context,
                    dropDownValue: cubit.selectedAction,
                    onDropDownChange: (value) {
                      cubit.changeAction(value);
                      Navigator.pop(context);
                    },
                  );
                }
                cubit.selectFirstTire(secondTire!);
              },
            ),
        ],
      ),
    );
  }
}
