// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:tqniaapp/Core/utils/components.dart';
// import 'package:tqniaapp/Feature/home/data/repo/add_ticket_repo/add_ticket_repo_imp.dart';
// import 'package:tqniaapp/Feature/home/presentation/manager/addticket/addticket_cubit.dart';
// import 'package:tqniaapp/Feature/home/presentation/manager/addticket/addticket_state.dart';
// import 'package:tqniaapp/Feature/login/presentation/views/login_view.dart';

// class EditTicketsScreen extends StatelessWidget {
//   const EditTicketsScreen({
//     super.key,
//     required this.id,
//   });
//   final int id;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(
//             Icons.arrow_back_ios_outlined,
//             size: 20,
//           ),
//         ),
//       ),
//       body: BlocProvider(
//         create: (context) => AddticketCubit(AddTicketRepoImpl())
//           ..checkAddTicketPermission(id: int.parse(model.data!.main!.id.toString())),
//         child: BlocConsumer<AddticketCubit, AddticketState>(
//           listener: (context, state) {
//             if (state is CheckPermisionFailuire) {
//               if (state.errorMsq == 'forbidden please login') {
//                 Nav(context, const LoginView());
//               }
//             }
//           },
//           builder: (context, state) {
//             if (state is CheckPermisionSucc) {
//               return EditTicketsBody(model: model);
//             } else if (state is CheckPermisionFailuire) {
//               return Center(
//                 child: Text(state.errorMsq.toString()),
//               );
//             } else {
//               return const Center(child: CircularProgressIndicator());
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
