import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tire_management/ui/shared/constants.dart';

class SearchDropDown extends StatelessWidget {
  List<String> items;
  String hint;
  var onChange;
  String? value;

  SearchDropDown({
    required this.onChange,
    required this.items,
    required this.hint,
    this.value,
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
              BoxShadow(
                color: Color(0x70000000),
                blurRadius: 10.r,
                offset: Offset(0, 4.h),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 50.h,
          child: DropdownSearch<String>(
            mode: Mode.DIALOG,
            showSelectedItems: true,
            showSearchBox: true,
            onChanged: onChange,
            items: items,
            selectedItem: value,
            dropdownBuilder: (context, text) {
              return text != null
                  ? Row(
                    children: [
                      Text(
                          text,
                          style: TextStyle(
                              color: const Color(0xff767676),
                              fontWeight: FontWeight.w400,
                              fontFamily: "Roboto",
                              fontStyle: FontStyle.normal,
                              fontSize: 18.0.sp),
                        ),
                    ],
                  )
                  : Text(
                      hint,
                      style: TextStyle(
                          color: const Color(0xff767676),
                          fontWeight: FontWeight.w400,
                          fontFamily: "Roboto",
                          fontStyle: FontStyle.normal,
                          fontSize: 18.0.sp),
                    );
            },
            //decoration of the dropdown menu,dialog widget
            searchFieldProps: TextFieldProps(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search',
                    border: UnderlineInputBorder())),

            //suffix button
            dropDownButton: Icon(Icons.arrow_drop_down,color: Color(0xff767676),size: 30.r),

            //decoration of the input widget
            dropdownSearchDecoration: InputDecoration(
              // isDense: true,
              hintText: hint,

              hintStyle: TextStyle(
                  color: const Color(0xff767676),
                  fontWeight: FontWeight.w400,
                  fontFamily: "Roboto",
                  fontStyle: FontStyle.normal,
                  fontSize: 18.0.sp),
              isDense: true,
              fillColor: Colors.white,
              filled: true,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.h, horizontal: 0.w),

              // suffixIconConstraints: BoxConstraints(maxHeight: 30.h,minWidth: 30.w),
              // prefixIconConstraints: BoxConstraints(maxHeight: 30.h,minWidth: 30.w),
              prefixIcon: Icon(Icons.search,size: 30.h,),
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
        ),
      ],
    );
  }
}
