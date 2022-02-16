// import 'package:flutter/material.dart';
// import 'package:tire_management/ui/shared/components/container_info_item.dart';
// import 'package:tire_management/ui/shared/components/details_row.dart';
//
// void showSheet({required BuildContext context}) {
//   showModalBottomSheet(
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.only(
//         topLeft: Radius.circular(20),
//         topRight: Radius.circular(20),
//       ),
//     ),
//     context: context,
//     builder: (context) {
//       return Container(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               DetailsRow(
//                 title: 'Tire Details',
//                 imagePath: 'assets/images/tire.svg',
//               ),
//               Padding(
//                 padding: const EdgeInsetsDirectional.only(start: 16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     InfoItem(
//                       value: firstTire!.serialNumber!.toString(),
//                       title: 'SerialNumber',
//                     ),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: InfoItem(
//                             value: firstTire!.type!,
//                             title: 'Type',
//                           ),
//                         ),
//                         InfoItem(
//                           value: firstTire!.make!,
//                           title: 'Make',
//                         ),
//                       ],
//                     ),
//                     InfoItem(
//                       value: firstTire!.manufactor!,
//                       title: 'Manfactor',
//                     ),
//                     SizedBox(
//                       height: 16,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: DefaultDropdownField(
//                         selectedValue: cubit.selectedAction,
//                         hintText: 'Action With Selected Tire',
//                         onChange: (value) {
//                           cubit.changeAction(value);
//                           Navigator.pop(context);
//                         },
//                         itemsList: [
//                           'Replace with a same Truck tire',
//                           'Replace with a new one',
//                           'Replace with anoyher truck tire',
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }
