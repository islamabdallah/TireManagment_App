// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import '../../shared/components/default_drop_down.dart';
// import 'package:tire_management/ui/screens/manage_tires/component/note_text.dart';
// import 'package:tire_management/ui/screens/manage_tires/component/tire_place.dart';
// import 'package:tire_management/ui/screens/manage_tires/cubit/cubit.dart';
// import 'package:tire_management/ui/screens/manage_tires/cubit/states.dart';
// import 'package:tire_management/ui/screens/manage_tires/models/tire_model.dart';
// import 'package:tire_management/ui/shared/components/defualt_button.dart';
// import 'package:tire_management/ui/shared/constants.dart';
//
// class ManageTireScreen extends StatelessWidget {
//   var formKey1 = GlobalKey<FormState>();
//   var formKey2 = GlobalKey<FormState>();
//   int truckNum;
//   ManageTireScreen({this.truckNum = 5});
//   bool isTrue = true;
//   String? currentValue = null;
//   @override
//   Widget build(BuildContext context) {
//     double screenHeight = MediaQuery.of(context).size.height;
//     double screenWidth = MediaQuery.of(context).size.width;
//     double stackHeight = screenHeight / 1.6;
//     double imageWidth = screenWidth / 1.7;
//     print('height= $screenHeight');
//     print('width= $screenWidth');
//     print('stackHeght= $stackHeight');
//     return BlocProvider(
//       create: (context) => ManageTiresCubit(),
//       child: BlocConsumer<ManageTiresCubit, ManageTiresStates>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           var cubit = ManageTiresCubit.get(context);
//           return Scaffold(
//             key: scaffoldKey,
//             backgroundColor: Colors.white,
//             appBar: AppBar(
//               elevation: 0,
//               backgroundColor: mainColor,
//               title: const Text(
//                 'Mange Tires',
//                 style: appBarsTextStyle,
//               ),
//               centerTitle: true,
//             ),
//             body: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     if (cubit.firstTire == null)
//                       NoteText(text: 'Select  tire For Managing'),
//                     if (cubit.firstTire != null &&
//                         cubit.secondTire == null &&
//                         cubit.selectedAction ==
//                             'Replace with a same Truck tire')
//                       NoteText(text: 'Select Second tire or change action'),
//                     if (cubit.firstTire != null)
//                       DefaultDropdownField(
//                         isExpand: false,
//                         value: cubit.selectedAction,
//                         items: const [
//                           'Replace with a same Truck tire',
//                           'Replace with a new one',
//                         ],
//                         onChange: (value) {
//                           cubit.changeAction(value);
//                           if (cubit.selectedAction ==
//                               'Replace with a new one') {
//                             showDialog(
//                               context: context,
//                               builder: (context) {
//                                 return Center(
//                                   child: Card(
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(20),
//                                     ),
//                                     child: Container(
//                                       height:
//                                           MediaQuery.of(context).size.height /
//                                               2,
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Column(
//                                           children: [
//                                             Expanded(
//                                               child: Row(
//                                                 children: [
//                                                   Expanded(
//                                                     child: Column(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceAround,
//                                                       children: [
//                                                         NoteText(
//                                                           text: 'Old Tire',
//                                                         ),
//                                                         InputTierInfo(
//                                                           title: 'Depth1: ',
//                                                           color: Colors.red,
//                                                         ),
//                                                         InputTierInfo(
//                                                           title: 'Depth2: ',
//                                                           color: Colors.red,
//                                                         ),
//                                                         InputTierInfo(
//                                                           title: 'Distance: ',
//                                                           color: Colors.red,
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                   Padding(
//                                                     padding:
//                                                         const EdgeInsets.all(
//                                                             8.0),
//                                                     child: Container(
//                                                       color: mainColor,
//                                                       height:
//                                                           MediaQuery.of(context)
//                                                                   .size
//                                                                   .height /
//                                                               2,
//                                                       width: 1,
//                                                     ),
//                                                   ),
//                                                   Expanded(
//                                                     child: Column(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceAround,
//                                                       children: [
//                                                         NoteText(
//                                                           text: 'New Tier',
//                                                           color: Colors.green,
//                                                         ),
//                                                         InputTierInfo(
//                                                           title: 'Depth1: ',
//                                                           color: Colors.green,
//                                                         ),
//                                                         InputTierInfo(
//                                                           title: 'Depth2: ',
//                                                           color: Colors.green,
//                                                         ),
//                                                         InputTierInfo(
//                                                           title: 'Distance: ',
//                                                           color: Colors.green,
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 DefaultDropdownField(
//                                                   isExpand: false,
//                                                   value: cubit.oldTierStatus,
//                                                   items: const [
//                                                     'demaged',
//                                                     'Re-repair',
//                                                   ],
//                                                   onChange: (value) {},
//                                                 ),
//                                                 DefualtButton(
//                                                   title: 'Save',
//                                                   onPress: () {
//                                                     Navigator.pop(context);
//                                                   },
//                                                 ),
//                                               ],
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             );
//                           }
//                         },
//                       ),
//                     Container(
//                       height: stackHeight,
//                       width: screenWidth,
//                       child: Stack(
//                         children: [
//                           Center(
//                             child: Container(
//                               // width: imageWidth,
//                               height: stackHeight,
//                               child: SvgPicture.asset(
//                                 'assets/images/trailer.svg',
//                                 height: stackHeight,
//                                 width: screenWidth / 3,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                           //1______________________
//                           TirePlace(
//                             context: context,
//                             fromTop: stackHeight / 12,
//                             fromLeft: screenWidth < 480
//                                 ? (imageWidth / 6)
//                                 : (screenWidth / 3.8),
//                             screenWidth: screenWidth,
//                             height: stackHeight,
//                             isPair: false,
//                             firstTire: Tire(
//                               id: 1,
//                               tirePlace: 'f1',
//                             ),
//                             // isLeft: true,
//                           ),
//                           TirePlace(
//                             context: context,
//                             fromTop: stackHeight / 12,
//                             fromRight: screenWidth < 480
//                                 ? (imageWidth / 6)
//                                 : (screenWidth / 3.8),
//                             screenWidth: screenWidth,
//                             height: stackHeight,
//                             isPair: false,
//                             firstTire: Tire(
//                               id: 2,
//                               tirePlace: 'f2',
//                             ),
//                           ),
//
//                           //2_______________________
//                           if (truckNum != 2 && truckNum != 6)
//                             TirePlace(
//                               context: context,
//                               fromTop: stackHeight / 5.5,
//                               fromLeft: screenWidth < 480
//                                   ? truckNum != 5
//                                       ? (imageWidth / 6)
//                                       : (screenWidth - (imageWidth * 1.68))
//                                   : (screenWidth / 5.4),
//                               screenWidth: screenWidth,
//                               height: stackHeight,
//                               firstTire: Tire(
//                                 id: 5,
//                                 tirePlace: 'f5',
//                               ),
//                               secondTire: Tire(
//                                 id: 6,
//                                 tirePlace: 'f6',
//                               ),
//                               isPair: truckNum != 5 ? false : true,
//                             ),
//                           if (truckNum != 2 && truckNum != 6)
//                             TirePlace(
//                               context: context,
//                               fromTop: stackHeight / 5.5,
//                               fromRight: screenWidth < 480
//                                   ? truckNum != 5
//                                       ? (imageWidth / 6)
//                                       : (screenWidth - (imageWidth * 1.68))
//                                   : (screenWidth / 5.4),
//                               screenWidth: screenWidth,
//                               height: stackHeight,
//                               firstTire: Tire(
//                                 id: 3,
//                                 tirePlace: 'f3',
//                               ),
//                               secondTire: Tire(
//                                 id: 4,
//                                 tirePlace: 'f4',
//                               ),
//                               isPair: truckNum != 5 ? false : true,
//                             ),
//
//                           //3____________________
//                           if (truckNum == 5)
//                             TirePlace(
//                               context: context,
//                               fromTop: stackHeight / 3.4,
//                               fromRight: screenWidth < 480
//                                   ? (screenWidth - (imageWidth * 1.68))
//                                   : (screenWidth / 5.4),
//                               screenWidth: screenWidth,
//                               height: stackHeight,
//                               firstTire: Tire(
//                                 id: 7,
//                                 tirePlace: 'f7',
//                               ),
//                               secondTire: Tire(
//                                 id: 8,
//                                 tirePlace: 'f8',
//                               ),
//                             ),
//                           if (truckNum == 5)
//                             TirePlace(
//                               context: context,
//                               fromTop: stackHeight / 3.4,
//                               fromLeft: screenWidth < 480
//                                   ? (screenWidth - (imageWidth * 1.68))
//                                   : (screenWidth / 5.4),
//                               screenWidth: screenWidth,
//                               height: stackHeight,
//                               isPair: true,
//                               firstTire: Tire(
//                                 id: 9,
//                                 tirePlace: 'f9',
//                               ),
//                               secondTire: Tire(
//                                 id: 10,
//                                 tirePlace: 'f10',
//                               ),
//                             ),
//
//                           //4__________________
//
//                           TirePlace(
//                             context: context,
//                             fromTop: stackHeight / 1.60,
//                             fromRight: screenWidth < 480
//                                 ? truckNum == 6
//                                     ? (imageWidth / 6)
//                                     : (screenWidth - (imageWidth * 1.68))
//                                 : (screenWidth / 5.4),
//                             screenWidth: screenWidth,
//                             height: stackHeight,
//                             firstTire: Tire(
//                               id: 11,
//                               tirePlace: 'R1',
//                             ),
//                             secondTire: Tire(
//                               id: 12,
//                               tirePlace: 'R2',
//                             ),
//                             isPair: truckNum == 6 ? false : true,
//                           ),
//                           TirePlace(
//                             context: context,
//                             fromTop: stackHeight / 1.60,
//                             fromLeft: screenWidth < 480
//                                 ? truckNum == 6
//                                     ? (imageWidth / 6)
//                                     : (screenWidth - (imageWidth * 1.68))
//                                 : (screenWidth / 5.4),
//                             screenWidth: screenWidth,
//                             height: stackHeight,
//                             firstTire: Tire(
//                               id: 13,
//                               tirePlace: 'R3',
//                             ),
//                             secondTire: Tire(
//                               id: 14,
//                               tirePlace: 'R4',
//                             ),
//                             isPair: truckNum == 6 ? false : true,
//                           ),
//                           //5 __________________
//                           if (truckNum != 6)
//                             TirePlace(
//                               context: context,
//                               fromTop: stackHeight / 1.38,
//                               fromRight: screenWidth < 480
//                                   ? (screenWidth - (imageWidth * 1.68))
//                                   : (screenWidth / 5.4),
//                               screenWidth: screenWidth,
//                               height: stackHeight,
//                               firstTire: Tire(
//                                 id: 15,
//                                 tirePlace: 'R5',
//                               ),
//                               secondTire: Tire(
//                                 id: 16,
//                                 tirePlace: 'R6',
//                               ),
//                             ),
//                           if (truckNum != 6)
//                             TirePlace(
//                               context: context,
//                               fromTop: stackHeight / 1.38,
//                               fromLeft: screenWidth < 480
//                                   ? (screenWidth - (imageWidth * 1.68))
//                                   : (screenWidth / 5.4),
//                               screenWidth: screenWidth,
//                               height: stackHeight,
//                               firstTire: Tire(
//                                 id: 17,
//                                 tirePlace: 'R7',
//                               ),
//                               secondTire: Tire(
//                                 id: 18,
//                                 tirePlace: 'R8',
//                               ),
//                             ),
//                           //6__________________
//                           if (truckNum == 5 || truckNum == 4)
//                             TirePlace(
//                               context: context,
//                               fromTop: stackHeight / 1.22,
//                               fromRight: screenWidth < 480
//                                   ? truckNum == 4
//                                       ? (imageWidth / 6)
//                                       : (screenWidth - (imageWidth * 1.68))
//                                   : (screenWidth / 5.4),
//                               screenWidth: screenWidth,
//                               height: stackHeight,
//                               firstTire: Tire(
//                                 id: 19,
//                                 tirePlace: 'R9',
//                               ),
//                               secondTire: Tire(
//                                 id: 20,
//                                 tirePlace: 'R10',
//                               ),
//                               isPair: truckNum == 4 ? false : true,
//                             ),
//                           if (truckNum == 5 || truckNum == 4)
//                             TirePlace(
//                               context: context,
//                               fromTop: stackHeight / 1.22,
//                               fromLeft: screenWidth < 480
//                                   ? truckNum == 4
//                                       ? (imageWidth / 6)
//                                       : (screenWidth - (imageWidth * 1.68))
//                                   : (screenWidth / 5.4),
//                               screenWidth: screenWidth,
//                               height: stackHeight,
//                               firstTire: Tire(
//                                 id: 21,
//                                 tirePlace: 'R11',
//                               ),
//                               secondTire: Tire(
//                                 id: 22,
//                                 tirePlace: 'R12',
//                               ),
//                               isPair: truckNum == 4 ? false : true,
//                             ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       height: 30,
//                       width: 100,
//                       color: Colors.black87,
//                       child: Center(
//                         child: Text(
//                           'Sphere Tire',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: screenWidth >= 480 ? 18 : 14,
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             floatingActionButton:
//                 cubit.secondTire != null && cubit.firstTire != null
//                     ? DefualtButton(
//                         title: 'Save Changes',
//                         onPress: () {},
//                       )
//                     : null,
//           );
//         },
//       ),
//     );
//   }
// }
//
// class InputTierInfo extends StatelessWidget {
//   String title;
//   Color color;
//   InputTierInfo({
//     required this.title,
//     required this.color,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Text(
//           title,
//           style: const TextStyle(
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         Expanded(
//           child: TextFormField(
//             cursorColor: mainColor,
//             decoration: InputDecoration(
//               contentPadding: const EdgeInsets.symmetric(
//                 horizontal: 8,
//               ),
//               border: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: color,
//                 ),
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: color),
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: color,
//                 ),
//                 borderRadius: BorderRadius.circular(5),
//               ),
//             ),
//             validator: (value) {
//               if (value!.isEmpty) return 'field required';
//               return null;
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
