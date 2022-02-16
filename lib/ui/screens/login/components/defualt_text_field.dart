import 'package:flutter/material.dart';
import 'package:tire_management/ui/screens/login/cubit/cubit.dart';

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
      cursorColor: Colors.indigo.shade900,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: isPassword
            ? IconButton(
                onPressed: () {
                  LoginCubit.get(context).changeTextVisibility(
                      !LoginCubit.get(context).isTextVisible);
                },
                icon: isPassword && !LoginCubit.get(context).isTextVisible
                    ? const Icon(
                        Icons.visibility_off_outlined,
                        color: Colors.grey,
                      )
                    : const Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.grey,
                      ),
              )
            : null,
        // hintStyle: TextStyle(
        //   color: appGreyColor,
        // ),
        border: const UnderlineInputBorder(
            borderSide: BorderSide(
          color: Color(0xFFB6B4B4),
          width: 1.5,
        )),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFB6B4B4),
            width: 1.5,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: Color(0xFFB6B4B4),
          width: 1.5,
        )),
      ),
      obscureText:
          isPassword && !LoginCubit.get(context).isTextVisible ? true : false,
      //textAlign: !isProfile ? TextAlign.center : TextAlign.start,
      validator: (String? value) {
        if (value!.isEmpty) return '$hint is required';
        return null;
      },
    );
  }
}
