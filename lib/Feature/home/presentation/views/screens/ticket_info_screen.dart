import 'package:flutter/material.dart';

import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/styles.dart';

import 'package:tqniaapp/Feature/home/presentation/views/widgets/ticketInfo_screen_body.dart';

class TicketInfoScreen extends StatelessWidget {
  const TicketInfoScreen({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    print(id);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kbackColor,
        surfaceTintColor: kbackColor,
        toolbarHeight: 70,
        title: Text(
          "Ticket Info",
          style: StylesData.font18.copyWith(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            size: 20,
            color: Colors.black,
          ),
        ),
        // actions: [
        //   PopupMenuButton(
        //     color: Colors.white,
        //     elevation: 5.0,
        //     enabled: true,
        //     surfaceTintColor: Colors.white,
        //     constraints:
        //         const BoxConstraints.expand(width: 60.14, height: 150),
        //     itemBuilder: (context) {
        //       return [
        //         PopupMenuItem(
        //           padding: EdgeInsets.zero,
        //           onTap: () {
        //             // NavegatorPush(
        //                 // context, EditTicketsBody(model: state.model));
        //           },
        //           child: Center(
        //             child: Stack(
        //               alignment: Alignment.center,
        //               children: [
        //                 CircleAvatar(
        //                   radius: 29,
        //                   backgroundColor:
        //                       const Color(0xFF040415).withOpacity(0.10),
        //                 ),
        //                 const CircleAvatar(
        //                   radius: 26,
        //                   backgroundColor: Colors.white,
        //                   child: Center(
        //                     child: Image(
        //                       image: AssetImage(AssetsData.edit2),
        //                       width: 30.08,
        //                       height: 30.08,
        //                     ),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //         PopupMenuItem(
        //           padding: EdgeInsets.zero,
        //           onTap: () {},
        //           child: Center(
        //             child: Stack(
        //               alignment: Alignment.center,
        //               children: [
        //                 CircleAvatar(
        //                   radius: 29,
        //                   backgroundColor:
        //                       const Color(0xFF040415).withOpacity(0.10),
        //                 ),
        //                 const CircleAvatar(
        //                   radius: 26,
        //                   backgroundColor: Color(0xFFFF0000),
        //                   child: Center(
        //                     child: Image(
        //                       image: AssetImage(AssetsData.newDelete),
        //                       width: 30.08,
        //                       height: 30.08,
        //                     ),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //       ];
        //     },
        //     padding: EdgeInsets.zero,
        //     child: Stack(
        //       alignment: Alignment.center,
        //       children: [
        //         CircleAvatar(
        //           radius: 29,
        //           backgroundColor:
        //               const Color(0xFF040415).withOpacity(0.10),
        //         ),
        //         const CircleAvatar(
        //           radius: 26,
        //           backgroundColor: Colors.white,
        //           child: Center(
        //             child: Icon(
        //               Icons.more_vert,
        //               size: 24,
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ],
      ),
      body: TicketInfoScreenBody(
        id: id,
      ),
    );
  }
}
