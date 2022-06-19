import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tire_management/ui/shared/constants.dart';

class SearchDropDown extends StatelessWidget {
  List<String> items;
  String hint;
  var onChange;
  String? value;
  bool? isTruck =false;

  // Widget Function<T>(BuildContext, String, bool)? popupItemBuilder;
  String? Function(String? value) miniDetails;

  SearchDropDown({
    Key? key,
    required this.onChange,
    required this.items,
    required this.hint,
    this.isTruck,
    this.value,
    required this.miniDetails,
  }) : super(key: key);

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
            emptyBuilder: (context, _) => Center(
              child: Text(
                'No data found',
                style: TextStyle(
                    color: const Color(0xff767676),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Roboto",
                    fontStyle: FontStyle.normal,
                    fontSize: 18.0.sp),
              ),
            ),
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
                              fontSize: 20.0.sp),
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
                          fontSize: 20.0.sp),
                    );
            },

            //decoration of the dropdown menu,dialog search widget
            searchFieldProps: TextFieldProps(
              style: TextStyle(
                  color: const Color(0xff767676),
                  fontWeight: FontWeight.w400,
                  fontFamily: "Roboto",
                  fontStyle: FontStyle.normal,
                  fontSize: 22.0.sp),
              decoration: InputDecoration(
                isDense: true,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                prefixIcon: Icon(
                  Icons.search,
                  size: 30.r,
                ),
                prefixIconConstraints:
                    BoxConstraints(maxHeight: 50.h, minWidth: 50.w),

                hintText: 'Search',
                hintStyle: TextStyle(
                    color: const Color(0xff767676),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Roboto",
                    fontStyle: FontStyle.normal,
                    fontSize: 22.0.sp),
                border: const UnderlineInputBorder(),
                // border: InputBorder.none,
              ),
            ),

            // popupItemBuilder: popupItemBuilder,
            popupItemBuilder: (_, text, isSelected) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 21.0.w,vertical: 21.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            text,
                            style: TextStyle(
                                color: isSelected ? mainColor : Colors.black,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Roboto",
                                fontStyle: FontStyle.normal,
                                fontSize: 20.0.sp),
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        miniDetails(text) != null
                            ? Expanded(
                                child: FittedBox(
                                  alignment: Alignment.centerLeft,
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    miniDetails(text) ?? '',
                                    style: TextStyle(
                                        color:
                                            isSelected ? mainColor : Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Roboto",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 18.0.sp),
                                   textAlign: TextAlign.left,
                                  ),
                                ),
                              )
                            : Text('na'),
                      ],
                    ),
                    if(text!=items.last && isTruck==false)
                    ...[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical:8.0.h),
                      child: Divider(
                        color: Colors.black45,
                      ),
                    ),
                    ]
                  ],
                ),
              );
            },

            //suffix button
            dropDownButton: Icon(Icons.arrow_drop_down,
                color: Color(0xff767676), size: 30.r),
            showAsSuffixIcons: true,

            //decoration of the input widget
            dropdownSearchDecoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                  color: const Color(0xff767676),
                  fontWeight: FontWeight.w400,
                  fontFamily: "Roboto",
                  fontStyle: FontStyle.normal,
                  fontSize: 20.0.sp),
              isDense: true,
              fillColor: Colors.white,
              filled: true,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15.h, horizontal: 0.w),
              // suffixIconConstraints: BoxConstraints(maxHeight: 30.h,minWidth: 30.w),
              prefixIconConstraints:
                  BoxConstraints(maxHeight: 30.h, minWidth: 50.w),
              prefixIcon: Icon(
                Icons.search,
                size: 30.h,
              ),
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
