import 'package:flutter/material.dart';
import 'package:lettutor/common/values/hex_color.dart';
import 'package:lettutor/presentation/schedule_screen/widget/schedule_item.dart';

class HistoryItem extends ScheduleItem {
  const HistoryItem({super.key});

  // @override
  // Widget buildRequestAndReview() {
  //   return Container(
  //     padding: const EdgeInsets.only(top: 16),
  //     decoration: BoxDecoration(
  //         border: Border(
  //           top: BorderSide(
  //             color: HexColor.fromHex('#cccccc'),
  //           ),
  //         )
  //     ),
  //     child: Row(
  //       children: [
  //         GestureDetector(
  //             onTap: () {},
  //             child: Container(
  //                 padding: const EdgeInsets.all(8),
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(8),
  //                   border: Border.all(
  //                     color: HexColor.fromHex('#eee16c')
  //                   ),
  //                 ),
  //                 child:  Text(
  //                   'Add a review',
  //                   style: TextStyle(
  //                     color: HexColor.fromHex('#eee16c'),
  //                     fontSize: 14,
  //                     fontWeight: FontWeight.w500,
  //                   ),
  //                 )
  //             )),
  //         const Spacer(),
  //         GestureDetector(
  //             onTap: () {},
  //             child: Container(
  //                 padding: const EdgeInsets.all(8),
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(8),
  //                   border: Border.all(
  //                     color: Colors.red,
  //                   ),
  //                 ),
  //                 child:  const Text(
  //                   'Report',
  //                   style: TextStyle(
  //                     color: Colors.red,
  //                     fontSize: 14,
  //                     fontWeight: FontWeight.w500,
  //                   ),
  //                 )
  //             )
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
