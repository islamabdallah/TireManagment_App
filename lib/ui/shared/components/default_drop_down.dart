import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';

class DefaultDropdownField extends StatelessWidget {
  String? value;
  var onChange;
  List<String> items;
  bool inSheet;
  bool isExpand;
  String hint;
  DefaultDropdownField({
    required this.value,
    required this.items,
    this.isExpand = true,
    this.inSheet = true,
    required this.onChange,
    this.hint = 'Select Action',
  });

  @override
  Widget build(BuildContext context) {
    //var cubit = ManageTiresCubit.get(context);
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 50.h,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: Color(0x70000000),
                blurRadius: 8,
                offset: Offset(0, 4.h),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 50.h,
          child: DropdownButtonFormField<String>(
            iconSize: 5.r,
            style: TextStyle(
                color: const Color(0xff767676),
                fontWeight: FontWeight.w400,
                fontFamily: "Roboto",
                fontStyle: FontStyle.normal,
                fontSize: 18.0.sp),
            decoration: InputDecoration(
              isDense: true,
              fillColor: Colors.white,
              filled: true,
              labelText: hint,
              floatingLabelStyle: TextStyle(
                  color: const Color(0xff767676),
                  fontWeight: FontWeight.w400,
                  fontFamily: "Roboto",
                  fontStyle: FontStyle.normal,
                  fontSize: 16.0.sp),
              labelStyle: TextStyle(
                  color: const Color(0xff767676),
                  fontWeight: FontWeight.w400,
                  fontFamily: "Roboto",
                  fontStyle: FontStyle.normal,
                  fontSize: 18.0.sp),
              contentPadding:
              EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),

              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: mainColor,
                ),
              ),

              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFB6B4B4),
                ),
              ),
            ),
            value: value,
            onChanged: onChange,
            isExpanded: isExpand,
            isDense: true,
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            validator: (value) => value == null ? 'field required' : null,
          ),
        ),
      ],
    );
  }
}
