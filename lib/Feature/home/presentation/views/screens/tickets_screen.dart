import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tqniaapp/Core/utils/assets_data.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/components.dart';
import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Core/widgets/empty_tickets.dart';
import 'package:tqniaapp/Core/widgets/faliure_wid.dart';
import 'package:tqniaapp/Feature/home/data/model/client_model/client_model.dart';
import 'package:tqniaapp/Feature/home/data/model/get_ticket_type/get_ticket_type.dart';
import 'package:tqniaapp/Feature/home/data/model/label_model/assgin_to.dart';
import 'package:tqniaapp/Feature/home/data/repo/add_ticket_repo/add_ticket_repo_imp.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/Show%20Tickets/show_tickets_cubit.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/Show%20Tickets/show_tickets_state.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/addticket/addticket_cubit.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/addticket/addticket_state.dart';
import 'package:tqniaapp/Feature/home/presentation/views/screens/ticket_info_screen.dart';

class TicketsScreen extends StatefulWidget {
  const TicketsScreen({super.key});

  @override
  State<TicketsScreen> createState() => _TicketsScreenState();
}

class _TicketsScreenState extends State<TicketsScreen> {
  bool showFillter = false;
  List<String> statusList = ['closed', 'new', 'open', 'inprogress'];
  var searchCont = TextEditingController();
  String? typeItem;
  String? labelItem;
  String? statusItem;
  String? assginToItem;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShowTicketsCubit(AddTicketRepoImpl())
        ..getTicketsList(
            ticketLabel: '',
            ticketType: '',
            assignedTo: '',
            status: '',
            search: ''),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16, top: 16),
        child: Column(
          children: [
            BlocProvider(
              create: (context) => AddticketCubit(AddTicketRepoImpl())
             ..getAllFiled(),
              child: BlocConsumer<AddticketCubit, AddticketState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is GetAllFiledSucc) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  setState(() {
                                    showFillter = !showFillter;
                                  });
                                },
                                icon: const Icon(Icons.filter_list)),
                            const SizedBox(
                              width: 7,
                            ),
                            Expanded(
                              child: customTextFiled(
                                  onChanged: (String i) {
                                    searchCont.text = i;

                                    ShowTicketsCubit.get(context)
                                        .getTicketsList(
                                            ticketLabel: labelItem ?? '',
                                            ticketType: typeItem ?? '',
                                            assignedTo: assginToItem ?? '',
                                            search: searchCont.text,
                                            status: statusItem ?? '');
                                  },
                                  controller: searchCont,
                                  hintText: 'search'),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                          ],
                        ),
                        if (showFillter)
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                children: [
                                  DropdownButton<String>(
                                    style: StylesData.font14
                                        .copyWith(color: Colors.black),
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.grey.withOpacity(.4),
                                    ),
                                    //elevation: 5,
                                    value: typeItem,

                                    items: [
                                       DropdownMenuItem<String>(
                                        value: '',
                                        child: Text(
                                          "Type",
                                             style: StylesData.font14
                                        .copyWith(color: Colors.black),
                                        ),
                                      ),
                                      ...AddticketCubit.get(context)
                                          .ticketsTypes
                                          .map<DropdownMenuItem<String>>(
                                              (TicketType value) {
                                        return DropdownMenuItem<String>(
                                          value: value.id.toString(),
                                          child: Text(
                                            value.name.toString(),
                                               style: StylesData.font14
                                        .copyWith(color: Colors.black),
                                          ),
                                        );
                                      })
                                    ],
                                    hint:  Text(
                                      "Type",
                                      style: StylesData.font14
                                        .copyWith(color: Colors.black),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        typeItem = value;
                                      });
                                      ShowTicketsCubit.get(context)
                                          .getTicketsList(
                                              ticketLabel: labelItem ?? '',
                                              ticketType: typeItem ?? '',
                                              assignedTo: assginToItem ?? '',
                                              search: searchCont.text,
                                              status: statusItem ?? '');
                                    },
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  DropdownButton<String>(
                                    style: StylesData.font14
                                        .copyWith(color: Colors.black),
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.grey.withOpacity(.4),
                                    ),
                                    value: statusItem,
                                    //elevation: 5,

                                    items: [
                                      const DropdownMenuItem<String>(
                                        value: '',
                                        child: Text("status"),
                                      ),
                                      ...statusList
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                             style: StylesData.font14
                                        .copyWith(color: Colors.black),
                                          ),
                                        );
                                      })
                                    ],
                                    hint:  Text(
                                      "status",
                                      style: StylesData.font14
                                        .copyWith(color: Colors.black),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        statusItem = value;
                                      });
                                      ShowTicketsCubit.get(context)
                                          .getTicketsList(
                                              ticketLabel: labelItem ?? '',
                                              search: searchCont.text,
                                              ticketType: typeItem ?? '',
                                              assignedTo: assginToItem ?? '',
                                              status: statusItem ?? '');
                                    },
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  DropdownButton<String>(
                                    style: StylesData.font14
                                        .copyWith(color: Colors.black),
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.grey.withOpacity(.4),
                                    ),
                                    value: labelItem,
                                    //elevation: 5,

                                    items: [
                                      const DropdownMenuItem<String>(
                                        value: '',
                                        child: Text(
                                          'label',
                                        ),
                                      ),
                                      ...AddticketCubit.get(context)
                                          .labels!
                                          .data!
                                          .assginTo!
                                          .map<DropdownMenuItem<String>>(
                                              (AssginTo value) {
                                        return DropdownMenuItem<String>(
                                          value: value.id,
                                          child: Text(
                                            value.text.toString(),
                                                 style: StylesData.font14
                                        .copyWith(color: Colors.black),
                                          ),
                                        );
                                      })
                                    ],
                                    hint:  Text(
                                      "label",
                                      style: StylesData.font14
                                        .copyWith(color: Colors.black),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        labelItem = value;
                                      });
                                      ShowTicketsCubit.get(context)
                                          .getTicketsList(
                                              ticketLabel: labelItem ?? '',
                                              ticketType: typeItem ?? '',
                                              assignedTo: assginToItem ?? '',
                                              search: searchCont.text,
                                              status: statusItem ?? '');
                                    },
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  DropdownButton<String>(
                                    style: StylesData.font14
                                        .copyWith(color: Colors.black),
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.grey.withOpacity(.4),
                                    ),
                                    value: assginToItem,
                                    //elevation: 5,

                                    items: [
                                      const DropdownMenuItem<String>(
                                        value: '',
                                        child: Text(
                                          'assgin To',
                                        ),
                                      ),
                                      ...AddticketCubit.get(context)
                                          .assginTo
                                          .map<DropdownMenuItem<String>>(
                                              (ClientModel value) {
                                        return DropdownMenuItem<String>(
                                          value: value.id.toString(),
                                          child: Text(
                                            value.name.toString(),
                                               style: StylesData.font14
                                        .copyWith(color: Colors.black),
                                          ),
                                        );
                                      })
                                    ],
                                    hint:  Text(
                                      "assgin To",
                                      style: StylesData.font14
                                        .copyWith(color: Colors.black),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        assginToItem = value;
                                      });
                                      ShowTicketsCubit.get(context)
                                          .getTicketsList(
                                              ticketLabel: labelItem ?? '',
                                              ticketType: typeItem ?? '',
                                              assignedTo: assginToItem ?? '',
                                              search: searchCont.text,
                                              status: statusItem ?? '');
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    );
                  } else if (state is GetLabelsFailure) {
                    return Center(
                      child: Text(state.errorMsq),
                    );
                  } else if (state is GetAssignToFailuire) {
                    return Center(
                      child: Text(state.errorMsq),
                    );
                  } else if (state is GetRequestedByFailuire) {
                    return Center(
                      child: Text(state.errorMsq),
                    );
                  } 
                  else if (state is GetAllFiledFailuire) {
                    return Center(
                      child: Text(state.errorMsq),
                    );
                  }
                  else {
                    return const LinearProgressIndicator();
                  }
                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            BlocConsumer<ShowTicketsCubit, ShowTicketsState>(
              builder: (context, state) {
                if (state is GetTicketsListSucc) {
                  if (state.model.data!.ticket!.isEmpty) {
                    return const Expanded(
                      child: Center(
                        child: SingleChildScrollView(child: EmptyTicketsWidget()),
                      ),
                    );
                  }
                  return Expanded(
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
                            DataColumnItem(txt: 'Status'),
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
                                            item?.assignedToUser ?? '',
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
                                      SizedBox(
                                        width: 150,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                item?.requestedByName ?? '',
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
                                      Center(
                                        child: Container(
                                          width: 100,
                                          height: 30,
                                          padding: const EdgeInsets.symmetric(),
                                          decoration: ShapeDecoration(
                                            color: getStatusColor(item?.status),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              item?.status ?? '',
                                              maxLines: 1,
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.rubik(
                                                textStyle: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
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
                                          NavegatorPush(
                                              context,
                                              TicketInfoScreen(
                                                  id: int.parse(item.id!)));
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
                  );
                } else if (state is GetTicketsListFailuire) {
                  return const FailureWidget();
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
              listener: (BuildContext context, ShowTicketsState state) {},
            ),
          ],
        ),
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
