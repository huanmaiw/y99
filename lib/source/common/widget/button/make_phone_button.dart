// import 'package:flutter/material.dart';
//
//
// class MakePhoneButton extends StatelessWidget {
//   const MakePhoneButton({super.key, required this.phoneNumber});
//
//   final String phoneNumber;
//
//   @override
//   Widget build(BuildContext context) {
//     return DecoratedBox(
//       decoration: const BoxDecoration(
//         shape: BoxShape.circle,
//         color: Color(0xFF33A867),
//       ),
//       child: InkWell(
//         onTap: () async {
//           // Call phone number
//           await AppExternalService.instance.makePhoneCall(phoneNumber);
//         },
//         child: SizedBox(
//           width: 30,
//           height: 30,
//           child: Padding(
//             padding: const EdgeInsets.all(ResPadding.p8),
//             child: Assets.svg.phone.svg(),
//           ),
//         ),
//       ),
//     );
//   }
// }
