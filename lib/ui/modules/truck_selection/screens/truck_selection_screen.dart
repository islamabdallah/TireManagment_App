import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tire_management/core/utils/services/local/cache_helper.dart';
import 'package:tire_management/ui/shared/components/defualt_button.dart';

import 'package:tire_management/ui/shared/constants.dart';

import '../../../shared/components/default_drop_down.dart';
import '../../../shared/components/drawer_widget.dart';
import '../../../shared/components/search_drop_down.dart';
import '../../../shared/utils/navigations.dart';
import '../../tire_management/screens/tire_management_screen.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
import 'gallery_screen.dart';

class TruckSelectionScreen extends StatefulWidget {
  static const routeName = 'TruckSelectionScreen';

  const TruckSelectionScreen({Key? key}) : super(key: key);

  @override
  _TruckSelectionScreenState createState() => _TruckSelectionScreenState();
}

class _TruckSelectionScreenState extends State<TruckSelectionScreen> {
  final keyTextStyle = TextStyle(
      color: const Color(0xff293064),
      fontWeight: FontWeight.w600,
      fontFamily: "Roboto",
      fontStyle: FontStyle.normal,
      fontSize: 16.0.sp);
  final valueTextStyle = TextStyle(
      color: const Color(0xff878787),
      fontWeight: FontWeight.w400,
      fontFamily: "Roboto",
      fontStyle: FontStyle.normal,
      fontSize: 16.0.sp);

  Row buildRow(String key, String? value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          key,
          style: keyTextStyle,
        ),
        Text(
          value ?? '-',
          style: valueTextStyle,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TruckCubit, TrucksStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = TruckCubit.get(context);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          drawer: const DrawerWidget(),
          body: Stack(
            clipBehavior: Clip.none,
            children: [
              SizedBox(
                width: 412.w,
                height: 306.5.h,
                child: SvgPicture.asset(
                  'assets/images/e1.svg',
                  width: 412.w,
                  height: 306.5.h,
                  fit: BoxFit.fill,
                ),
                // ,child: SvgPicture.asset(
                //   'assets/e1.svg',
                // ),
              ),
              if (state is! SelectTruckState) ...[
                Builder(builder: (context) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 14.w, vertical: 44.h),
                    child: IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      iconSize: 35.h,
                      icon: SvgPicture.asset(
                        'assets/images/menu.svg',
                        // fit: BoxFit.cover,
                        width: 35.h,
                        height: 35.h,
                      ),
                    ),
                  );
                }),
                Positioned(
                  top: 173.h,
                  left: 20.w,
                  child: Text(
                    "Welcome ${userData?.name} !",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.sp,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 70.h,
                  width: 1.sw,
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          "Powered by",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18.sp,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Image.asset(
                          'assets/images/cemex.jpg',
                          width: 90.w,
                          fit: BoxFit.fitWidth,
                        )
                      ],
                    ),
                  ),
                ),
              ],
              state is! SelectTruckState
                  ? SizedBox(
                      width: 412.w,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Image.asset(
                                    'assets/images/manpng.png',
                                    width: 192.w,
                                    // fit: BoxFit.cover,
                                  ),
                                  SizedBox(width: 10.w),
                                  SizedBox(
                                    width: 180.w,
                                    child: Text("",
                                        style: TextStyle(
                                            color: const Color(0xff293064),
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Roboto",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 24.0.sp),
                                        textAlign: TextAlign.left),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: SearchDropDown(
                                isTruck: true,
                                  items: cubit.trucksDropdownList,
                                  onChange: (value) => cubit.selectTruck(value),
                                  hint: 'Select Truck',
                                  miniDetails: (value) =>
                                      cubit.getTruckMiniDetails(value)),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 44.h,
                        ),
                        Builder(builder: (context) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 14.w),
                            child: IconButton(
                              onPressed: () {
                                Scaffold.of(context).openDrawer();
                              },
                              iconSize: 35.h,
                              icon: SvgPicture.asset(
                                'assets/images/menu.svg',
                                // fit: BoxFit.cover,
                                width: 35.h,
                                height: 35.h,
                              ),
                            ),
                          );
                        }),
                        SizedBox(
                          height: 24.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: SearchDropDown(
                                isTruck: true,
                                items: cubit.trucksDropdownList,
                                onChange: (value) => cubit.selectTruck(value),
                                value: cubit.selectedTruck.truckNumber,
                                miniDetails: (value) =>
                                    cubit.getTruckMiniDetails(value),
                                hint: 'Select Truck',
                              ),
                              // child: DropdownSearch<String>(
                              //   mode: Mode.DIALOG,
                              //   showSelectedItems: true,
                              //   showSearchBox: true,
                              //   onChanged: (value) => cubit.selectTruck(value),
                              //   items: cubit.trucksDropdownList,
                              //   searchFieldProps: TextFieldProps(
                              //       decoration: const InputDecoration(
                              //           prefixIcon: Icon(Icons.search),
                              //           hintText: 'Search',
                              //           border: UnderlineInputBorder())),
                              //   dropdownSearchDecoration: const InputDecoration(
                              //     // isDense: true,
                              //     contentPadding:
                              //         EdgeInsets.symmetric(horizontal: 16),
                              //     hintText: 'Chose truck',
                              //     filled: true,
                              //     prefixIcon: Icon(Icons.search),
                              //     fillColor: Colors.white,
                              //     enabledBorder: OutlineInputBorder(
                              //       borderSide: BorderSide(
                              //         color: Color(0xFFB6B4B4),
                              //       ),
                              //     ),
                              //     focusedBorder: OutlineInputBorder(
                              //       borderSide: BorderSide(
                              //         color: mainColor,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 42.h,
                        ),
                        if (state is SelectTruckState)
                          Center(
                            child: Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.topCenter,
                              children: [
                                SizedBox(
                                  height: 550.h,
                                  width: 372.w,
                                  // child: Padding(
                                  //   padding: EdgeInsets.fromLTRB(10, 60, 10, 10),
                                  child: Card(
                                    margin: EdgeInsets.zero,
                                    color: Colors.white,
                                    elevation: 8,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.r)),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 14.0.w),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(top: 40.h),
                                            child: Center(
                                              child: FittedBox(
                                                child: Text(
                                                  "${cubit.selectedTruck.truckName!} / ${cubit.selectedTruck.truckNumber!}",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: const Color(
                                                          0xff293064),
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontFamily: "Roboto",
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 22.0.sp),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 14,
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/images/tirecon.svg'),
                                              SizedBox(
                                                width: 8.w,
                                              ),
                                              Text(
                                                "Truck Details",
                                                style: TextStyle(
                                                    decoration: TextDecoration
                                                        .underline,
                                                    color: Color(0xff293064),
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: "Roboto",
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 18.0.sp),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 12,
                                              ),
                                              Container(
                                                height: 290.h,
                                                width: 1.w,
                                                // color: Color(0xFF878787),
                                                color: mainColor,
                                              ),
                                              SizedBox(
                                                width: 22.w,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 12.h,
                                                    ),
                                                    buildRow(
                                                      'Company',
                                                      cubit.selectedTruck
                                                          .truckCompany,
                                                    ),
                                                    SizedBox(height: 14.h),
                                                    buildRow(
                                                        'Status',
                                                        cubit.selectedTruck
                                                            .status),
                                                    SizedBox(height: 14.h),
                                                    buildRow('Size',
                                                        '${cubit.selectedTruck.size} ${cubit.selectedTruck.unit}'),
                                                    SizedBox(height: 14.h),
                                                    buildRow(
                                                        'Engine',
                                                        cubit.selectedTruck
                                                            .engine),
                                                    SizedBox(height: 14.h),
                                                    buildRow(
                                                        'Chassis',
                                                        cubit.selectedTruck
                                                            .chassis),
                                                    SizedBox(height: 14.h),
                                                    buildRow('Year',
                                                        '${cubit.selectedTruck.truckYear}'),
                                                    SizedBox(height: 14.h),
                                                    buildRow(
                                                        'Type',
                                                        cubit.selectedTruck
                                                            .type!),
                                                    SizedBox(height: 14.h),
                                                    buildRow('No. of Axle',
                                                        '${cubit.selectedTruck.axleCount}'),
                                                    SizedBox(height: 14.h),
                                                    buildRow(
                                                        'Reg NO.',
                                                        cubit.selectedTruck
                                                                .registeration ??
                                                            'non'),
                                                    // SizedBox(height: 14.h),
                                                    SizedBox(height: 60.h),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 138.w,
                                                          child: DefaultButton(
                                                              title:
                                                                  'Manage Tires',
                                                              onPressed: () {
                                                                CacheHelper.saveData(
                                                                    key:
                                                                        'truckNumber',
                                                                    value: cubit
                                                                        .selectedTruck
                                                                        .truckNumber);

                                                                Navigator.pushNamed(
                                                                    context,
                                                                    TiersManagementScreen
                                                                        .routeName);
                                                                // navigateTo(
                                                                //   context:
                                                                //       context,
                                                                //   nextScreen:
                                                                //       const TiersManagementScreen(),
                                                                // );
                                                              }),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          // Row(
                                          //   children: [
                                          //     SvgPicture.asset(
                                          //         'assets/images/tirecon.svg'),
                                          //     SizedBox(
                                          //       width: 8.w,
                                          //     ),
                                          //     Text(
                                          //       "Sub Title",
                                          //       style: TextStyle(
                                          //           decoration: TextDecoration
                                          //               .underline,
                                          //           color: Color(0xff293064),
                                          //           fontWeight: FontWeight.w700,
                                          //           fontFamily: "Roboto",
                                          //           fontStyle: FontStyle.normal,
                                          //           fontSize: 18.0.sp),
                                          //     ),
                                          //   ],
                                          // ),
                                          // Row(
                                          //   crossAxisAlignment:
                                          //       CrossAxisAlignment.start,
                                          //   children: [
                                          //     SizedBox(
                                          //       width: 12,
                                          //     ),
                                          //     Container(
                                          //       height: 156.h,
                                          //       width: 1.w,
                                          //       color: Color(0xFF878787),
                                          //     ),
                                          //     SizedBox(
                                          //       width: 22.w,
                                          //     ),
                                          //     Expanded(
                                          //       child: Column(
                                          //         children: [
                                          //           SizedBox(
                                          //             height: 7.h,
                                          //           ),
                                          //           buildRow(
                                          //             'Company',
                                          //             cubit.selectedTruck
                                          //                 .truckCompany,
                                          //           ),
                                          //           SizedBox(height: 14.h),
                                          //           buildRow(
                                          //               'Status',
                                          //               cubit.selectedTruck
                                          //                   .status),
                                          //           SizedBox(height: 14.h),
                                          //           buildRow('Size',
                                          //               '${cubit.selectedTruck.size} ${cubit.selectedTruck.unit}'),
                                          //           SizedBox(height: 14.h),
                                          //           buildRow(
                                          //               'Engine',
                                          //               cubit.selectedTruck
                                          //                   .engine),
                                          //           SizedBox(height: 14.h),
                                          //           buildRow(
                                          //               'Chassis',
                                          //               cubit.selectedTruck
                                          //                   .chassis),
                                          //           SizedBox(height: 52.h),
                                          //           Row(
                                          //             children: [
                                          //               SizedBox(
                                          //                 width: 138.w,
                                          //                 child: DefaultButton(
                                          //                     title:
                                          //                         'Manage Tires',
                                          //                     onPressed: () {
                                          //                       CacheHelper.saveData(
                                          //                           key:
                                          //                               'truckNumber',
                                          //                           value: cubit
                                          //                               .selectedTruck
                                          //                               .truckNumber);
                                          //
                                          //                       Navigator.pushNamed(
                                          //                           context,
                                          //                           TiersManagementScreen
                                          //                               .routeName);
                                          //                       // navigateTo(
                                          //                       //   context:
                                          //                       //       context,
                                          //                       //   nextScreen:
                                          //                       //       const TiersManagementScreen(),
                                          //                       // );
                                          //                     }),
                                          //               ),
                                          //             ],
                                          //           )
                                          //         ],
                                          //       ),
                                          //     ),
                                          //   ],
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  height: 58.h,
                                  top: -29.h,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => GalleryScreen(
                                                    imageUrl: cubit
                                                        .selectedTruck.image,
                                                  )));
                                    },
                                    child: Container(
                                      height: 58.h,
                                      width: 58.h,
                                      decoration: const BoxDecoration(
                                          color: mainColor,
                                          shape: BoxShape.circle),
                                      child: Container(
                                        child: Center(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SvgPicture.asset(
                                                'assets/images/fontisto_truck.svg',
                                                width: 25.h,
                                                height: 25.h,
                                              ),
                                              Text("View",
                                                  style: TextStyle(
                                                      color: const Color(
                                                          0xffffffff),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: "Roboto",
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 14.0.sp),
                                                  textAlign: TextAlign.left),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: -40.h,
                                  right: -20.w,
                                  height: 200.h,
                                  child: Container(
                                    padding: EdgeInsets.zero,
                                    margin: EdgeInsets.zero,
                                    child: Image.asset(
                                        'assets/images/concrete_truck.png'),
                                  ),
                                ),
                                // Positioned(
                                //   bottom: - 60.h,
                                //   left: 0,
                                //   child: Container(
                                //     height: 200.h,
                                //     width: 280.w,
                                //     color: Colors.green,
                                //     padding: EdgeInsets.zero,
                                //     margin: EdgeInsets.zero,
                                //     child: Center(
                                //       child: SizedBox(
                                //         width: 150.w,
                                //         child: DefaultButton(
                                //           title: 'Manage Tires',
                                //           onPressed: () {},
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                      ],
                    ),
              // Positioned(
              //   bottom: 50,
              //   right: 0,
              //   child: Container(
              //     height: 249.h,
              //     padding: EdgeInsets.zero,
              //     margin: EdgeInsets.zero,
              //     child: Image.asset('assets/concrete_truck.png'),
              //   ),
              // ),
              // Positioned(
              //   bottom: 50,
              //   left: 0,
              //   child: Container(
              //     height: 249.h,
              //     width: 200.w,
              //     padding: EdgeInsets.zero,
              //     margin: EdgeInsets.zero,
              //     child: Center(
              //         child: ElevatedButton(
              //       onPressed: () {},
              //       child: Text(''),
              //     )),
              //   ),
              // ),
            ],
          ),
          // body: SafeArea(
          //   child: Column(
          //     mainAxisSize: MainAxisSize.min,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Container(
          //         width: 1.sw,
          //         height: 0.25.sh,
          //         color: defaultColor,
          //         child: Center(
          //           child: Padding(
          //             padding: EdgeInsets.symmetric(horizontal: 20.w),
          //             child: DropdownSearch<String>(
          //               mode: Mode.DIALOG,
          //               showSelectedItems: true,
          //               showSearchBox: true,
          //               onChanged: (value) => cubit.selectTruck(value),
          //               items: cubit.trucksDropdownList,
          //               searchFieldProps: TextFieldProps(
          //                   decoration: const InputDecoration(
          //                       prefixIcon: Icon(Icons.search),
          //                       hintText: 'Search',
          //                       border: UnderlineInputBorder())),
          //               dropdownSearchDecoration: InputDecoration(
          //                 // isDense: true,
          //                 contentPadding:
          //                     const EdgeInsets.symmetric(horizontal: 16),
          //                 hintText: 'Chose truck',
          //                 filled: true,
          //                 prefixIcon: const Icon(Icons.search),
          //                 fillColor: Colors.white,
          //                 border: OutlineInputBorder(
          //                     borderRadius: BorderRadius.circular(99)),
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //       if (state is SelectTruckState)
          //         Padding(
          //           padding: EdgeInsets.symmetric(
          //               horizontal: 15.w, vertical: 16.h),
          //           child: Column(
          //             children: [
          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
          //                 children: [
          //                   Expanded(
          //                     child: Column(
          //                       crossAxisAlignment: CrossAxisAlignment.start,
          //                       children: [
          //                         FittedBox(
          //                           child: Text(
          //                             'Model',
          //                             style: TextStyle(
          //                                 fontSize: 32.sp,
          //                                 color: greyColor,
          //                                 fontWeight: FontWeight.bold),
          //                           ),
          //                         ),
          //                         FittedBox(
          //                           child: Text(
          //                             cubit.selectedTruck.truckNumber!,
          //                             style: TextStyle(
          //                                 fontSize: 28.sp,
          //                                 color: defaultColor,
          //                                 fontWeight: FontWeight.bold),
          //                           ),
          //                         ),
          //                         FittedBox(
          //                           child: Text(
          //                             cubit.selectedTruck.truckName!,
          //                             style: TextStyle(
          //                                 fontSize: 28.sp,
          //                                 color: defaultColor,
          //                                 fontWeight: FontWeight.bold),
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                   Expanded(
          //                     child: SizedBox(
          //                       height: 120.h,
          //                       child: SvgPicture.asset(
          //                         'assets/images/truck3.svg',
          //                       ),
          //                     ),
          //                   )
          //                 ],
          //               ),
          //               SizedBox(height: 20.h),
          //               Row(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   SizedBox(
          //                     height: 370.h,
          //                     child: Column(
          //                       children: [
          //                         CircleAvatar(
          //                           backgroundColor: defaultColor,
          //                           radius: 15.r,
          //                         ),
          //                         Expanded(
          //                           child: Container(
          //                             width: 2.w,
          //                             color: defaultColor,
          //                           ),
          //                         ),
          //                         CircleAvatar(
          //                           backgroundColor: defaultColor,
          //                           radius: 15.r,
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                   SizedBox(
          //                     width: 5.w,
          //                   ),
          //                   Expanded(
          //                     flex: 2,
          //                     child: Column(
          //                       mainAxisSize: MainAxisSize.min,
          //                       crossAxisAlignment: CrossAxisAlignment.start,
          //                       children: [
          //                         buildContent(
          //                           'Company',
          //                           cubit.selectedTruck.truckCompany!,
          //                         ),
          //                         SizedBox(height: 15.h),
          //                         buildContent(
          //                           'Status',
          //                           cubit.selectedTruck.status!,
          //                         ),
          //                         SizedBox(height: 15.h),
          //                         buildContent('Size',
          //                             '${cubit.selectedTruck.size} ${cubit.selectedTruck.unit}'),
          //                         SizedBox(height: 15.h),
          //                         buildContent(
          //                             'Engine', cubit.selectedTruck.engine!),
          //                         SizedBox(height: 15.h),
          //                         buildContent('Chassis',
          //                             cubit.selectedTruck.chassis!),
          //                       ],
          //                     ),
          //                   ),
          //                   SizedBox(
          //                     width: 5.w,
          //                   ),
          //
          //               // Expanded(child: Container(color: Colors.red,width: 100,height: 300,)),
          //
          //                   Expanded(
          //                     child: Column(
          //                       mainAxisSize: MainAxisSize.min,
          //                       crossAxisAlignment: CrossAxisAlignment.start,
          //                       children: [
          //                         buildContent(
          //                             'Year', '${cubit.selectedTruck.truckYear}'),
          //                         SizedBox(height: 15.h),
          //                         buildContent(
          //                             'Type', cubit.selectedTruck.type!),
          //                         SizedBox(height: 15.h),
          //                         buildContent('No. of Axle',
          //                             '${cubit.selectedTruck.axleCount}'),
          //                         SizedBox(height: 15.h),
          //                         buildContent('Reg NO.',
          //                             cubit.selectedTruck.registration??'non'),
          //                       ],
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //               SizedBox(height: 10.h),
          //               Center(
          //                 child: Container(
          //                   width: 300.w,
          //                   height: 50.h,
          //                   margin: EdgeInsets.all(5.w),
          //                   child: ElevatedButton(
          //                     onPressed: () {
          //                       CacheHelper.saveData(
          //                           key: 'truckNumber',
          //                           value: cubit.selectedTruck.truckNumber);
          //                       navigateTo(
          //                         context: context,
          //                         nextScreen: const TiersManagementScreen(),
          //                       );
          //                     },
          //                     style: ElevatedButton.styleFrom(
          //                       shape: RoundedRectangleBorder(),
          //                       primary: defaultColor,
          //                     ),
          //                     child: Text(
          //                       'Manage Tires',
          //                       style: TextStyle(fontSize: 26.sp),
          //                     ),
          //                   ),
          //                 ),
          //               )
          //             ],
          //           ),
          //         ),
          //       if (state is GetTrucksLoadingState)
          //         const CircularProgressIndicator(),
          //     ],
          //   ),
          // ),
        );
      },
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
