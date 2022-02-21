import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tire_management/core/utils/services/local/cache_helper.dart';
import 'package:tire_management/ui/screens/trucks/cubit/cubit.dart';
import 'package:tire_management/ui/screens/trucks/cubit/states.dart';
import 'package:tire_management/ui/shared/constants.dart';

import '../../shared/utils/navigations.dart';
import '../tire_management/tire_management_screen.dart';

class CarSelectionScreen extends StatefulWidget {
  const CarSelectionScreen({Key? key}) : super(key: key);

  @override
  _CarSelectionScreenState createState() => _CarSelectionScreenState();
}

class _CarSelectionScreenState extends State<CarSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TruckCubit()..getHomeData(),
      child: BlocConsumer<TruckCubit, TrucksStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = TruckCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 1.sw,
                    height: 0.25.sh,
                    color: defaultColor,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: DropdownSearch<String>(
                          mode: Mode.DIALOG,
                          showSelectedItems: true,
                          showSearchBox: true,
                          onChanged: (value) => cubit.selectTruck(value),
                          items: cubit.trucksDropdownList,
                          searchFieldProps: TextFieldProps(
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.search),
                                  hintText: 'Search',
                                  border: UnderlineInputBorder())),
                          dropdownSearchDecoration: InputDecoration(
                            // isDense: true,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 16),
                            hintText: 'Chose truck',
                            filled: true,
                            prefixIcon: const Icon(Icons.search),
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(99)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (state is SelectTruckState)
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.w, vertical: 16.h),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FittedBox(
                                      child: Text(
                                        'Model',
                                        style: TextStyle(
                                            fontSize: 32.sp,
                                            color: greyColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    FittedBox(
                                      child: Text(
                                        cubit.selectedTruck.truckNumber!,
                                        style: TextStyle(
                                            fontSize: 28.sp,
                                            color: defaultColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    FittedBox(
                                      child: Text(
                                        cubit.selectedTruck.truckName!,
                                        style: TextStyle(
                                            fontSize: 28.sp,
                                            color: defaultColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: 120.h,
                                  child: SvgPicture.asset(
                                    'assets/images/truck3.svg',
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 370.h,
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: defaultColor,
                                      radius: 15.r,
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: 2.w,
                                        color: defaultColor,
                                      ),
                                    ),
                                    CircleAvatar(
                                      backgroundColor: defaultColor,
                                      radius: 15.r,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    buildContent(
                                      'Company',
                                      cubit.selectedTruck.company!,
                                    ),
                                    SizedBox(height: 5.h),
                                    buildContent(
                                      'Status',
                                      cubit.selectedTruck.status!,
                                    ),
                                    SizedBox(height: 5.h),
                                    buildContent('Size',
                                        '${cubit.selectedTruck.size} ${cubit.selectedTruck.unit}'),
                                    SizedBox(height: 5.h),
                                    buildContent(
                                        'Engine', cubit.selectedTruck.engine!),
                                    SizedBox(height: 5.h),
                                    buildContent('Chassis',
                                        cubit.selectedTruck.chassis!),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Expanded(
                                child: Column(
                                  // mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    buildContent(
                                        'Year', '${cubit.selectedTruck.year}'),
                                    SizedBox(height: 5.h),
                                    buildContent(
                                        'Type', cubit.selectedTruck.type!),
                                    SizedBox(height: 5.h),
                                    buildContent('No. of Axle',
                                        '${cubit.selectedTruck.axleCount}'),
                                    SizedBox(height: 5.h),
                                    buildContent('Reg NO.',
                                        cubit.selectedTruck.registration!),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Center(
                            child: Container(
                              width: 300.w,
                              height: 50.h,
                              margin: EdgeInsets.all(5.w),
                              child: ElevatedButton(
                                onPressed: () {
                                  CacheHelper.saveData(
                                      key: 'truckNumber',
                                      value: cubit.selectedTruck.truckNumber);
                                  navigateAndFinish(
                                    context: context,
                                    nextScreen: const Car(),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(),
                                  primary: defaultColor,
                                ),
                                child: Text(
                                  'Manage Tires',
                                  style: TextStyle(fontSize: 26.sp),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  if (state is GetTrucksLoadingState)
                    const CircularProgressIndicator(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildContent(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 26.sp, color: greyColor, fontWeight: FontWeight.bold),
          ),
        ),
        FittedBox(
          child: Text(
            value,
            style: TextStyle(
                fontSize: 26.sp,
                color: defaultColor,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
