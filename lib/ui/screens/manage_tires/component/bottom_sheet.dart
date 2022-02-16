// import 'package:flutter/material.dart';
// import 'package:tire_management/ui/screens/manage_tires/component/tire_details_item.dart';
//
// void showBottomSheet({
//   required BuildContext context,
//   required Widget widget,
// }) {
//   showModalBottomSheet(
//     shape: const RoundedRectangleBorder(
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
//               TireDetailsItem(
//                 tire: firstTire,
//                 context: context,
//               ),
//               SizedBox(
//                 height: 16,
//               ),
//               Padding(
//                 padding: const EdgeInsetsDirectional.only(start: 16),
//                 child: DefaultDropdownField(
//                   selectedValue: cubit.selectedAction,
//                   hintText: 'Action With Selected Tire',
//                   onChange: (value) {
//                     cubit.changeAction(value);
//                     Navigator.pop(context);
//                   },
//                   itemsList: [
//                     'Replace with a same Truck tire',
//                     'Replace with a new one',
//                     'Replace with anoyher truck tire',
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
