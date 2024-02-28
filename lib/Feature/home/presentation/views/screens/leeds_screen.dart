import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tqniaapp/Core/constans/const.dart';
import 'package:tqniaapp/Core/utils/assets_data.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/components.dart';
import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Core/widgets/faliure_wid.dart';
import 'package:tqniaapp/Feature/home/data/model/source_model/source_model.dart';
import 'package:tqniaapp/Feature/home/data/model/status_model/status_model.dart';
import 'package:tqniaapp/Feature/home/data/repo/homerepo/home_repos_imp.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/AddLead/add_lead_cubit.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/AddLead/add_lead_state.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/show%20leads/show_leads_cubit.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/show%20leads/show_leads_state.dart';
import 'package:tqniaapp/Feature/home/presentation/views/screens/leads_deatils_screen.dart';
import 'package:tqniaapp/Feature/home/presentation/views/widgets/custom_leed_appbar.dart';
import 'package:tqniaapp/Feature/home/presentation/views/widgets/leads_widget.dart';

class LeedsScreen extends StatefulWidget {
  const LeedsScreen({super.key});

  @override
  State<LeedsScreen> createState() => _LeedsScreenState();
}

class _LeedsScreenState extends State<LeedsScreen> {
  String? sourceItem;
  String? regioItem;
  String? statusItem;
  String? dateItem;
  var searchCont = TextEditingController();
  bool showFiltter = false;

  List<String> dateType = ['last_update', 'created_date', 'reach_date'];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocProvider(
        create: (context) => ShowLeadsCubit(HomeRepoImp())
          ..getHomeLeads(
            date: '',
            source: '',
            status: '',
            search: '',
          ),
        child: Column(
          children: [
            const CustomLeedAppBar(),
            const SizedBox(
              height: 10,
            ),
            BlocProvider(
              create: (context) => AddLeadCubit(HomeRepoImp())
                ..getLeadSources()
                ..getLeadStatus()
                ..getRegion(),
              child: BlocConsumer<AddLeadCubit, AddLeadState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (AddLeadCubit.get(context).sourceModel.isNotEmpty &&
                      AddLeadCubit.get(context).statusModel.isNotEmpty &&
                      AddLeadCubit.get(context).regionList.isNotEmpty) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  setState(() {
                                    showFiltter = !showFiltter;
                                    dateItem = '';
                                    sourceItem = '';
                                    statusItem = '';
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
                                    ShowLeadsCubit.get(context).getHomeLeads(
                                        date: dateItem ?? '',
                                        source: sourceItem ?? '',
                                        search: searchCont.text,
                                        status: statusItem ?? '');
                                  },
                                  controller: searchCont,
                                  hintText: 'search'),
                            ),
                          ],
                        ),
                        if (showFiltter)
                          const SizedBox(
                            height: 10,
                          ),
                        if (showFiltter)
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
                                    value: sourceItem,

                                    items: [
                                      const DropdownMenuItem<String>(
                                        value: '',
                                        child: Text(
                                          "Source",
                                        ),
                                      ),
                                      ...AddLeadCubit.get(context)
                                          .sourceModel
                                          .map<DropdownMenuItem<String>>(
                                              (SourceModel value) {
                                        return DropdownMenuItem<String>(
                                          value: value.id.toString(),
                                          child: Text(
                                            value.title.toString(),
                                            style: StylesData.font14
                                                .copyWith(color: Colors.black),
                                          ),
                                        );
                                      })
                                    ],
                                    hint: Text(
                                      "Source",
                                      style: StylesData.font14
                                          .copyWith(color: Colors.black),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        sourceItem = value;
                                      });
                                      ShowLeadsCubit.get(context).getHomeLeads(
                                          date: dateItem ?? '',
                                          source: sourceItem ?? '',
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
                                    value: regioItem,
                                    //elevation: 5,

                                    items: [
                                      const DropdownMenuItem<String>(
                                        value: '',
                                        child: Text("Region"),
                                      ),
                                      ...AddLeadCubit.get(context)
                                          .regionList
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
                                    hint: Text(
                                      "Region",
                                      style: StylesData.font14
                                          .copyWith(color: Colors.black),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        regioItem = value;
                                      });
                                      ShowLeadsCubit.get(context).getHomeLeads(
                                          date: dateItem ?? '',
                                          source: sourceItem ?? '',
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
                                        child: Text(
                                          'Status',
                                        ),
                                      ),
                                      ...AddLeadCubit.get(context)
                                          .statusModel
                                          .map<DropdownMenuItem<String>>(
                                              (StatusModel value) {
                                        return DropdownMenuItem<String>(
                                          value: value.id,
                                          child: Text(
                                            value.title.toString(),
                                            style: StylesData.font14
                                                .copyWith(color: Colors.black),
                                          ),
                                        );
                                      })
                                    ],
                                    hint: Text(
                                      "Status",
                                      style: StylesData.font14
                                          .copyWith(color: Colors.black),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        statusItem = value;
                                      });
                                      ShowLeadsCubit.get(context).getHomeLeads(
                                          date: dateItem ?? '',
                                          source: sourceItem ?? '',
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
                                    value: dateItem,
                                    //elevation: 5,

                                    items: [
                                      const DropdownMenuItem<String>(
                                        value: '',
                                        child: Text(
                                          'Date',
                                        ),
                                      ),
                                      ...dateType.map<DropdownMenuItem<String>>(
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
                                    hint: Text(
                                      "Date",
                                      style: StylesData.font14
                                          .copyWith(color: Colors.black),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        dateItem = value;
                                      });
                                      ShowLeadsCubit.get(context).getHomeLeads(
                                          date: dateItem ?? '',
                                          source: sourceItem ?? '',
                                          search: searchCont.text,
                                          status: statusItem ?? '');
                                    },
                                  ),
                                ],
                              ),
                            ),
                          )
                      ],
                    );
                  } else if (state is GetLeadStatusEroor) {
                    return Center(
                      child: Text(state.errorText),
                    );
                  } else if (state is GetSourceEroor) {
                    return Center(
                      child: Text(state.errorText),
                    );
                  } else {
                    return const LinearProgressIndicator();
                  }
                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: BlocConsumer<ShowLeadsCubit, ShowLeadsState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is ShowLeadssucc) {
                    if (state.model.data!.leads!.isEmpty) {
                      return const Center(child: LeadsEmptyWidget());
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
                              DataColumn(
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
                                      'Lead name',
                                      style: StylesData.font12.copyWith(
                                          color: const Color(0xFFE92929)),
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(
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
                                      'Status',
                                      style: StylesData.font12.copyWith(
                                          color: const Color(0xFFE92929)),
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(
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
                                      'Phone number',
                                      style: StylesData.font12.copyWith(
                                          color: const Color(0xFFE92929)),
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(
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
                                      'Last Update',
                                      style: StylesData.font12.copyWith(
                                          color: const Color(0xFFE92929)),
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(
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
                                      'Follow Date',
                                      style: StylesData.font12.copyWith(
                                          color: const Color(0xFFE92929)),
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(
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
                                      'Industry',
                                      style: StylesData.font12.copyWith(
                                          color: const Color(0xFFE92929)),
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(
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
                                      'Region',
                                      style: StylesData.font12.copyWith(
                                          color: const Color(0xFFE92929)),
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(
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
                                      'Action',
                                      style: StylesData.font12.copyWith(
                                          color: const Color(0xFFE92929)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                            rows: List<DataRow>.generate(
                              ((state.model.data?.leads?.length)!),
                              (index) {
                                final item = state.model.data?.leads?[index];
                                return DataRow(
                                    color: MaterialStateProperty.resolveWith(
                                        getColor),
                                    cells: [
                                      DataCell(
                                        Center(
                                          child: InkWell(
                                            onTap: () {
                                              editModel = item;
                                              NavegatorPush(
                                                context,
                                                LeedsDetiles(
                                                    id: int.parse(
                                                        editModel!.id!)),
                                              );
                                            },
                                            child: SizedBox(
                                              width: 150,
                                              child: Text(
                                                item?.companyName ?? '',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: StylesData.font12
                                                    .copyWith(
                                                        color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Center(
                                          child: Container(
                                            width: 83,
                                            height: 30,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            decoration: ShapeDecoration(
                                              color: colorHex(
                                                  item?.leadStatusColor ?? ''),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                item?.leadStatusTitle ?? '',
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
                                        Center(
                                          child: SizedBox(
                                            width: 150,
                                            child: InkWell(
                                              onTap: (){
                                                openDialPad(item?.phone ?? '');
                                              },
                                              child: Text(
                                                item?.phone ?? '',
                                                textAlign: TextAlign.center,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: StylesData.font12.copyWith(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Center(
                                          child: SizedBox(
                                            width: 150,
                                            child: Text(
                                              item?.lastUpdate ?? '',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style: StylesData.font12.copyWith(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Center(
                                          child: SizedBox(
                                            width: 150,
                                            child: Text(
                                              item?.followDate ?? '',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style: StylesData.font12.copyWith(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Center(
                                          child: SizedBox(
                                            width: 150,
                                            child: Text(
                                              item?.industry ?? '',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style: StylesData.font12.copyWith(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Center(
                                          child: SizedBox(
                                            width: 150,
                                            child: Text(
                                              item?.region ?? '',
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: StylesData.font12.copyWith(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                      DataCell(Center(
                                        child: InkWell(
                                          onTap: () {
                                            editModel = item;
                                            NavegatorPush(
                                              context,
                                              LeedsDetiles(
                                                  id: int.parse(
                                                      editModel!.id!)),
                                            );
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
                  } else if (state is ShowLeadsfailure) {
                    return const FailureWidget();
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color getColor(Set<MaterialState> states) {
    return Colors.white;
  }
}
