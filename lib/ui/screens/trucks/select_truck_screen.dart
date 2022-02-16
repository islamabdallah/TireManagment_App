// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_conditional_rendering/conditional.dart';
// import 'package:tire_management/ui/screens/manage_tires/manage_tire_screen.dart';
// import 'package:tire_management/ui/shared/utils/messages.dart';
//
// import '../../shared/components/container_info_item.dart';
// import 'package:tire_management/ui/screens/trucks/cubit/cubit.dart';
// import 'package:tire_management/ui/screens/trucks/cubit/states.dart';
// import 'package:tire_management/ui/screens/trucks/models/truck_model.dart';
// import 'package:tire_management/ui/shared/components/defualt_button.dart';
// import 'package:tire_management/ui/shared/components/details_row.dart';
// import 'package:tire_management/ui/shared/constants.dart';
// import 'package:tire_management/ui/shared/utils/navigations.dart';
//
// class SelectTruckScreen extends StatelessWidget {
//   var formKey = GlobalKey<FormState>();
//
//   bool isTrue = true;
//   @override
//   Widget build(BuildContext context) {
//     double screenHeight = MediaQuery.of(context).size.height;
//     double screenWidth = MediaQuery.of(context).size.width;
//     double stackHeight = screenHeight / 2.5;
//     print('height= $screenHeight');
//     print('width= $screenWidth');
//     print('stackHeght= $stackHeight');
//     return BlocProvider(
//       create: (context) => TruckCubit()..getHomeData(),
//       child: BlocConsumer<TruckCubit, TrucksStates>(
//         listener: (context, state) {
//           if (state is GetTrucksErrorState) {
//             showAlert(message: state.message, context: context);
//           }
//         },
//         builder: (context, state) {
//           var cubit = TruckCubit.get(context);
//           return Scaffold(
//             backgroundColor: Colors.white,
//             appBar: AppBar(
//               elevation: 0,
//               backgroundColor: mainColor,
//               title: const Text(
//                 'Select Truck',
//                 style: appBarsTextStyle,
//               ),
//               centerTitle: true,
//             ),
//             body: Conditional.single(
//               context: context,
//               conditionBuilder: (context) => state is GetTrucksSuccessState,
//               widgetBuilder: (context) {
//                 Truck truck = cubit.trucksList.where(
//                         (element) => element.truckNumber == cubit.selectedTruck)
//                     as Truck;
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 12),
//                           child: Form(
//                             key: formKey,
//                             child: DropdownSearch<String>(
//                               showSelectedItems: true,
//                               isFilteredOnline: true,
//                               showSearchBox: true,
//                               mode: Mode.MENU,
//                               items: cubit.trucksDropdownList,
//                               popupItemDisabled: (String s) =>
//                                   s.startsWith('I'),
//                               onChanged: (value) {
//                                 cubit.selectTruck(value);
//                               },
//                               validator: (String? item) {
//                                 if (item == null || item.isEmpty)
//                                   return "Select truck required";
//                                 return null;
//                               },
//                               selectedItem: cubit.selectedTruck,
//                               dropdownSearchDecoration: InputDecoration(
//                                 hintText: 'Select Truck',
//                                 contentPadding: EdgeInsets.symmetric(
//                                     horizontal: 16, vertical: 4),
//                                 fillColor: Colors.grey[200],
//                                 filled: true,
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                                 errorBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         const Divider(
//                           thickness: 2,
//                         ),
//                         if (cubit.selectedTruck == null)
//                           Column(
//                             children: [
//                               Container(
//                                 height: screenHeight / 3,
//                               ),
//                               const Text(
//                                 'No Selected Trucks',
//                                 style: TextStyle(
//                                   fontSize: 22,
//                                   color: mainColor,
//                                 ),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ],
//                           ),
//                         if (cubit.selectedTruck != null)
//                           Column(
//                             children: [
//                               const Image(
//                                 image: NetworkImage(
//                                     'https://www.bharatbenz.com/assets/images/truck-hdtc1.webp'),
//                               ),
//                               const SizedBox(
//                                 height: 8,
//                               ),
//                               DetailsRow(
//                                 title: 'Truck Details',
//                                 imagePath: 'assets/icons/truck.svg',
//                                 color: Colors.white,
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Padding(
//                                 padding: const EdgeInsetsDirectional.only(
//                                   start: 20,
//                                 ),
//                                 child: Column(
//                                   crossAxisAlignment:
//                                       CrossAxisAlignment.stretch,
//                                   children: [
//                                     InfoItem(
//                                       title: 'TruckNumber',
//                                       value: truck.truckNumber!,
//                                     ),
//                                     Row(
//                                       children: [
//                                         InfoItem(
//                                           title: 'TruckName',
//                                           value: truck.truckName!,
//                                         ),
//                                         Expanded(
//                                           child: InfoItem(
//                                             title: 'Make',
//                                             value: truck.manufacturer!,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     InfoItem(
//                                       title: 'Type',
//                                       value: truck.type!,
//                                     ),
//                                     InfoItem(
//                                       title: 'Vehicles Model No',
//                                       value: truck.vehicleModelNo!,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//               fallbackBuilder: (context) => const Center(
//                   child: CircularProgressIndicator(
//                 color: mainColor,
//               )),
//             ),
//             floatingActionButton: cubit.selectedTruck != null
//                 ? DefualtButton(
//                     title: 'Process',
//                     onPress: () {
//                       if (formKey.currentState!.validate()) {
//                         navigateWithTransition(
//                           context: context,
//                           nextScreen: ManageTireScreen(
//                             truckNum: int.parse(cubit.selectedTruck!),
//                           ),
//                         );
//                       }
//                     },
//                   )
//                 : null,
//             floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
//           );
//         },
//       ),
//     );
//   }
// }
