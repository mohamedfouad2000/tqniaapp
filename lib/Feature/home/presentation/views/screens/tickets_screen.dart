import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tqniaapp/Core/utils/assets_data.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/components.dart';
import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Core/widgets/faliure_wid.dart';
import 'package:tqniaapp/Feature/home/data/repo/add_ticket_repo/add_ticket_repo_imp.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/addticket/addticket_cubit.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/addticket/addticket_state.dart';
import 'package:tqniaapp/Feature/home/presentation/views/screens/ticket_info_screen.dart';
import 'package:tqniaapp/Feature/home/presentation/views/widgets/edit_tickets_body.dart';

class TicketsScreen extends StatelessWidget {
  const TicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AddticketCubit(AddTicketRepoImpl())..getTicketsList(),
      child: BlocConsumer<AddticketCubit, AddticketState>(
        builder: (context, state) {
          if (state is GetTicketsListSucc) {
            if (state.model.data!.ticket!.isEmpty) {
              return const Center(
                child: Text("Empty List"),
              );
            }
            return Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          sortAscending: true,
                          columnSpacing: 16.0,
                          dataRowMaxHeight: double.infinity,
                          dataRowMinHeight: 71,
                          dividerThickness: 1,
                          border: TableBorder(
                            horizontalInside:
                                BorderSide(color: kbackColor, width: 20),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          dataRowColor:
                              MaterialStateProperty.resolveWith<Color?>(
                                  (Set<MaterialState> states) {
                            if (states.contains(MaterialState.selected)) {
                              return kMainColor;
                            }
                            return null; // Use the default value.
                          }),
                          columns: [
                            DataColumnItem(txt: 'Ticket ID'),
                            DataColumnItem(txt: 'Title'),
                            DataColumnItem(txt: 'Client'),
                            DataColumnItem(txt: 'Requested by'),
                            DataColumnItem(txt: 'Ticket type'),
                            DataColumnItem(txt: 'Description'),
                            DataColumnItem(txt: 'Assigned To'),
                            DataColumnItem(txt: 'Labels'),
                            DataColumnItem(txt: 'Action'),
                          ],
                          rows: List<DataRow>.generate(
                            state.model.data?.ticket?.length ?? 0,
                            (index) {
                              final item = state.model.data?.ticket?[index];
                              return DataRow(
                                  // color: MaterialStateProperty.resolveWith(getColor),
                                  cells: [
                                    DataCell(
                                      Center(
                                        child: SizedBox(
                                          width: 150,
                                          child: Text(
                                            item?.id != null
                                                ? '#${item?.id}'
                                                : '',
                                            textAlign: TextAlign.center,
                                            style: StylesData.font12
                                                .copyWith(color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Center(
                                        child: SizedBox(
                                          width: 150,
                                          child: Text(
                                            item?.title ?? '',
                                            textAlign: TextAlign.center,
                                            style: StylesData.font12
                                                .copyWith(color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Center(
                                        child: SizedBox(
                                          width: 150,
                                          child: Text(
                                            item?.assignedToUser ?? '',
                                            textAlign: TextAlign.center,
                                            style: StylesData.font12
                                                .copyWith(color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      SizedBox(
                                        width: 150,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const CircleAvatar(
                                              radius: 13.5,
                                              backgroundImage: AssetImage(
                                                  AssetsData.person1),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              item?.requestedByName ?? '',
                                              style: StylesData.font12.copyWith(
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Center(
                                        child: SizedBox(
                                          width: 150,
                                          child: Text(
                                            item?.ticketType ?? '',
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: StylesData.font12
                                                .copyWith(color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Center(
                                        child: SizedBox(
                                          width: 150,
                                          child: Text(
                                            item?.labels ?? '',
                                            maxLines: 1,
                                            overflow: TextOverflow.clip,
                                            textAlign: TextAlign.center,
                                            style: StylesData.font12
                                                .copyWith(color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      SizedBox(
                                        width: 150,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      1000000),
                                              child: CachedNetworkImage(
                                                height: 24,
                                                imageUrl: showImageFun(
                                                    image: item!
                                                        .assignedToAvatar
                                                        .toString()),
                                                placeholder: (context, url) =>
                                                    LoadingAnimationWidget
                                                        .newtonCradle(
                                                  size: 50,
                                                  color: Colors.grey,
                                                ),
                                                errorWidget:
                                                    (context, url, er) =>
                                                        Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                item.assignedToUser ?? '',
                                                textAlign: TextAlign.center,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: StylesData.font12
                                                    .copyWith(
                                                        color: Colors.black),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Center(
                                        child: Container(
                                          width: 100,
                                          height: 30,
                                          padding: const EdgeInsets.symmetric(),
                                          decoration: ShapeDecoration(
                                            color: const Color(0x19640CBC),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              item.labelsList ?? '',
                                              maxLines: 1,
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.rubik(
                                                textStyle: const TextStyle(
                                                  color: Color(0xFF640CBC),
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataCell(Center(
                                      child: InkWell(
                                        onTap: () {
                                          NavegatorPush(context,
                                              TicketInfoScreen(id: int.parse(item.id!)));
                                        },
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            CircleAvatar(
                                              radius: 22,
                                              backgroundColor:
                                                  Colors.grey.withOpacity(.3),
                                            ),
                                            const CircleAvatar(
                                              radius: 21,
                                              backgroundColor: Colors.white,
                                              child: Center(
                                                child: Image(
                                                  image: AssetImage(
                                                    AssetsData.edit2,
                                                  ),
                                                  width: 24,
                                                  height: 24,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                                  ]);
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is GetTicketsListFailuire) {
            return const FailureWidget();
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
        listener: (BuildContext context, AddticketState state) {},
      ),
    );
  }

  DataColumn DataColumnItem({required String txt}) {
    return DataColumn(
      label: Container(
        width: 150,
        height: 50,
        decoration: ShapeDecoration(
          color: const Color(0x33E92929),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Center(
          child: Text(
            txt,
            textAlign: TextAlign.center,
            style: StylesData.font12.copyWith(color: const Color(0xFFE92929)),
          ),
        ),
      ),
    );
  }
}

List<dynamic> data = [
  {
    "TicketID": "# 1236",
    "Title": 'Title',
    "Client": "Client Name",
    'Requestedby': 'Ahmed Magdy',
    'Tickettype': 'Uregent',
    'Description': 'Test',
    'Assigned to': 'Yasser',
    'Labels': 'Design',
    'Action': 'Action'
  },
];
