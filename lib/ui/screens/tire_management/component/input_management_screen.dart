import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tire_management/ui/shared/constants.dart';

class InputTierInfo extends StatelessWidget {
  final String title;
  final Color color;
  final TextEditingController controller;
  const InputTierInfo({Key? key,
    required this.title,
    required this.color,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          height: 56.w,
          width: 66.w,
          child: TextFormField(
            controller: controller,
            cursorColor: mainColor,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: color,
                ),
                borderRadius: BorderRadius.circular(5.w),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: color),
                borderRadius: BorderRadius.circular(5.w),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: color,
                ),
                borderRadius: BorderRadius.circular(5.w),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) return 'required';
              return null;
            },
          ),
        ),
      ],
    );
  }
}
