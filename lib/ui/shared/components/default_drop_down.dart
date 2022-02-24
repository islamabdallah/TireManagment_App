import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.w),
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.w),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.w),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
      value: value,
      hint: Text(
        hint,
      ),
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
    );
  }
}
