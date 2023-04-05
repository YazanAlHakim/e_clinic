// import 'package:flutter/material.dart';
//
// class CustomDropDown extends StatelessWidget {
//   const CustomDropDown({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0),
//       child: DropdownButtonFormField(
//         items: cities.map((e) => DropdownMenuItem(
//             value: e.name!,
//             child: Text(
//               e.name!,
//               textDirection: TextDirection.rtl,
//               textAlign: TextAlign.start,
//             )
//         ),
//         ).toList(),
//         onChanged:(value)
//         {
//           // controller.city=value.toString();
//         },
//         hint: const Text(
//             'اختر مدينتك'
//         ),
//         decoration: const InputDecoration(
//           prefixIcon: Icon(
//               Icons.location_city_outlined
//           ),
//           contentPadding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 4.0),
//
//         ),
//         validator: (value)
//         {
//         },
//       ),
//     ),
//   }
// }
