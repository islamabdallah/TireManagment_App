import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tire_management/ui/screens/login/cubit/cubit.dart';
import 'package:tire_management/ui/shared/constants.dart';

class DefualtTextField extends StatelessWidget {
  TextEditingController controller;
  TextInputType keyboardType;
  String? hint;
  bool isPassword;
  DefualtTextField({
    this.hint = '',
    required this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      cursorColor: mainColor,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: isPassword
            ? IconButton(
                onPressed: () {
                  LoginCubit.get(context).changeTextVisibility(
                      !LoginCubit.get(context).isTextVisible);
                },
                icon: isPassword && !LoginCubit.get(context).isTextVisible
                    ? Icon(
                        Icons.visibility_off_outlined,
                        color: Colors.grey,
                        size: isTaplet ? 60 : 25,
                      )
                    : Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.grey,
                        size: isTaplet ? 60 : 25,
                      ),
              )
            : null,
        // hintStyle: TextStyle(
        //   color: appGreyColor,
        // ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFB6B4B4),
            width: isTaplet ? 3 : 1.5,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFB6B4B4),
            width: isTaplet ? 3 : 1.5,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: Color(0xFFB6B4B4),
          width: isTaplet ? 3 : 1.5,
        )),
        errorStyle: TextStyle(
          fontSize: 16.sp,
        ),
        hintStyle: TextStyle(
          fontSize: 16.sp,
        ),
      ),
      obscureText:
          isPassword && !LoginCubit.get(context).isTextVisible ? true : false,
      //textAlign: !isProfile ? TextAlign.center : TextAlign.start,
      validator: (String? value) {
        if (value!.isEmpty) return '$hint is required';
        return null;
      },
      style: TextStyle(
        fontSize: 16.sp,
      ),
    );
  }
}
