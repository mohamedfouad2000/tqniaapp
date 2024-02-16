// import 'package:flutter/material.dart';
// import 'package:tqniaapp/Core/utils/colors.dart';
// import 'package:tqniaapp/Feature/home/presentation/views/screens/lead_info_screen.dart';
// import 'package:tqniaapp/Feature/home/presentation/views/screens/tickets_screen.dart';

// class leedsDetailsBody extends StatefulWidget {
//   const leedsDetailsBody({super.key, required this.id});
//   final int id;

//   @override
//   State<leedsDetailsBody> createState() => _leedsDetailsBodyState();
// }

// class _leedsDetailsBodyState extends State<leedsDetailsBody>
//     with TickerProviderStateMixin {
//   @override
//   Widget build(BuildContext context) {
//     TabController tabCont = TabController(length: 5, vsync: this);
//     return Padding(
//       padding: const EdgeInsets.only(top: 16, bottom: 16, left: 16),
//       child: Column(
//         children: [
//           Card(
//             child: Container(
//               // height: 42.02,
//               decoration: ShapeDecoration(
//                 color: const Color(0xffEAE1E3),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12.69),
//                 ),
//                 shadows: const [
//                   BoxShadow(
//                     color: Color(0x14000000),
//                     blurRadius: 8.85,
//                     offset: Offset(0, 1.11),
//                     spreadRadius: 0,
//                   )
//                 ],
//               ),
//               child: TabBar(
//                   controller: tabCont,
//                   indicatorColor: Colors.white,
//                   isScrollable: true,
//                   splashBorderRadius:
//                       const BorderRadius.all(Radius.circular(10)),
//                   labelColor: kMainColor,
//                   indicator: BoxDecoration(
//                     borderRadius: BorderRadius.circular(13.27),
//                     color: Colors.white,
//                     border: const Border(
//                       bottom: BorderSide(
//                         color: Colors.white, // Set the color of the line
//                         width: 2.0, // Set the width of the line
//                       ),
//                     ),
//                   ),
//                   tabs: [
//                     tabItem(txt: 'Leeds Info'),
//                     tabItem(txt: 'Tickets'),
//                     tabItem(txt: 'Notes'),
//                     tabItem(txt: 'Calls'),
//                     tabItem(txt: 'Meeting'),
//                   ]),
//             ),
//           ),
//           Expanded(
//               child: TabBarView(
//             controller: tabCont,
//             children: [
//               LeadInfoScreen(id: widget.id),
//               const TicketsScreen(),
//               Container(),
//               Container(),
//               Container(),
//             ],
//           ))
//         ],
//       ),
//     );
//   }

//   Tab tabItem({required String txt}) {
//     return Tab(
//       child: Container(
//         width: 164.78,
//         height: 42.02,
//         decoration: ShapeDecoration(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(13.27),
//           ),
//           shadows: const [],
//         ),
//         child: Center(
//             child: Text(
//           txt.toString(),
//         )),
//       ),
//     );
//   }
// }
