import 'package:flutter/material.dart';

class DefaultDropdownField extends StatelessWidget {
  String hintText;
  String? selectedValue;
  List<String> itemsList;
  var onChange;
  bool isExpanded;
  DefaultDropdownField({
    required this.hintText,
    required this.itemsList,
    required this.selectedValue,
    required this.onChange,
    this.isExpanded = true,
  });

  @override
  Widget build(BuildContext context) {
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
          child: DropdownButtonFormField<String>(
            value: selectedValue,
            hint: Text(
              hintText,
            ),
            onChanged: onChange,
            isExpanded: isExpanded,
            items: itemsList.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            validator: (value) => value == null ? 'field required' : null,
          ),
        ),
      ),
    );
  }
}
