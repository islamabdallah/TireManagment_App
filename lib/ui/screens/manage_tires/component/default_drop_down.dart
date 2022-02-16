import 'package:flutter/material.dart';
import 'package:tire_management/ui/screens/manage_tires/cubit/cubit.dart';

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
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.grey[300]!,
        ),
      ),
      height: 50,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            borderRadius: BorderRadius.circular(12),
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
          ),
        ),
      ),
    );
  }
}
