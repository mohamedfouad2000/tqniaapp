import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tqniaapp/Core/utils/assets_data.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/components.dart';
import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Core/widgets/faliure_wid.dart';
import 'package:tqniaapp/Feature/home/data/repo/add_calls_repo/add_calls_repo_imp.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/add%20calls/add_calls_cubit.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/add%20calls/add_calls_state.dart';
import 'package:tqniaapp/Feature/home/presentation/views/screens/edit_calls_form.dart';

// ignore: must_be_immutable
class CallesScreen extends StatelessWidget {
  CallesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCallsCubit(AddCallsRepoImp())..getCalls(),
      child: BlocConsumer<AddCallsCubit, AddCallsState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetCallsSucc) {
            if (state.model.data!.calls!.isEmpty) {
              return const Center(child: Text("Empty List "));
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
                            DataColumnItem(txt: 'State'),
                            DataColumnItem(txt: 'Note'),
                            DataColumnItem(txt: 'Created date'),
                            DataColumnItem(txt: 'Action'),
                          ],
                          rows: List<DataRow>.generate(
                            state.model.data!.calls!.length,
                            (index) {
                              final item = state.model.data!.calls![index];
                              return DataRow(
                                  // color: MaterialStateProperty.resolveWith(getColor),
                                  cells: [
                                    DataCell(
                                      Center(
                                        child: Text(
                                          item.status.toString(),
                                          style: StylesData.font12
                                              .copyWith(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Center(
                                        child: Text(
                                          item.notes.toString(),
                                          style: StylesData.font12
                                              .copyWith(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Center(
                                        child: Text(
                                          item.createdAt.toString(),
                                          style: StylesData.font12
                                              .copyWith(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    DataCell(Center(
                                      child: InkWell(
                                        onTap: () {
                                          NavegatorPush(context,
                                              EditCallsForm(model: item));
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
          } else if (state is GetCallsfail) {
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

  DataColumn DataColumnItem({required String txt}) {
    return DataColumn(
      label: Container(
        width: 136,
        height: 42,
        decoration: ShapeDecoration(
          color: const Color(0x33E92929),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Center(
          child: Text(
            txt,
            style: StylesData.font12.copyWith(color: const Color(0xFFE92929)),
          ),
        ),
      ),
    );
  }

  List<dynamic> data = [
    {
      "State": "Answered",
      "Note": 'Test',
      "Created date": "Test",
      'Action': 'Action',
    },
  ];
}
