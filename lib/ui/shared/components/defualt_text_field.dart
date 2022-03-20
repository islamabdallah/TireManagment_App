import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tire_management/ui/modules/login/cubit/cubit.dart';
import 'package:tire_management/ui/shared/constants.dart';

class DefualtTextField extends StatelessWidget {
  TextEditingController controller;
  TextInputType keyboardType;
  String? hint;
  String? label;
  bool isPassword;
  bool obscureText;

  DefualtTextField({
    this.hint,
    this.label,
    required this.controller,
    this.isPassword = false,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [

        Container(
          height: 50.h,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: Color(0x70000000),
                blurRadius: 10.r,
                offset: Offset(0, 4.h),
              ),
            ],
          ),
        ),
        TextFormField(
          controller: controller,
          style: TextStyle(
              color: const Color(0xff767676),
              fontWeight: FontWeight.w400,
              fontFamily: "Roboto",
              fontStyle: FontStyle.normal,
              fontSize: 18.0.sp),
          obscureText: obscureText,
          validator: (String? value) {
            if (value!.isEmpty) return 'required';
            return null;
          },

          decoration: InputDecoration(
            isDense: true,
            fillColor: Colors.white,
            filled: true,
            labelText: label,
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

            suffixIconConstraints: BoxConstraints(maxHeight: 30.h,minWidth: 30.w),
            suffixIcon: isPassword
                ? Material(
              color: Colors.transparent,
              child: IconButton(
                highlightColor: Colors.transparent,
                splashRadius: 40.r,
                splashColor: Colors.green,
                padding: EdgeInsets.zero,
                onPressed: () {
                  LoginCubit.get(context).changeTextVisibility(
                      !LoginCubit.get(context).isTextVisible);
                },
                icon: isPassword && !LoginCubit.get(context).isTextVisible
                    ? Icon(
                  Icons.visibility_off_outlined,
                  color: Colors.grey,
                  size: 30.r,
                )
                    : Icon(
                  Icons.remove_red_eye_outlined,
                  color: Colors.grey,
                  size: 30.r,
                ),
              ),
            )
                : null,
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
        ),

        // TextFormField(
        //   autovalidateMode: AutovalidateMode.always,
        //   // textAlignVertical: TextAlignVertical.center,
        //   controller: controller,
        //   keyboardType: keyboardType,
        //   cursorColor: mainColor,
        //   decoration: InputDecoration(
        //     fillColor: Colors.white,
        //     filled: true,
        //     contentPadding:
        //         EdgeInsets.symmetric(vertical: 0.h, horizontal: 10.w),
        //     labelText: label,
        //     hintText: hint,
        //     // isDense: true,
        //     floatingLabelBehavior: FloatingLabelBehavior.always,
        //     labelStyle: TextStyle(
        //         color: const Color(0xff767676),
        //         fontWeight: FontWeight.w400,
        //         fontFamily: "Roboto",
        //         fontStyle: FontStyle.normal,
        //         fontSize: 16.0.sp),
        //     // suffixIconConstraints: BoxConstraints(maxHeight: 50.h),
        //     suffixIcon: isPassword
        //         ? Padding(
        //             padding: EdgeInsets.only(right: 8.w),
        //             child: Material(
        //               color: Colors.transparent,
        //               child: IconButton(
        //                 highlightColor: Colors.transparent,
        //                 splashRadius: 40.r,
        //                 splashColor: Colors.green,
        //                 padding: EdgeInsets.zero,
        //                 onPressed: () {
        //                   LoginCubit.get(context).changeTextVisibility(
        //                       !LoginCubit.get(context).isTextVisible);
        //                 },
        //                 icon:
        //                     isPassword && !LoginCubit.get(context).isTextVisible
        //                         ? Icon(
        //                             Icons.visibility_off_outlined,
        //                             color: Colors.grey,
        //                             size: 30.r,
        //                           )
        //                         : Icon(
        //                             Icons.remove_red_eye_outlined,
        //                             color: Colors.grey,
        //                             size: 30.r,
        //                           ),
        //               ),
        //             ),
        //           )
        //         : null,
        //     border: OutlineInputBorder(
        //       borderSide: BorderSide(
        //         color: Color(0xFFB6B4B4),
        //       ),
        //     ),
        //     focusedBorder: OutlineInputBorder(
        //       borderSide: BorderSide(
        //         color: Color(0xFFB6B4B4),
        //       ),
        //     ),
        //     enabledBorder: OutlineInputBorder(
        //         borderSide: BorderSide(
        //       color: Color(0xFFB6B4B4),
        //     )),
        //     errorStyle: TextStyle(
        //       fontSize: 16.sp,
        //     ),
        //     hintStyle: TextStyle(
        //       fontSize: 18.sp,
        //     ),
        //   ),
        //   obscureText: obscureText,
        //   validator: (String? value) {
        //     if (value!.isEmpty) return '$hint is required';
        //     return null;
        //   },
        //   style: TextStyle(
        //       height: 0,
        //       color: const Color(0xff767676),
        //       fontWeight: FontWeight.w400,
        //       fontFamily: "Roboto",
        //       fontStyle: FontStyle.normal,
        //       fontSize: 18.0.sp),
        // ),
      ],
    );
  }
}
