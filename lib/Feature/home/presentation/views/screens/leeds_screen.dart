import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tqniaapp/Core/constans/const.dart';
import 'package:tqniaapp/Core/utils/assets_data.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/components.dart';
import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Core/widgets/faliure_wid.dart';
import 'package:tqniaapp/Feature/home/data/repo/homerepo/home_repos_imp.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/show%20leads/show_leads_cubit.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/show%20leads/show_leads_state.dart';
import 'package:tqniaapp/Feature/home/presentation/views/screens/leads_deatils_screen.dart';
import 'package:tqniaapp/Feature/home/presentation/views/widgets/custom_leed_appbar.dart';
import 'package:tqniaapp/Feature/home/presentation/views/widgets/leads_widget.dart';

class LeedsScreen extends StatelessWidget {
  const LeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShowLeadsCubit(HomeRepoImp())..getHomeLeads(),
      child: BlocConsumer<ShowLeadsCubit, ShowLeadsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is ShowLeadssucc) {
            if (state.model.data!.leads!.isEmpty) {
              return const Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(child: LeadsEmptyWidget()),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomLeedAppBar(),
                  const SizedBox(
                    height: 10,
                  ),
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
                                        child: Container(
                                          width: 150,
                                          child: Text(
                                            item?.companyName ?? '',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
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
                                        child: Container(
                                          width: 150,
                                          child: Text(
                                            item?.phone ?? '',
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
                                        child: Container(
                                          width: 150,
                                          child: Text(
                                            item?.lastUpdate ?? '',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
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
                                          width: 150,
                                          child: Text(
                                            item?.followDate ?? '',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
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
                                          width: 150,
                                          child: Text(
                                            item?.currency ?? '',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
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
                                          width: 150,
                                          child: Text(
                                            item?.city ?? '',
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: StylesData.font12
                                                .copyWith(color: Colors.black),
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
                                                id: int.parse(editModel!.id!)),
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
                  ),
                ],
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
    );
  }

  Color getColor(Set<MaterialState> states) {
    return Colors.white;
  }
}
