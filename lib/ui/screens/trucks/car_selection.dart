import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:tire_management/ui/screens/trucks/cubit/cubit.dart';
import 'package:tire_management/ui/screens/trucks/cubit/states.dart';
import 'package:tire_management/ui/shared/constants.dart';

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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100.w,
                      height: 25.h,
                      color: defaultColor,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
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
                        padding: EdgeInsets.only(left: 6.w,right: 6.w,top: 5.h),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      FittedBox(
                                        child: Text(
                                          'Model',
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              color: greyColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      FittedBox(
                                        child: Text(
                                          cubit.selectedTruck.truckNumber!,
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              color: defaultColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      FittedBox(
                                        child: Text(
                                          cubit.selectedTruck.truckName!,
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              color: defaultColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    height: 20.h,
                                    child: SvgPicture.asset(
                                      'assets/images/truck3.svg',
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 5.h),
                            IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      const CircleAvatar(
                                        backgroundColor: defaultColor,
                                        radius: 10,
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              top: 2, bottom: 2),
                                          width: 2,
                                          color: defaultColor,
                                        ),
                                      ),
                                      const CircleAvatar(
                                        backgroundColor: defaultColor,
                                        radius: 10,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        buildContent('Company', cubit.selectedTruck.company!,),
                                        SizedBox(height: 5.h),
                                        buildContent('Status',   cubit.selectedTruck.status!,),
                                        SizedBox(height: 5.h),
                                        buildContent('Size', '${cubit.selectedTruck.size} ${cubit.selectedTruck.unit}'),
                                        SizedBox(height: 5.h),
                                        buildContent('Engine', cubit.selectedTruck.engine!),
                                        SizedBox(height: 5.h),
                                        buildContent('Chassis', cubit.selectedTruck.chassis!),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 5.w,),
                                  Expanded(
                                    child: Column(
                                      // mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        buildContent(
                                            'Year', '${cubit.selectedTruck.year}'),
                                        SizedBox(height: 5.h),
                                        buildContent('Type', cubit.selectedTruck.type!),
                                        SizedBox(height: 5.h),
                                        buildContent('No. of Axle', '${cubit.selectedTruck.axleCount}'),
                                        SizedBox(height: 5.h),
                                        buildContent('Reg NO.', cubit.selectedTruck.registration!),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Center(
                              child: Container(
                                width: 60.w,
                                height: 8.h,
                                margin: EdgeInsets.all(5.w),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(),
                                    primary: defaultColor,
                                  ),
                                  child: Text(
                                    'Manage Tires',
                                    style: TextStyle(fontSize: 16.sp),
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
                fontSize: 18.sp, color: greyColor, fontWeight: FontWeight.bold),
          ),
        ),
        FittedBox(
          child: Text(
            value,
            style: TextStyle(
                fontSize: 18.sp,
                color: defaultColor,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
