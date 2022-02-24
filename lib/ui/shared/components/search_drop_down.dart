import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tire_management/ui/shared/constants.dart';

class SearchDropDown extends StatelessWidget {
  List<String> items;
  String hint;
  var onChange;
  SearchDropDown({
    required this.onChange,
    required this.items,
    required this.hint,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: DropdownSearch<String>(
        mode: Mode.DIALOG,
        showSelectedItems: true,
        showSearchBox: true,
        onChanged: onChange,
        items: items,
        searchFieldProps: TextFieldProps(
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
                border: UnderlineInputBorder())),
        dropdownSearchDecoration: InputDecoration(
          // isDense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          hintText: hint,
          filled: true,
          prefixIcon: const Icon(Icons.search),
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(99)),
        ),
      ),
    );
  }
}
