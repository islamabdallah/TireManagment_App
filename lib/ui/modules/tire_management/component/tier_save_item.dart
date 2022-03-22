import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tire_management/ui/modules/tire_management/component/input_management_screen.dart';
import 'package:tire_management/ui/modules/tire_management/cubit/cubit.dart';
import 'package:tire_management/ui/modules/tire_management/cubit/states.dart';
import 'package:tire_management/ui/modules/tire_management/models/tire_model.dart';
import 'package:tire_management/ui/modules/tire_management/models/tire_position_model.dart';
import 'package:tire_management/ui/shared/components/default_drop_down.dart';
import '../../../shared/components/defualt_text_field.dart';
import '../../../shared/components/note_text.dart';
import 'package:tire_management/ui/shared/constants.dart';

import 'tire.dart';

class TierDetailItem extends StatelessWidget {
  String title;
  String value;
  bool isOLd;
  TierDetailItem({
    required this.title,
    required this.value,
    this.isOLd = false,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            color: mainColor,
            fontWeight: FontWeight.w700,
            fontFamily: "Roboto",
            fontStyle:  FontStyle.normal,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.grey,
            decoration: isOLd ? TextDecoration.lineThrough : null,
          ),
        ),
      ],
    );
  }
}

class TierDetails extends StatelessWidget {
  String serial;
  String oldPosition;
  String newPosition;
  bool isOld;
  String? dropdownValue;
  TextEditingController c1;
  TextEditingController c2;
  TextEditingController c3;
  Tire? data;

  var dropdownOnChange;
  TierDetails({
    required this.serial,
    required this.newPosition,
    required this.oldPosition,
    required this.c1,
    required this.c2,
    required this.c3,
    this.isOld = false,
    this.dropdownValue,
    this.dropdownOnChange,
    required this.data,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            TierWidget(data:data,isNew: oldPosition.isEmpty?true:false),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TierDetailItem(
                  title: 'Serial  : ',
                  value: serial,
                ),
                TierDetailItem(
                  title: 'Old Position : ',
                  value: oldPosition.isEmpty? 'new':oldPosition,
                  isOLd: true,
                ),
                TierDetailItem(
                  title: 'New Position : ',
                  value: newPosition,
                ),
              ],
            ),

          ],
        ),

        SizedBox(
          height: 20.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SizedBox(
                width: 143.w,
                child: DefualtTextField(
                  controller: c1,
                  label: 'STD Depth',
                ),
              ),
            ),
            SizedBox(
              width: 23.w,
            ),
            Expanded(
              child: SizedBox(
                width: 143.w,
                child: DefualtTextField(
                  controller: c2,
                  label: 'Current Depth  ',
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            Expanded(
              child: DefualtTextField(
                controller: c3,
                label: 'Distance ',
              ),
            ),
            SizedBox(
              width: 10.h,
            ),
            if (isOld)
              Expanded(
                child: BlocConsumer<TiersManageCubit, TiresManageStates>(
                  listener: (context, state) {},
                  builder: (context, state) => DefaultDropdownField(
                    onChange: (value) {
                      TiersManageCubit.get(context).selectOldTiersStatus(value);
                    },
                    hint: 'Status',
                    items: const ['Damaged', 'Retread'],
                    value: TiersManageCubit.get(context).oldTierStatus,
                    isExpand: true,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
